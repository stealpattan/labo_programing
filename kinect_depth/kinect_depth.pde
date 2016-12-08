import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

//use these field.
Kinect kinect;
PImage rDepth;

int[] buffer;

void setup(){
  kinect = new Kinect(this);
  kinect.initDepth();
  size(640,480);
  buffer = kinect.getRawDepth();
  //int[] d = kinect.getRawDepth();
  //print(d.length);// -> result(307200) so, equal to 640 x 480;
  rDepth = new PImage(kinect.width, kinect.height);//We can draw on the sketch to use "PImage".
}

void draw(){
	int[] d = kinect.getRawDepth();

  //get defference.and fill the color.
  //for(int i=0;i<d.length;i++){
  //  if(buffer[i] != d[i]){
  //    rDepth.pixels[i] = color(200);
  //  }
  //  else{
  //    rDepth.pixels[i] = color(0);
  //  }
  //}
  for (int i=0; i<d.length; i++) {
    rDepth.pixels[i] = color(d[i]%256);
  }
  rDepth.updatePixels();
  image(rDepth,0,0);
  
  //update buffer.
  for(int j=0;j<d.length;j++){
    buffer[j] = d[j];
  }
}