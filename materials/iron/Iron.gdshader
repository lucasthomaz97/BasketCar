shader_type spatial;
render_mode specular_schlick_ggx;

uniform vec4 ColorUniform : source_color;
uniform float HowShiny = 2;
uniform float Roughness = 0.2;

void vertex() {
// Output:0

}

void fragment() {
// ColorUniform:4
	vec3 n_out4p0 = ColorUniform.rgb;
	float n_out4p1 = ColorUniform.a;

// ScalarUniform:2
	float n_out2p0 = HowShiny;

// ScalarUniform:3
	float n_out3p0 = Roughness;

// Output:0
	ALBEDO = n_out4p0;
	METALLIC = n_out2p0;
	ROUGHNESS = n_out3p0;

}

void light() {
// Output:0

}
