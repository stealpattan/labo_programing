import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

//use these field.
Kinect kinect;
PImage rDepth;

void setup(){
  kinect = new Kinect(this);
  kinect.initDepth();
  size(640,480);
  //int[] d = kinect.getRawDepth();
  //print(d.length);// -> result(307200) so, equal to 640 x 480;
  rDepth = new PImage(kinect.width, kinect.height);//We can draw on the sketch to use "PImage".
}

void draw(){
	int[] d = kinect.getRawDepth();
  for (int i=0; i<d.length; i++) {
    rDepth.pixels[i] = color(d[i]/256);
  }
  rDepth.updatePixels();
  image(rDepth,0,0);
}