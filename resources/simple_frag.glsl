#version 330 core
flat in vec3 fragNor;
in vec3 WPos;
//to send the color to a frame buffer
layout(location = 0) out vec4 color;

uniform vec3 MatAmb;
uniform vec3 MatDif;
uniform float uTime;
uniform int DirVal;
uniform int PicVal;

/* Very simple Diffuse shader with a directional light*/
void main()
{
	vec3 amb = MatAmb;
	if (WPos.y > 120 || PicVal == 1) {
	 	amb = vec3(0.4, 0, 0.4);
	}
	else if (WPos.y > 30) {
		amb = vec3(0.9, 0.9, 0.9);
	}
	else if (WPos.y < -15) {
		amb = vec3(.73, .67, .23);
	}
	vec3 Dlight;
	if (DirVal == 0) {
		Dlight = vec3(sin(uTime/1.5), 0.2, cos(uTime/1.5));
	}
	else if (DirVal == 1) {
		Dlight = vec3(1, 0.2, -1);
	}
	else if (DirVal == 2) {
		Dlight = vec3(-1, 0.2, -1);
	}
	else if (DirVal == 3) {
		Dlight = vec3(-1, 0.2, 1);
	}
	else if (DirVal == 4) {
		Dlight = vec3(1, 0.2, 1);
	}
	vec3 Dcolor, Scolor;
	vec3 normal = normalize(fragNor);
	vec3 MatSpec = vec3(0.1f, 0.1f, 0.1f);
	vec3 R = normalize(2.0*dot(normal, normalize(Dlight))*normal - Dlight);
	float cosAngle = max(0.0, dot(normal, R));
	Scolor = cosAngle*MatSpec;
	Dcolor = MatDif*dot(normal, normalize(Dlight))+amb;
	if (PicVal == 0 || PicVal == 1) {
	color = vec4(Dcolor+Scolor, 1.0);
	}
	else {
		color = vec4(0.4*normal+0.4, 1.0);
	}
}
