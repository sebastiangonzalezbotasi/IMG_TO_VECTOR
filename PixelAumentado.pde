// Autor: "Sebastian G. Botasi" <sgonzalez@bionimio.com.ar>
//=====================================================================

class PixelAumentado {

  //Propiedades
  PGraphics grafico;
  int x, y; //posiciones X e Y
  int ancho, alto; //tamanio del Pixel
  float r, g, b, a;  //colores
  boolean active = false;

  //Constructor
  PixelAumentado() {
  }

  //Metodos
  void setPos( int _x, int _y ) {
    x = _x;
    y = _y;
  }

  void setSize( int _tamanio ) {
    ancho = _tamanio;
    alto = _tamanio;
  }

  void setColorRGB( float _r, float _g, float _b ) {
    r = _r;
    g = _g;
    b = _b;
  }

  void setColorRGBA( float _r, float _g, float _b, float _a) {
    r = _r;
    g = _g;
    b = _b;
    a = _a;
  }

  void drawPixel() {
    fill( r, g, b, a ); 
    stroke( color(r, g, b) ); 
    rect( x, y, ancho, alto );
  }

  color getColor() {
    return color(r, g, b);
  }

  color getColorRGBA() {
    return color(r, g, b, a);
  }
  
  void setActive( boolean estado){
    active = estado;
  }
  
  boolean getActive(){
    return active;
  }
  
}

