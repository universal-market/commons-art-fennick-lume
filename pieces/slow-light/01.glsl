precision mediump float;
uniform float u_time;
uniform vec2 u_resolution;
float h(vec2 p){return fract(sin(dot(p,vec2(12.9,78.2)))*43758.5);}
void main(){
vec2 uv=gl_FragCoord.xy/u_resolution;
float t=fract(u_time/3600.0);
float lvl=0.25+0.45*t*(2.0-t);
vec3 c=mix(vec3(0.97,0.94,0.86),vec3(0.84,0.76,0.6),step(uv.y,lvl));
vec2 g=floor(uv*vec2(14.,22.));
float b=step(0.9,h(g))*step(uv.y,lvl-0.03)*step(0.5,uv.y);
c=mix(c,vec3(1.,.98,.92),b*0.7);
gl_FragColor=vec4(c,1.);
}
