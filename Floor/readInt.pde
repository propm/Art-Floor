float[] X = new float[5];
float[] Y = new float[5];

import processing.net.*; 
import java.nio.ByteBuffer;

Client myClient; 
void setPosition(){
  for(int i=0;i<5;i++){
     X[i] = width*x[i];
     Y[i] = height*y[i];
  }
}
void GetData(){
 // while(client[0].available()+client[1].available()+client[2].available()+client[3].available()+client[4].available()+client[5].available()+client[6].available()+client[7].available()+client[8].available()+client[9].available() <= 40){
    if(client[0].available() >= 4)
    {
      x[0]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[0].readBytes(4)).getInt())/10000;
    }
    
    if(client[1].available() >= 4)
    {
      y[0]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[1].readBytes(4)).getInt())/10000;
    }
    if(client[2].available() >= 4)
    {
      x[1]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[2].readBytes(4)).getInt())/10000;
    }
    if(client[3].available() >= 4)
    {
      y[1]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[3].readBytes(4)).getInt())/10000;
    }
    if(client[4].available() >= 4)
    {
      x[2]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[4].readBytes(4)).getInt())/10000;
    }
    if(client[5].available() >= 4)
    {
      y[2]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[5].readBytes(4)).getInt())/10000;
    }
    if(client[6].available() >= 4)
    {
      x[3]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[6].readBytes(4)).getInt())/10000;
    }
    if(client[7].available() >= 4)
    {
      y[3]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[7].readBytes(4)).getInt())/10000;
    }
    if(client[8].available() >= 4)
    {
      x[4]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[8].readBytes(4)).getInt())/10000;
    }
    if(client[9].available() >= 4)
    {
      y[4]=(float)Integer.reverseBytes(ByteBuffer.wrap(client[9].readBytes(4)).getInt())/10000;
    }
 // }
}