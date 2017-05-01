import SimpleOpenNI.*;
SimpleOpenNI color_kinect;

int i, j, k, l, p = 0;
int window_size;
String colorMode = "blue" ;
float r, g, bpix, opix = 0;
PImage img;
color blue = color(0, 0, 255), orange = color(255, 133, 0); 

void setup(){
  size(1280,960);
  window_size = 1280;
  
  color_kinect = new SimpleOpenNI(this);
  color_kinect.enableDepth();
  color_kinect.enableRGB();

  //show program
  smooth();
  //img = loadImage( "background.png" );
  //image(img, 0, 0);
}

void draw(){
  color_kinect.update();
  //image(color_kinect.depthImage(),0,0);
  
  int[] depthMap = color_kinect.depthMap();
  loadPixels();
  for(int y=0;y<color_kinect.depthHeight();y++){
    for(int x=0;x<color_kinect.depthWidth();x++){
      int d = depthMap[x + y*640];
      if(1000<d && d<1200){
        //pixels[x + y*width] = color(255,0,0);
        c_get(x,y);
      }
    }
  }
  updatePixels();
  displayColorRatio();
}

public void c_get(int x, int y){
  int idx = x + y * color_kinect.rgbImage().width;
  color c = color_kinect.rgbImage().pixels[idx];
  x = x * 2;
  y = y * 2;
  
  if(red( c )>=170 && blue( c ) <= 10){
    //colorMode = "orange";
    //color_fill(x, y);
    for(int j=y;j<(y+2);j++){
      for(int i=x;i<(x+2);i++){
        pixels[i + j * window_size] = color(255,255,0);
      }
    }
  }
  if(red( c ) <= blue( c )+10 && green( c ) >= 90 && saturation( c ) >= 75){
    //colorMode = "blue";
    //color_fill(x, y);
    for(int j=y;j<(y+2);j++){
      for(int i=x;i<(x+2);i++){
        pixels[i + j * window_size] = color(0,255,0);
      }
    }
  } 
}

void color_fill(int x, int y){
  pushMatrix();
  img = loadImage( "shiro.png" ); //900*900
  if (colorMode == "blue"){
    tint(blue);
  }
  else tint(orange);
  img.resize(10, 10);
  translate(x, y);
  rotate(radians(random(360)));
  imageMode(CENTER);
  image(img, 0, 0);
  imageMode(CORNER);
  popMatrix();
}

void keyPressed() {
  if ( key == 'c' ) {
  noTint();
  img = loadImage( "background.png" );
  image(img, 0, 0);
  }
  if (key == 'o'){
    colorMode = "orange";
  }
  if (key == 'b'){
    colorMode = "blue";
  }
}

void displayColorRatio(){
    fill(255);
    strokeWeight(0);
    rect(0, 580, 600, 20);
    
    for(k=0; k<width; k++){
      for(l=0; l<height-20; l++){
         p = get(k,l);
         if(red(p) == 0 && green(p)== 0 && blue(p) > 240) bpix++;
         if(red(p) > 240 && green(p) > 130 && blue(p) == 0) opix++;
      }
    }
    
    bpix = bpix*100/width/height;
    opix = opix*100/width/height;
    fill(0);
    text("blue:" + nf(bpix, 0, 2) + "%  VS  orange:" + nf(opix, 0, 2) + "%", 0, 595);
}
