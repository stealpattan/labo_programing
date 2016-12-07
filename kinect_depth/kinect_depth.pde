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
//  print(d.length);// -> result(307200) so, equal to 640 x 480;
  rDepth = new PImage(kinect.width, kinect.height);//We can draw on the sketch to use "PImage".
  //for(int i=0;i<20;i++){
  //  print("raw depth data :" + d[i] + "\n");
  //}  
}

void draw(){
	int[] d = kinect.getRawDepth();

  for (int i=0; i<d.length; i++) {
    if(d[i] != 0){
      rDepth.pixels[i] = color(200);
    }
    else{
  	  rDepth.pixels[i] = color(0);
    }
  }
  rDepth.updatePixels();
  image(rDepth,kinect.width,0);
}