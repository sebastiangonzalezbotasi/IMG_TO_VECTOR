
class ViewGrid {
  
  ViewImage viewImage;
  ViewRender viewRender;

  int x, y;
  int ancho, alto;

  //-------------------------------------------------

  ViewGrid( int _x, int _y, int _ancho, int _alto) {
    x = _x;
    y = _y;
    ancho = _ancho;
    alto = _alto;

    viewImage = new ViewImage(  x, y, ancho, alto/2 );
    viewRender = new ViewRender( x, alto/2, ancho, alto/2 );
    
    
    
  }
  

  //Metodos
  //-------------------------------------------------

  void setImage( String _src ) {
    viewImage.setImage( _src ); //cargo la imagen en region uno

    viewRender.render( viewImage ); // y renderizo con efecto en region dos

    viewRender.loadBuffer();
  }

  //-------------------------------------------------

  void drawGrid() {
    pushMatrix();
    translate( x, y );
    fill(0);
    text("ImgOriginal",(ancho + 5), 15);
    text("ImgRender",(ancho + 5), (alto/2+15));
    
    stroke( 123 );
    noFill();
    line( 0, alto/2, ancho, alto/2 );
    rect( 0, 0, ancho, alto);

    viewImage.drawViewImage(); //dibujo contenido de region uno
    viewRender.drawRender(); //dibujo contenido de region dos

    popMatrix();
  }
  
}

