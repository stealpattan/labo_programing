import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect kinect;

float deg;

boolean ir = false;
boolean colorDepth = false;
boolean mirror = false;

int[][] depth_data = new int[320][240];
int[][] buffer = new int[320][240];
int t = 0;

int w_width = 340;
int w_height = 240;

RawDepth rd = new RawDepth(w_width, w_height);

void setup(){
  size(320,240);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.initVideo();
  kinect.enableColorDepth(colorDepth);
  deg = kinect.getTilt();
  //get raw depth data.
  int[] d = kinect.getRawDepth();
  //initialized buffer by first frame.
  for(int i=0;i<w_width;i++){
    for(int j=0;j<w_height;j++){
      if(t < 320){
        buffer[i][j] = d[t];
        t++; 
      }
    }
  }
}

void draw(){
  background(255);
  t = 0;
  //get raw depth data.
  int[] depth = kinect.getRawDepth();
  //separate 2-dimentional array.
  for(int i=0;i<w_width;i++){
    for(int j=0;j<w_height;j++){
      if(t < 320){
        depth_data[i][j] = depth[t];
        t++;
      }
    }
  }
  
  for(int i=0;i<w_width;i++){
    for(int j=0;j<w_height;j++){
      if(buffer[i][j] != depth_data[i][j]){
        fill(200);
        rect(i,j,1,1);//show small rectangle.
        noFill();
      }
    }
  }
  
  //update buffer.
  for(int i=0;i<320;i++){
    for(int j=0;j<240;j++){
      buffer[i][j] = depth_data[i][j];
    }
  }
}