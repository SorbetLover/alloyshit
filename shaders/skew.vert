#pragma header

uniform vec2 skew;

void main() {
  vec2 pos = openfl_Position;
  pos += skew * (pos - 0.5);

  openfl_Alphav = openfl_Alpha;
  openfl_TextureCoordv = openfl_TextureCoord;

  if (openfl_HasColorTransform) {
    openfl_ColorMultiplierv = openfl_ColorMultiplier;
    openfl_ColorOffsetv = openfl_ColorOffset / 255.0;
  }

  gl_Position = openfl_Matrix * pos;
}