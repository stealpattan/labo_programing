import processing.core.*;
import SimpleOpenNI.*;

SimpleOpenNI kinect;

int[] depthV;

int thresh = 1500;
int ImageSize = 640*480;

void setup(){
  size(640,480);
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
}

void draw() {

  kinect.update();
  PImage depthImage = kinect.depthImage();
  image(depthImage, 0, 0);

  for (int pic = 0; pic < ImageSize; pic++)
  {
    if (depthV[pic] > thresh)
      depthV[pic] = color(255);
    else
      depthV[pic] = color(0);
  }
   
  }
  