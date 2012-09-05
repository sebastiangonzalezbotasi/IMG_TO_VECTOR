// Autor: "Sebastian G. Botasi" <sgonzalez@bionimio.com.ar>
//=====================================================================



// función que sirve para escalar una imagen
// recibe dos parámetros (anchura y altura a escalar)
// retorna un objeto con dos atributos (anchura y altura escalada para la imagen)
//
// datos=escalarImagen(285,326);
// trace(data.alto)
// trace(data.ancho)

int[] escalarImagen ( int alto, int ancho, int altura_Maxima_Foto, int anchura_Maxima_Foto ) {

  int datos[] = new int[2];
  int coeficiente = 0;
  int altura = 0;
  int anchura = 0;
  
  if (alto > altura_Maxima_Foto) {
    if (ancho <= anchura_Maxima_Foto) {
      coeficiente = alto / altura_Maxima_Foto;
      altura = altura_Maxima_Foto;
      anchura = ancho / coeficiente;
      datos[0] = altura;
      datos[1] = anchura;
    } 
    else {
      coeficiente = alto / altura_Maxima_Foto;
      altura = altura_Maxima_Foto;
      anchura = ancho / coeficiente;
      datos[0] = altura;
      datos[1] = anchura;

      if (anchura > anchura_Maxima_Foto) {
        coeficiente = ancho / anchura_Maxima_Foto;
        anchura = anchura_Maxima_Foto;
        altura = alto / coeficiente;
        datos[0] = altura;
        datos[1] = anchura;
      }
    }
  } 
  else {
    if (ancho > anchura_Maxima_Foto) {
      coeficiente = ancho / anchura_Maxima_Foto;
      anchura = anchura_Maxima_Foto;
      altura = alto / coeficiente;
      datos[0] = altura;
      datos[1] = anchura;
    }
  }

  return datos;
}

