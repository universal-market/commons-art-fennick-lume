precision mediump float;
uniform vec2 u_resolution;
uniform float u_time;
void main(){
vec2 p=(gl_FragCoord.xy-.5*u_resolution)/u_resolution.y;
float t=fract(u_time/3600.);
float d=length(p);
float ring=smoothstep(.012,0.,abs(d-t*.5));
float seed=step(fract(sin(dot(floor(p*40.),vec2(12.9,78.2)))*43758.5),.04*t);
vec3 c=mix(vec3(.95,.85,.4),vec3(.3,.6,.9),d);
gl_FragColor=vec4(c*(.3+ring)+seed*vec3(1.),1.);
}
