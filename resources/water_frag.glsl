#version 330 core
flat in vec3 fragNor;
in float time;
uniform int DirVal;
uniform int PicVal;
out vec4 color;

/* Very simple Diffuse shader with a directional light*/
void main()
{
	vec3 Dlight;
	if (DirVal == 0) {
		Dlight = vec3(sin(time/1.5), 0.2, cos(time/1.5));
	}
	else if (DirVal == 1) {
		Dlight = vec3(1, 1, -1);
	}
	else if (DirVal == 2) {
		Dlight = vec3(-1, 1, -1);
	}
	else if (DirVal == 3) {
		Dlight = vec3(-1, 1, 1);
	}
	else if (DirVal == 4) {
		Dlight = vec3(1, 1, 1);
	}
	vec3 Dcolor, Scolor;
	vec3 normal = normalize(fragNor);
  vec3 MatAmb = vec3(0.0f, 0.545f, 0.545f);
	if (PicVal == 1) {
		MatAmb = vec3(0.4, 0, 0.4);
	}
  vec3 MatDif = vec3(0.05f, 0.05f, 0.15f);
	vec3 MatSpec = vec3(0.2f, 0.2f, 0.2f);
	vec3 R = normalize(2.0*dot(normal, Dlight)*normal - Dlight);
	float cosAngle = max(0.0, dot(normal, R));
	Scolor = cosAngle*MatSpec;
	Dcolor = MatDif*max(dot(normalize(Dlight), normal), 0)+MatAmb;
	if (PicVal == 0 || PicVal == 1) {
		color = vec4(Dcolor+Scolor, 1.0);
	}
	else {
		color = vec4(0.5*normal+0.5, 1.0);
	}
}
