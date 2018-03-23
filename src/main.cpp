/*
Base code
Currently will make 2 FBOs and textures (only uses one in base code)
and writes out frame as a .png (Texture_output.png)

Winter 2017 - ZJW (Piddington texture write)
2017 integration with pitch and yaw camera lab (set up for texture mapping lab)
*/

#include <iostream>
#include <glad/glad.h>
#include <stdlib.h>

#include "GLSL.h"
#include "Program.h"
#include "MatrixStack.h"
#include "Shape.h"
#include "WindowManager.h"
#include "GLTextureWriter.h"
#include "HeightGenerator.h"

// value_ptr for glm
#include <glm/gtc/type_ptr.hpp>
#include <glm/gtc/matrix_transform.hpp>

using namespace std;
using namespace glm;

class Application : public EventCallbacks
{

public:

	WindowManager * windowManager = nullptr;

	// Our shader program
	shared_ptr<Program> prog;
	shared_ptr<Program> texProg;
	shared_ptr<Program> waterProg;

	// Shape to be used (from obj file)
	shared_ptr<Shape> sphere;
	shared_ptr<Shape> terrain;
	shared_ptr<Shape> water;

	const int wWidth = 120;
	const int wDepth = 120;
	const int tWidth = 100;
	const int tDepth = 100;
	HeightGenerator heightGenerator = HeightGenerator(tWidth+1, tDepth+1);

	// Contains vertex information for OpenGL
	GLuint VertexArrayID;

	// Data necessary to give our triangle to OpenGL
	GLuint VertexBufferID;

	//geometry for texture render
	GLuint quad_VertexArrayID;
	GLuint quad_vertexbuffer;

	//reference to texture FBO
	GLuint frameBuf[2];
	GLuint texBuf[2];
	GLuint depthBuf;
	vector<float> water_buf;

	float rTheta = 0;
	float wTheta = 0;
	int dirVal = 0;
	int picVal = 0;
	float cTheta = 3.14/2;
	float phi = 0;
	vec3 camPos = vec3(0, 100, -25);

