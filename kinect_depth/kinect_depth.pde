import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

//use these field.
Kinect kinect;
PImage rDepth;

int def;

int[] buffer;

int maxDepth;

void setup(){
  kinect = new Kinect(this);
  kinect.initDepth();
  size(640,480);
  frameRate(30);
  //int[] d = kinect.getRawDepth();
  //print(d.length);// -> result(307200) so, equal to 640 x 480;
  rDepth = new PImage(kinect.width, kinect.height);//We can draw on the sketch to use "PImage".
}

void draw(){
  int[] d = kinect.getRawDepth();
  for (int i=0; i<d.length; i++) {
    if(d[i] > 1000 && d[i] < 1200){
      rDepth.pixels[i] = color(200);
    }
    else{
      rDepth.pixels[i] = color(0);
    }
  }
  rDepth.updatePixels();
  image(rDepth,0,0);
  
  //update buffer.
  //for(int j=0;j<d.length;j++){
    //buffer[j] = d[j];
  //}
}