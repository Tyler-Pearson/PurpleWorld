#version 330 core
in vec3 fragNor;
out vec4 color;

void main()
{
  vec3 normal = normalize(fragNor);
  vec3 Ncolor = 0.5 * normal + 0.5;
	color = vec4(Ncolor, 1.0);
}
