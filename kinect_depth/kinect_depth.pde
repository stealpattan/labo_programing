import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

// I rewrite all of the code.

Kinect kinect;
PImage rDepth;

void setup(){
  kinect = new Kinect(this);
  kinect.initDepth();
  size(640,480);
  int[] d = kinect.getRawDepth();
  print(d.length);
  rDepth = new PImage(kinect.width, kinect.height);
}

void draw(){
  
}