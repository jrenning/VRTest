shader_type spatial;

uniform sampler2D height_map;
uniform vec4 first_color: source_color = vec4(1.0);
uniform vec4 second_color: source_color = vec4(0.0);
uniform float position: hint_range(0.0, 1.0, 0.1) = 0.5;
uniform float size: hint_range(0.5, 2.0, 0.1) = 0.5;
uniform float angle: hint_range(0.0, 360.0, 20.0) = 180.0;



void vertex() {

}

void fragment() {
	ALBEDO = second_color.rgb + vec3(UV.x, UV.y, UV.x/UV.y);
}
