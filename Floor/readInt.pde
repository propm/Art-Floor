int X=0,Y=0;  
import processing.net.*; 

Client myClient; 

int readInt(){ 
    int a = myClient.read();
    int b = myClient.read();
    int c = myClient.read();
    int d = myClient.read();
    int e = (a<<24)|(b<<16)|(c<<8)|d;
    return e;
}