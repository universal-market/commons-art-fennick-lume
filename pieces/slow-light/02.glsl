precision mediump float;
uniform float u_time;
uniform vec2 u_resolution;
float h(vec2 p){return fract(sin(dot(p,vec2(12.9,78.2)))*43758.5);}
void main(){
vec2 uv=gl_FragCoord.xy/u_resolution;
float t=fract(u_time/3600.0);
float x=abs(uv.x-.5)*2.;
float lvl=.25+.45*smoothstep(0.,.88,t);
float dome=.06*(1.-x)*smoothstep(.6,1.,t);
float sink=.05*x*smoothstep(.85,1.,t);
float s=lvl+dome-sink;
vec3 c=mix(vec3(.97,.94,.86),vec3(.84,.76,.6),step(uv.y,s));
vec2 g=floor(uv*vec2(14.,22.));
float b=step(.93,h(g))*step(uv.y,s-.03)*step(.5,uv.y)*(.4+.6*smoothstep(.7,1.,t));
c=mix(c,vec3(1.,.98,.92),b*.7);
gl_FragColor=vec4(c,1.);
}
