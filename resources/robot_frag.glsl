#version 330 core
in vec3 fragNor;
out vec4 color;

/* Very simple Diffuse shader with a directional light*/
void main()
{
	vec3 Dcolor, Scolor;
  vec3 Dlight = vec3(1, 1, 1);
	vec3 normal = normalize(fragNor);
  vec3 Ncolor = 0.5 * normal + 0.5;
  vec3 MatDif = vec3(0.3f, 0.3f, 0.4f);
	Dcolor = MatDif*max(dot(normalize(Dlight), normal), 0)+Ncolor;
	color = vec4(Dcolor, 1.0);
}
