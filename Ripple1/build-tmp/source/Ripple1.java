import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.net.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ripple1 extends PApplet {

int SIZE = 20;
Ripple[] ripples = new Ripple[SIZE];
PImage img;

public void setup() {
  //fullScreen();
  
  colorMode(HSB,360,100,100);
  background(0);
  
  frameRate(30);
  img = loadImage("stone.jpg");
  img.resize(width,height);
  
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, "127.0.0.1", 5204); 
  
  for(int i=0;i<SIZE;i++) {
    ripples[i] = new Ripple();
  }
}



public void draw() {
  background(0);
  image(img,0,0);
  for(int i=0;i<SIZE;i++) {
    if(ripples[i].getFlag()) {
      ripples[i].move();
      ripples[i].rippleDraw();
    }
  }
  //Client
  if (myClient.available() >= 8) { 
  X=readInt();
  Y=readInt();
  println(X+","+Y);
  }
  ellipse(X, Y, 10, 10);
  ripples[0].init(X,Y,random(5,10),PApplet.parseInt(random(190,220)));
}

// mouse ver.
public void mousePressed() {
  for(int i=SIZE-1;i>0;i--) {
    ripples[i] = new Ripple(ripples[i-1]);
  }
  ripples[0].init(mouseX,mouseY,random(5,10),PApplet.parseInt(random(190,220)));
}

// keyboard ver.
public void keyPressed() {
  for(int i=SIZE-1;i>0;i--) {
    ripples[i] = new Ripple(ripples[i-1]);
  }
  ripples[0].init(PApplet.parseInt(random(0,width)),PApplet.parseInt(random(0,height)),random(5,15),PApplet.parseInt(random(190,230)));
}
float FRICTION = 0.985f;
public class Ripple{
  int x,y;
  float dia;
  float speed;
  int colorH;
  boolean flag;
  
  Ripple() {
    init(0,0,0,0);
    flag = false;
  }

  public Ripple(Ripple src) {
    this.x = src.x;
    this.y = src.y;
    this.speed = src.speed;
    this.colorH = src.colorH;
    this.dia = src.dia;
    this.flag = src.flag;
  }

  public void init(int _x, int _y, float _speed, int _colorH) {
    x = _x;
    y = _y;
    speed = _speed;
    colorH = _colorH;
    dia = 0.0f;
    flag = true;
  }

  public void rippleDraw() {
    noFill();
  
    if(speed > 1.0f) {
      stroke(colorH, 60, 99, 100*(speed-1)/3);
      strokeWeight(4);
      ellipse(x,y,dia,dia);
    }
    if(speed > 1.5f) {
      stroke(colorH, 60, 99, 100*(speed-1.5f)/3);
      strokeWeight(2);
      ellipse(x,y,dia*0.7f,dia*0.7f);
    }
    if(speed > 2.0f) {
      stroke(colorH, 60, 99, 100*(speed-2)/3);
      strokeWeight(1);
      ellipse(x,y,dia*0.6f,dia*0.6f);
    }
  }

  public void move() {
    dia += speed;
    speed *= FRICTION;
    if(speed < 0.5f) {
      flag = false;
    }
  }

  public boolean getFlag() {
    return flag;
  }
}
int X=0,Y=0;  
 

Client myClient; 

public int readInt(){ 
    int a = myClient.read();
    int b = myClient.read();
    int c = myClient.read();
    int d = myClient.read();
    int e = (a<<24)|(b<<16)|(c<<8)|d;
    return e;
}
  public void settings() {  size(600, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ripple1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
