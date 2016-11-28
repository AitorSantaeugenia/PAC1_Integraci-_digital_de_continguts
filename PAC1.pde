/* PAC1 - Exercici 3
Aitor Javier Santaeugenia Marí
Integració digital de continguts
Universitat Oberta de Catalunya */
import ddf.minim.*;

Minim minim;

//Variables imatges
PImage fons;
int real = 0;
int filtre1 = 1;
int filtre2 = 2;
int filtre3 = 3;
//Globos
PImage globo1;
PImage globo2;
PImage globo3;
PImage globo4;

//Variables so
AudioPlayer bass1;
AudioPlayer bass2;
AudioPlayer audio3;
AudioPlayer audio4;

//Altres variables
String[] text;
int counter_text;
int frame;

PFont text_explicacio;
PFont text_explicacio2;

//INICI SETUP
void setup(){
    //Mida de l'escenari i framerate
    size(800,400);
    frameRate(20);
    
    counter_text = 0;
    text = new String[5];
    text[0] = "Clica un objecte";
    text[1] = "So original";
    text[2] = "Filtre 1";
    text[3] = "Filtre 2";
    text[4] = "Filtre 3";
    
    
    //Carrega imatge del fons
    fons = loadImage("fons.jpg");
    /*
    globo1 = loadImage("globo1.png");
    globo2 = loadImage("globo2.png");
    globo3 = loadImage("globo3.png");
    globo4 = loadImage("globo4.png");
    */
    
    /* EXEMPLE TRET DE LA LLIBRERIA DE MINIM ARCHIVO>EJEMPLO>BIBLIOTECAS>MINIM>BASICS>PLAYAFILE */
    // De ahí que esté en inglés
    
    // we pass this to Minim so that it can load files from the data directory
    minim = new Minim(this);
    
    // loadFile will look in all the same places as loadImage does.
    // this means you can find files that are in the data folder and the 
    // sketch folder. you can also pass an absolute path, or a URL.
    bass1 = minim.loadFile("original.wav");
    bass2 = minim.loadFile("filtreX.wav");
    audio3 = minim.loadFile("filtreY.wav");
    audio4 = minim.loadFile("filtreZ.wav");
    /* FI EXEMPLE MINIM */
    
    //TEXTOS EXPLICATIUS
    text_explicacio = createFont("Arial",16,true);
    text_explicacio2 = createFont("Arial",16,true);
}//FI SETUP

//INICI DRAW
void draw(){
    //PINTAM EL FONS
    image(fons, 0,0);
    //PINTEM EL TEXT
    textSize(20);
    fill(255,0,0);
    text(text[counter_text], 320,100);
    
    //TEXTOS EXPLICATIUS
    textFont(text_explicacio,16);                  // STEP 3 Specify font to be used
    fill(255);                         // STEP 4 Specify font color 
    text("- Hem creat quatre audios diferents de la mateixa frase",10,350);   // STEP 5 Display Text
    
    textFont(text_explicacio2,16);                  // STEP 3 Specify font to be used
    fill(255);                         // STEP 4 Specify font color 
    text("- Cada cop que cliquem, es reproduirà pel variable.rewind()",10,370);   // STEP 5 Display Text
      /*
    //PINTEM GLOBOS
    image(globo1, 0,0);
    image(globo2, 200,100);
    image(globo3, 400,50);
    image(globo4, 550,150);
    */
    
    fill(175,247,230);
    rect(225,150,50,50);
    
    fill(239,232,174);
    rect(325,150,50,50);
    
    fill(138,5,54);
    rect(425,150,50,50);
    
    fill(135,171,218);
    rect(525,150,50,50);
    
}//FI DRAW

//Inici funció mousePressed
void mousePressed(){
      if(mouseX >225 && mouseX<275 && mouseY >150 && mouseY<200){
         bass1.rewind();
         bass1.play();
         counter_text =1;
      }else if(mouseX >325 && mouseX<375 && mouseY >150 && mouseY<200){
         bass2.rewind();
         bass2.play();
         counter_text =2;
      }else if(mouseX >425 && mouseX<475 && mouseY >150 && mouseY<200){
         audio3.rewind();
         audio3.play();
         counter_text =3;
      }else if(mouseX >525 && mouseX<575 && mouseY >150 && mouseY<200){
         audio4.rewind();
         audio4.play();
         counter_text =4;
      }else {
         counter_text =0; 
      }
}//Fi funció mousePressed