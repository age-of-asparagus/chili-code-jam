shader_type canvas_item;
render_mode light_only;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_linear_mipmap;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	//COLOR = textureLod(screen_texture, SCREEN_UV, 0.0);
	//COLOR = texture(TEXTURE, UV);

    //vec4 tex_color = texture(TEXTURE, UV);

    // Sample the screen texture at this fragment's position.
    //vec4 light_color = texture(screen_texture, SCREEN_UV);
//
	//
	////COLOR.a=COLOR.r;
	//if (length(light_color.rgb) < 3.0) {
		//COLOR.a = length(light_color.rgb)/3.0;
	//}
}

void light() {
	 //Called for every pixel for every light affecting the CanvasItem.
	 //Uncomment to replace the default light processing function with this one

	LIGHT=COLOR;
}
