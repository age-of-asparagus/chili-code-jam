shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_linear_mipmap;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {

    vec4 tex_color = texture(TEXTURE, UV);

    // Sample the screen texture at this fragment's position.
    vec4 light_color = texture(screen_texture, SCREEN_UV);
    
	// https://stackoverflow.com/questions/596216/formula-to-determine-perceived-brightness-of-rgb-color
    float luminance = (tex_color.r + tex_color.g + tex_color.b)/3.0;
    // set the alpha based on darkness at that point
	
    COLOR.a = luminance;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
