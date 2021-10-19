/*
	魔法防御シェーダー 3 by あるる（きのもと 結衣）
	Magical Shield Shader 3 by Yui Kinomoto @arlez80

	MIT License
*/

shader_type spatial;
render_mode unshaded, depth_draw_never;

uniform vec2 speed = vec2( 0.2, 0.2 );
uniform vec4 barrier_color : hint_color = vec4( 0.05, 0.8, 1.0, 1.0 );
uniform float barrier_force = 1.0;
uniform float barrier_noise_force = 0.6;
uniform float barrier_fog_noise_force = 0.3;
uniform sampler2D barrier_noise : hint_normal;

void fragment( )
{
	float rim = pow( 1.0 - dot( NORMAL, VIEW ), 4.0 ) * barrier_force;

	vec2 p = texture( barrier_noise, -UV ).xy + TIME * speed;
	float line_noise = clamp( ( sin( texture( barrier_noise, p ).r * 3.1415926535 ) - 0.995 ) * 90.0, 0.0, 1.0 ) * barrier_noise_force;

	float fog_noise = texture( barrier_noise, vec2( UV.x * 8.0 - TIME * speed.x, UV.y * 8.0 ) ).r * barrier_fog_noise_force;

	ALBEDO = barrier_color.rgb;
	ALPHA = clamp( rim + line_noise + fog_noise, 0.0, 1.0 );
}
