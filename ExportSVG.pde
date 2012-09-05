// Autor: "Sebastian G. Botasi" <sgonzalez@bionimio.com.ar>
//=====================================================================

class ExportSVG {
  
  String cadena;
  int ancho, alto;

  //-------------------------------------

  ExportSVG( int _ancho, int _alto ) {
    cadena = "";
    alto = _alto;
    ancho = _ancho;
  }

  //-------------------------------------

  void startSVG() {
    cadena += "<?xml version='1.0'?>\n<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>\n<svg xmlns='http://www.w3.org/2000/svg' width='"+ ancho +"px' height='"+ alto +"px'>\n";
  }

  //-------------------------------------

  void drawRect( int _x, int _y, int _width, int _height, color _color ) {

    int  rojo  = int(red( _color )); 
    int  verde = int(green( _color )); 
    int  azul  = int(blue( _color )); 
    float alfa = norm( alpha( _color ) , 0, 255 );
    
    

    cadena += "<rect x='"+ _x +"' y='"+ _y +"' width='"+ _width +"' height='"+ _height +"' style='fill:rgb("+ rojo +","+ verde +","+ azul +");stroke:rgb("+ rojo +","+ verde +","+ azul +");stroke-width:0.2;fill-opacity:"+alfa+"'/>\n";
  }



  //-------------------------------------

  void endSVG() {
    cadena += "</svg>";
  }

  //-------------------------------------

  void generateSVG( String _nombre ) {
    saveSVG( _nombre, cadena);
  }

  //-------------------------------------

  void saveSVG( String nombreTabla_, String contenido_) {
    String[] luaFinalExplode = split(contenido_, '\n');
    saveStrings("SVG/"+nombreTabla_+".svg", luaFinalExplode);
  }
}
