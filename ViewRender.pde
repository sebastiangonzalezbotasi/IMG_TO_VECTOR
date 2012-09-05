int MIN_TAMANIO_RECT = 5;
int MAX_TAMANIO_RECT = 25;

class ViewRender {
  PGraphics grafico;
  ExportSVG svg;

  PixelAumentado[] pixeles;
  int cantPixeles;
  int cont = 0;

  ViewImage imageRender;

  int x, y;
  int velocidad;
  int anchoOriginal, altoOriginal;
  int margen = 10;

  int altura_Maxima_Foto;
  int anchura_Maxima_Foto;

  boolean estado;


  //-------------------------------------------------


  ViewRender( int _x, int _y, int _ancho, int _alto ) {

    x = _x;
    y = _y;

    anchoOriginal = _ancho;
    altoOriginal = _alto;

    anchura_Maxima_Foto = _ancho - (margen*2);
    altura_Maxima_Foto = _alto - (margen*2);

    estado = false;
    imageMode( CENTER );
    velocidad = 1;
  }

  //-------------------------------------------------


  void render( ViewImage _img ) {
    imageRender = _img;
    grafico = createGraphics( imageRender.imagePreview.width, imageRender.imagePreview.height, P3D );
  }

  //-------------------------------------------------

  void drawRender() {
    if ( estado ) {
      grafico.beginDraw();
      grafico.background(255);
      for ( int i=0;i<cont;i++ ) {
        if ( (pixeles[ i ] != null)) {
          grafico.fill( pixeles[ i ].getColorRGBA());
          grafico.stroke( pixeles[ i ].getColor());
          grafico.rect( pixeles[ i ].x, pixeles[ i ].y, pixeles[ i ].ancho, pixeles[ i ].alto );
        }
      }


      if (cont >= cantPixeles) {
        setStatus( false );
        cont = 0;
      }
      else {
        cont += velocidad;
      }

      grafico.endDraw();
    }
    image( grafico, anchoOriginal/2, altoOriginal * 1.5 );
  }


  //-------------------------------------------------

  void loadBuffer() {

    cantPixeles = imageRender.imagePreview.width * imageRender.imagePreview.height;
    int margenSuperior = (altoOriginal - imageRender.imagePreview.height ) / 2;
    int margenDerecha = (anchoOriginal - imageRender.imagePreview.width ) / 2;


    pixeles = new PixelAumentado[ cantPixeles ]; 

    for ( int i=0; i< cantPixeles; i++ ) {
      int x = int( random( imageRender.imagePreview.width ) ); 
      int y = int( random( imageRender.imagePreview.height  ) ); 
      color este = imageRender.imagePreview.get(  x, y );

      if ( este != 0 ) {
        pixeles[ i ] = new PixelAumentado();
        pixeles[ i ].setSize( int( random( MIN_TAMANIO_RECT, MAX_TAMANIO_RECT) ) );
        pixeles[ i ].setPos( x, y );
        pixeles[ i ].setColorRGBA( red(este), green(este), blue(este), 60 );
      }
    }
  }


  void setStatus( boolean _estado ) {
    estado = _estado;
  }

  void reset() {
    vaciarBuffer();

    loadBuffer();
    setStatus( true );
    cont = 0;
  }

  void vaciarBuffer() {
    for ( int i=0; i< cantPixeles; i++ ) {
      pixeles[ i ] = null;
    }
  }

  Boolean exportSVG( String nombreArchivo) {
    setStatus( false );
    boolean exito = false;
    if ( cont > 0 ) {
      svg = new ExportSVG( grafico.width, grafico.height );
      svg.startSVG();
      for ( int i=0;i<cont;i++ ) {
        alertas = "PROCESANDO...";
        if ( (pixeles[ i ] != null)) {
          svg.drawRect( pixeles[ i ].x, pixeles[ i ].y, pixeles[ i ].ancho, pixeles[ i ].alto, pixeles[ i ].getColorRGBA());
        }
      }

      svg.endSVG();
      svg.generateSVG( nombreArchivo ); 

      exito = true;
    }
    else {
      exito = false;
    }
    return exito;
  }

  void setVelocidad( String _tipo ) {
    if ( _tipo.equals( "MAS" )) {
      velocidad++;
    }
    else if ( _tipo.equals( "MENOS" )) {
      velocidad--;
    }
  }
}

