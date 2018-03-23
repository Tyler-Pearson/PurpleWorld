#version 330 core
layout(location = 0) in vec4 vertPos;
layout(location = 1) in vec3 vertNor;
flat out vec3 fragNor;
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;
uniform float uTime;

out float time;

void main()
{
	gl_Position = P * V * M * vertPos;
	gl_Position.y += sin((gl_Position.y + uTime)*5);
	fragNor = (M * vec4(vertNor, 0.0)).xyz;
	time = uTime;
}