	void keyCallback(GLFWwindow *window, int key, int scancode, int action, int mods)
	{
		vec3 up = vec3(0, 1, 0);
		vec3 forward = vec3(cos(cTheta)*cos(phi), sin(phi), sin(cTheta)*cos(phi)) * vec3(2.0, 2.0, 2.0);
		vec3 right = cross(forward, up);
		if(key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
		{
			glfwSetWindowShouldClose(window, GL_TRUE);
		}
		else if (key == GLFW_KEY_A)
		{
			camPos -= right;
		}
		else if (key == GLFW_KEY_D)
		{
			camPos += right;
		}
		else if (key == GLFW_KEY_W)
		{
			camPos += forward;
		}
		else if (key == GLFW_KEY_S)
		{
			camPos -= forward;
		}
		else if (key == GLFW_KEY_Q)
		{
			camPos += vec3(0, 1.0, 0);
		}
		else if (key == GLFW_KEY_E)
		{
			camPos -= vec3(0, 1.0, 0);
		}
		else if (key == GLFW_KEY_C && action == GLFW_PRESS)
		{
			dirVal += 1;
			dirVal %= 5;
		}
		else if (key == GLFW_KEY_P && action == GLFW_PRESS)
		{
			picVal += 1;
			picVal %= 3;
		}
	}

	void scrollCallback(GLFWwindow* window, double deltaX, double deltaY)
	{
	}

	void mouseCallback(GLFWwindow *window, int button, int action, int mods)
	{
		double posX, posY;

		if (action == GLFW_PRESS)
		{
			glfwGetCursorPos(window, &posX, &posY);
			cout << "Pos X " << posX << " Pos Y " << posY << endl;
		}
	}

	void cursorPosCallback(GLFWwindow* window, double xpos, double ypos)
	{
		int width, height;
		glfwGetWindowSize(window, &width, &height);
		if (xpos > width/2) {
			cTheta += 0.02;
		}
		if (xpos < width/2) {
			cTheta -= 0.02;
		}
		if (ypos > height/2 && phi > -1) {
			phi -= 0.02;
		}
		if (ypos < height/2 && phi < 1) {
			phi += 0.02;
		}
		glfwSetCursorPos(window, width/2, height/2);
	}

	void resizeCallback(GLFWwindow *window, int width, int height)
	{
		glViewport(0, 0, width, height);
	}

	void init(const std::string& resourceDirectory)
	{
		int width, height;
		srand(time(NULL));
		glfwGetFramebufferSize(windowManager->getHandle(), &width, &height);
		glfwSetInputMode(windowManager->getHandle(), GLFW_CURSOR, GLFW_CURSOR_HIDDEN);
		GLSL::checkVersion();

		// Set background color.
		glClearColor(0.f, 0.f, 0.06f, 1.0f);
		// Enable z-buffer test.
		glEnable(GL_DEPTH_TEST);

		//Water prog
		waterProg = std::make_shared<Program>();
		waterProg->setVerbose(true);
		waterProg->setShaderNames(resourceDirectory + "/water_vert.glsl", resourceDirectory + "/water_frag.glsl");
		waterProg->init();
		waterProg->addUniform("P");
		waterProg->addUniform("V");
		waterProg->addUniform("M");
		waterProg->addUniform("uTime");
		waterProg->addUniform("DirVal");
		waterProg->addUniform("PicVal");
		waterProg->addAttribute("vertPos");
		waterProg->addAttribute("vertNor");


		// Initialize the GLSL program.
		prog = make_shared<Program>();
		prog->setVerbose(true);
		prog->setShaderNames(
			resourceDirectory + "/simple_vert.glsl",
			resourceDirectory + "/simple_frag.glsl");
		if (! prog->init())
		{
			std::cerr << "One or more shaders failed to compile... exiting!" << std::endl;
			exit(1);
		}
		prog->addUniform("P");
		prog->addUniform("V");
		prog->addUniform("M");
		prog->addUniform("MatAmb");
		prog->addUniform("MatDif");
		prog->addUniform("uTime");
		prog->addUniform("DirVal");
		prog->addUniform("PicVal");
		prog->addAttribute("vertPos");
		prog->addAttribute("vertNor");

		//create two frame buffer objects to toggle between
		glGenFramebuffers(2, frameBuf);
		glGenTextures(2, texBuf);
		glGenRenderbuffers(1, &depthBuf);
		createFBO(frameBuf[0], texBuf[0]);

		//set up depth necessary as rendering a mesh that needs depth test
		glBindRenderbuffer(GL_RENDERBUFFER, depthBuf);
		glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT, width, height);
		glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthBuf);

		//more FBO set up
		GLenum DrawBuffers[1] = {GL_COLOR_ATTACHMENT0};
		glDrawBuffers(1, DrawBuffers);

