// Autor: "Sebastian G. Botasi" <sgonzalez@bionimio.com.ar>
//=====================================================================

class ViewImage {

  PImage imagePreview;
  int x, y;

  int anchoOriginal, altoOriginal;
  int margen = 10;

  int altura_Maxima_Foto;
  int anchura_Maxima_Foto;

  //-------------------------------------------------

  ViewImage( int _x, int _y, int _ancho, int _alto ) {

    x = _x;
    y = _y;

    anchoOriginal = _ancho;
    altoOriginal = _alto;

    anchura_Maxima_Foto = _ancho - (margen*2);
    altura_Maxima_Foto = _alto - (margen*2);

    imageMode(CENTER);
  }

  //-------------------------------------------------

  void setImage( String _srcImage ) {
    imagePreview = loadImage( _srcImage );
    redimencionar();
  }

  //-------------------------------------------------


  void drawViewImage() {
    image( imagePreview, (anchoOriginal/2 ), (altoOriginal/2 ) );
  }

  //-------------------------------------------------

  void redimencionar() {


    float originalWidth = imagePreview.width;
    float originalHeight = imagePreview.height;

    float widthRatio = originalWidth / anchura_Maxima_Foto;
    float heightRatio = originalHeight / altura_Maxima_Foto;



    if (widthRatio > heightRatio) {

      float newThumbnailHeight = (float)originalHeight / (float)originalWidth * anchura_Maxima_Foto;
      imagePreview.resize(anchura_Maxima_Foto, (int) newThumbnailHeight);
    }
    else {
      float newThumbnailWidth = (float)originalWidth / (float)originalHeight * altura_Maxima_Foto;
      imagePreview.resize( (int) newThumbnailWidth, altura_Maxima_Foto);
    }
  }

  //-------------------------------------------------

  String getSideMax() {
    String respuesta = "";
    int ancho = imagePreview.width;
    int alto = imagePreview.height;
    if ( ancho > alto ) {
      respuesta = "ANCHO";
    }
    else if ( alto > ancho ) {
      respuesta = "ALTO";
    }
    else {
      respuesta = "IGUAL";
    }
    return respuesta;
  }
}

