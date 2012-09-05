
// Autor: "Sebastian G. Botasi" <sgonzalez@bionimio.com.ar>
//=====================================================================
void infoPrograma() {
  println(frame.getTitle());
  println ();
  println (" ********************************************************");
  println (" *                                                      *"); 
  println (" *  COMANDOS                                            *"); 
  println (" *  >> S = Star                                         *"); 
  println (" *  >> P = Pausa                                        *");
  println (" *  >> R = Reset                                        *");
  println (" *  >> E = ExportSVG                                    *");
  println (" *  >> D = Aumenta_Velocidad                            *");
  println (" *  >> A = Disminuye_Velocidad                          *");
  println (" *  >> ESC = Salir                                      *");

} 
//=====================================================================
//GLOBALES - POSIBLE MODIFICAR
int T_LIMPIA_ALERTAS = 2000;
int FRAME_X_SEG = 30;


import controlP5.*;

ViewGrid grid;
Timer timer;



PFont font;
PImage logo,imagen;

//VARIABLES - NO MODIFICAR
int cont = 0;
int nVersion = 0;
String alertas = "";
int controlPanelWidth = 250;

void setup() {

  size(1000, 750, P2D);
  frameRate( FRAME_X_SEG );
  infoPrograma();
  timer = new Timer( T_LIMPIA_ALERTAS );
  grid = new ViewGrid( 346, 39, 550, 650 );
  grid.setImage( "img.jpg" );



  logo = loadImage("logo/modelo.png");
  font = loadFont("ArialMT-14.vlw"); 
  textFont(font, 12); 

  setupGUI(); // ver Gui.pde
}


void draw() {
  background(250, 250, 250);
  drawPanelConfig();
  grid.drawGrid();
}


void keyReleased() {
  if ( key == 's' ) {
    grid.viewRender.setStatus( true );
  }
  else if ( key == 'p' ) {
    grid.viewRender.setStatus( false );
  }
  else if (key == 'r') {
    grid.viewRender.reset();
    alertas = "RESET RENDER";
    timer.start();
  
    
  }
  else if ( key == 'e' ) {
    String nombreGuardar = frame.getTitle()+"_V."+nVersion;
    boolean exito = grid.viewRender.exportSVG( nombreGuardar );
    if ( exito ) {
      alertas = "EXPORTADO >> "+nombreGuardar;
      nVersion++;
      timer.start();
    }else{
      alertas = "NO HAY IMAGEN EN RENDER";
      timer.start();
    }
  }
  else if (key == 'd') {
    grid.viewRender.setVelocidad("MAS");
  }
  else if (key == 'a') {
    grid.viewRender.setVelocidad("MENOS");
  }
}


void drawPanelConfig() {

  noStroke();
  fill( 100 );
  rect( 0, 0, controlPanelWidth, height);
  image( logo, controlPanelWidth/2, (height - (logo.height/2)) - 20);

  String comandos = "\n";
  comandos += "********************************************\n";
  comandos += " COMANDOS                                   \n";
  comandos += " >> S = Star                                \n";
  comandos += " >> P = Pausa                               \n";
  comandos += " >> R = Reset                               \n";
  comandos += " >> E = ExportSVG                           \n";
  comandos += " >> D = Aumenta_Velocidad                   \n";
  comandos += " >> A = Disminuye_Velocidad                 \n";
  comandos += " >> ESC = Salir                             \n";
  comandos += "********************************************\n";
  comandos += " MENSAJES                                   \n";
  comandos += alertas;




  fill( 255 );
  text( comandos, 10, 10 );

  if ( timer.isFinished() ) {
    alertas = "";
  }
}

