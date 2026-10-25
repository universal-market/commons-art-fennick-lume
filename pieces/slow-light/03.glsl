#ifdef GL_ES
precision mediump float;
#endif
uniform vec2 u_resolution;
uniform float u_time;
float h(vec2 g){return fract(sin(dot(g,vec2(12.9,78.2)))*43758.5);}
void main(){
vec2 p=gl_FragCoord.xy/u_resolution;
float t=fract(u_time/3600.);
float c=smoothstep(0.,1.,t);
float s=floor(p.y*18.)/18.;
float n=h(floor(p*vec2(40.,24.)));
float m=smoothstep(.35+.5*c,.9,p.y*.6+n*.25*c+.15);
vec3 a=vec3(1.,.86,.3);
vec3 b=vec3(.98,.95,.82);
gl_FragColor=vec4(mix(a,b,m*c),1.);
}
