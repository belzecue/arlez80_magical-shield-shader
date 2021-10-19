/*
	魔法防御シェーダー by あるる（きのもと 結衣）
	Magical Shield Shader by Yui Kinomoto @arlez80

	MIT License
*/

shader_type spatial;
render_mode unshaded, depth_draw_never;

uniform vec4 color : hint_color = vec4( 0.05, 1.0, 0.5, 1.0 );
uniform float force = 1.0;

void fragment( )
{
	ALBEDO = color.rgb;
	ALPHA = clamp( ( 1.0 - dot( NORMAL, VIEW ) ) * force, 0.0, 1.0 );
}