		//create another FBO so we can swap back and forth
		createFBO(frameBuf[1], texBuf[1]);
		//this one doesn't need depth
	 }


	 void getMesh(shared_ptr<Shape> mesh, int w, int d, vector<float> heights) {

		 // Get vertices
		 int vertCount = (d+1) * (w+1) * 3;
		 int h = 0;
		 (mesh->posBuf).assign(vertCount, 0.0);
		 for (int i = 0; i < d+1; i++) {
			 for (int j = 0; j < w+1; j++) {
				 int ind = (i * (w + 1) + j) * 3;
				 mesh->posBuf[ind] = -0.5 + float(j) / float(w);
				 mesh->posBuf[ind + 1] = heights[h++];
				 mesh->posBuf[ind + 2] = float(i) / float(d);
			 }
		 }

		 // Get indices
		 int indCount = d * w * 6;
		 (mesh->eleBuf).assign(indCount, 0.0);
		 for (int i = 0; i < d; i++) {
			 for (int j = 0; j < w; j++) {
				 int ind = (i * w + j) * 6;
				 mesh->eleBuf[ind] = i * (w + 1) + j;
				 mesh->eleBuf[ind + 1] = (i + 1) * (w + 1) + j;
				 mesh->eleBuf[ind + 2] = i * (w + 1) + j + 1;
				 mesh->eleBuf[ind + 3] = i * (w + 1) + j + 1;
				 mesh->eleBuf[ind + 4] = (i + 1) * (w + 1) + j;
				 mesh->eleBuf[ind + 5] = (i + 1) * (w + 1) + j + 1;
			 }
		 }
	 }


	 void getWater(shared_ptr<Shape> wat) {
		 // water_buf.assign((wWidth+1)*(wDepth+1), 0.f);
		 vector<float> heights((wWidth+1)*(wDepth+1), 0.f);
		 for (unsigned int i = 0; i < heights.size(); i++) {
			 heights[i] += float(rand() % 10) / 5.f;
		 }


		 getMesh(wat, wWidth, wDepth, heights);
	 }


	 void getTerrain(shared_ptr<Shape> ter) {
		 // Get heights
		 vector<float> heights = heightGenerator.generateHeight();

		 getMesh(ter, tWidth, tDepth, heights);
	 }


	 // Normal Methods
	glm::vec3 cross(glm::vec3 a, glm::vec3 b) {
		float x = float(a[1]*b[2]) - float(a[2]*b[1]);
		float y = float(a[2]*b[0]) - float(a[0]*b[2]);
		float z = float(a[0]*b[1]) - float(a[1]*b[0]);
		return vec3(x, y, z);
	}


	glm::vec3 getNormal(glm::vec3 A, glm::vec3 B, glm::vec3 C) {
		vec3 AB = vec3(B[0]-A[0], B[1]-A[1], B[2]-A[2]);
		vec3 AC = vec3(C[0]-A[0], C[1]-A[1], C[2]-A[2]);
		return cross(AB, AC);
	}


	void setNormals(shared_ptr<Shape>& thing) {
		vector<unsigned int> elem = thing->eleBuf;
		vector<float> pos = thing->posBuf;
		(thing->norBuf).assign(pos.size(), 0.0);

		for (unsigned int i = 0; i < (elem.size() / 3); i++) {
			int a = 3*elem[3*i];
			int b = 3*elem[3*i+1];
			int c = 3*elem[3*i+2];
			glm::vec3 A = vec3(pos[a], pos[a+1], pos[a+2]);
			glm::vec3 B = vec3(pos[b], pos[b+1], pos[b+2]);
			glm::vec3 C = vec3(pos[c], pos[c+1], pos[c+2]);
			glm::vec3 normal = getNormal(A, B, C);
			thing->norBuf[a] += normal[0];
			thing->norBuf[b] += normal[0];
			thing->norBuf[c] += normal[0];
			thing->norBuf[a+1] += normal[1];
			thing->norBuf[b+1] += normal[1];
			thing->norBuf[c+1] += normal[1];
			thing->norBuf[a+2] += normal[2];
			thing->norBuf[b+2] += normal[2];
			thing->norBuf[c+2] += normal[2];
		}
		for (unsigned int i = 0; i < thing->norBuf.size(); i++) {
			thing->norBuf[i] = roundf(thing->norBuf[i]*100000)/100000.0;
		}

		glGenBuffers(1, &(thing->norBufID));
		glBindBuffer(GL_ARRAY_BUFFER, thing->norBufID);
		glBufferData(GL_ARRAY_BUFFER, (thing->norBuf).size()*sizeof(float), (thing->norBuf).data(), GL_STATIC_DRAW);
	}

	void initGeom(const std::string& resourceDirectory)
	{
		//Sphere
		sphere = std::make_shared<Shape>();
		sphere->loadMesh(resourceDirectory + "/sphere.obj");
		sphere->resize();
		sphere->init();
		setNormals(sphere);

		// Terrain
		terrain = make_shared<Shape>();
		getTerrain(terrain);
		terrain->init();
		setNormals(terrain);

		// Water
		water = make_shared<Shape>();
		getWater(water);
		water->init();
		setNormals(water);
	}

	/**** geometry set up for a quad *****/
	void initQuad()
	{
		//now set up a simple quad for rendering FBO
		glGenVertexArrays(1, &quad_VertexArrayID);
		glBindVertexArray(quad_VertexArrayID);

		static const GLfloat g_quad_vertex_buffer_data[] =
		{
			-1.0f, -1.0f, 0.0f,
			 1.0f, -1.0f, 0.0f,
			-1.0f,  1.0f, 0.0f,
			-1.0f,  1.0f, 0.0f,
			 1.0f, -1.0f, 0.0f,
			 1.0f,  1.0f, 0.0f,
		};

		glGenBuffers(1, &quad_vertexbuffer);
		glBindBuffer(GL_ARRAY_BUFFER, quad_vertexbuffer);
		glBufferData(GL_ARRAY_BUFFER, sizeof(g_quad_vertex_buffer_data), g_quad_vertex_buffer_data, GL_STATIC_DRAW);
	}

	/* Helper function to create the framebuffer object and
		associated texture to write to */
	void createFBO(GLuint& fb, GLuint& tex)
	{
		//initialize FBO
		int width, height;
		glfwGetFramebufferSize(windowManager->getHandle(), &width, &height);

		//set up framebuffer
		glBindFramebuffer(GL_FRAMEBUFFER, fb);
		//set up texture
		glBindTexture(GL_TEXTURE_2D, tex);

		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_RGB, GL_UNSIGNED_BYTE, NULL);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);

		glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, tex, 0);

		if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE)
		{
			cout << "Error setting up frame buffer - exiting" << endl;
			exit(0);
		}
	}

	// To complete image processing on the specificed texture
	// Right now just draws large quad to the screen that is texture mapped
	// with the prior scene image - next lab we will process
	void ProcessImage(GLuint inTex)
	{
		glActiveTexture(GL_TEXTURE0);
		glBindTexture(GL_TEXTURE_2D, inTex);

		// example applying of 'drawing' the FBO texture - change shaders
		texProg->bind();
		glUniform1i(texProg->getUniform("texBuf"), 0);
		glUniform2f(texProg->getUniform("dir"), -1, 0);
		glEnableVertexAttribArray(0);
		glBindBuffer(GL_ARRAY_BUFFER, quad_vertexbuffer);
		glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, (void *) 0);
		glDrawArrays(GL_TRIANGLES, 0, 6);
		glDisableVertexAttribArray(0);
		texProg->unbind();
	}

	void render()
	{
		// Get current frame buffer size.
		int width, height;
		glfwGetFramebufferSize(windowManager->getHandle(), &width, &height);
		glViewport(0, 0, width, height);

		glBindFramebuffer(GL_FRAMEBUFFER, 0);

		// Clear framebuffer.
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

		/* Leave this code to just draw the meshes alone */
		float aspect = width/(float)height;

		// Create the matrix stacks
		auto Projection = make_shared<MatrixStack>();
		auto View = make_shared<MatrixStack>();
		auto Model = make_shared<MatrixStack>();
		// Apply perspective projection.
		Projection->pushMatrix();
		Projection->perspective(45.0f, aspect, 0.01f, 1000.0f);
		// Identity view - for now
		View->pushMatrix();
		float x = cos(phi)*cos(cTheta);
		float y = sin(phi);
		float z = cos(phi)*sin(cTheta);
		View->lookAt(camPos, vec3(x, y, z)+camPos, vec3(0, 1, 0));

		// globl transforms for 'camera' (you will fix this now!)
		Model->pushMatrix();
		Model->loadIdentity();


		// Draw Water
		// setWater();
		waterProg->bind();
		glUniformMatrix4fv(waterProg->getUniform("P"), 1, GL_FALSE, value_ptr(Projection->topMatrix()));
		glUniformMatrix4fv(waterProg->getUniform("V"), 1, GL_FALSE, value_ptr(View->topMatrix()));
		glUniform1f(waterProg->getUniform("uTime"), glfwGetTime());
		glUniform1i(waterProg->getUniform("DirVal"), dirVal);
		glUniform1i(waterProg->getUniform("PicVal"), picVal);
		Model->pushMatrix();
		Model->loadIdentity();
		Model->translate(vec3(0, -20, 10));
		Model->scale(vec3(400.f, 1.f, 400.f));
		glUniformMatrix4fv(waterProg->getUniform("M"), 1, GL_FALSE,value_ptr(Model->topMatrix()) );
		water->draw(prog);
		Model->popMatrix();
		wTheta += 0.04;
		waterProg->unbind();

		// Moon
		prog->bind();
		glUniformMatrix4fv(prog->getUniform("P"), 1, GL_FALSE, value_ptr(Projection->topMatrix()));
		glUniformMatrix4fv(prog->getUniform("V"), 1, GL_FALSE, value_ptr(View->topMatrix()));
		Model->pushMatrix();
		Model->translate(vec3(-175, 175, 400));
		Model->rotate(3.14f + rTheta, vec3(0, 1, 0));
		Model->rotate(radians(-90.f), vec3(1, 0, 0));
		glUniform3f(prog->getUniform("MatAmb"), 0.22, 0.4, 0);
		glUniform3f(prog->getUniform("MatDif"), 0.12, 0.12, 0.12);
		glUniform1f(prog->getUniform("uTime"), glfwGetTime());
		glUniform1i(prog->getUniform("DirVal"), dirVal);
		glUniform1i(prog->getUniform("PicVal"), picVal);
		Model->scale(vec3(15.f, 15.f, 15.f));
		glUniformMatrix4fv(prog->getUniform("M"), 1, GL_FALSE,value_ptr(Model->topMatrix()) );
		sphere->draw(prog);
		Model->popMatrix();
		rTheta += 0.04;
		Model->popMatrix();

		// Draw Terrain
		Model->pushMatrix();
		Model->loadIdentity();
		Model->translate(vec3(0, 0, 10));
		Model->scale(vec3(400.f, 180.f, 400.f));
		glUniformMatrix4fv(prog->getUniform("M"), 1, GL_FALSE,value_ptr(Model->topMatrix()) );
		terrain->draw(prog);
		Model->popMatrix();


		Projection->popMatrix();
		View->popMatrix();

		prog->unbind();
	}

	// void setWater() {
	// 	for (unsigned int i = 0; i < water_buf.size(); i++) {
	// 		water->posBuf[3*i+1] = sin((water_buf[i] + wTheta)*3);
	// 	}
	// 	water->init();
	// 	setNormals(water);
	// }

};

int main(int argc, char **argv)
{
	// Where the resources are loaded from
	std::string resourceDir = "../resources";

	if (argc >= 2)
	{
			resourceDir = argv[1];
	}

	Application *application = new Application();

	// Your main will always include a similar set up to establish your window
	// and GL context, etc.

	WindowManager *windowManager = new WindowManager();
	windowManager->init(1224, 712);
	windowManager->setEventCallbacks(application);
	application->windowManager = windowManager;

	// This is the code that will likely change program to program as you
	// may need to initialize or set up different data and state

	application->init(resourceDir);
	application->initGeom(resourceDir);

	// Loop until the user closes the window.
	while (! glfwWindowShouldClose(windowManager->getHandle()))
	{
			// Render scene.
			application->render();

			// Swap front and back buffers.
			glfwSwapBuffers(windowManager->getHandle());
			// Poll for and process events.
			glfwPollEvents();
	}

	// Quit program.
	windowManager->shutdown();
	return 0;
}
