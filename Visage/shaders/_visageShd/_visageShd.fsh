//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 outCol = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (v_vTexcoord.x - .25 > .5){
		outCol.a = 0.0;	
	}
    gl_FragColor = outCol;
}
