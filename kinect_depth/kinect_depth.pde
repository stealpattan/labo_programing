import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

// I rewrite all of the code.

Kinect kinect;

void setup(){
  kinect = new Kinect(this);
  kinect.initDepth();
  size(320,240);
  int[] d = kinect.getRawDepth();
}

void draw(){
  //print("hoge \n");
}