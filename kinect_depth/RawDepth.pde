import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

public class RawDepth{
  int w_width;
  int w_height;
  Kinect kinect;
  RawDepth(int w_width, int w_height){
    this.w_width = w_width;
    this.w_height = w_height;
  }
  
  public int[][] get_depth(){
    int buffer[][] = new int[w_width][w_height];
    int[] d = kinect.getRawDepth();
    
    return buffer;
  }
}