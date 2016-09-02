int SIZE = 20;
Ripple[] ripples = new Ripple[SIZE];
PImage img;

void setup() {
  //fullScreen();
  size(600, 600);
  colorMode(HSB,360,100,100);
  background(0);
  smooth();
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



void draw() {
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
  ripples[0].init(X,Y,random(5,10),int(random(190,220)));
}

// mouse ver.
void mousePressed() {
  for(int i=SIZE-1;i>0;i--) {
    ripples[i] = new Ripple(ripples[i-1]);
  }
  ripples[0].init(mouseX,mouseY,random(5,10),int(random(190,220)));
}

// keyboard ver.
void keyPressed() {
  for(int i=SIZE-1;i>0;i--) {
    ripples[i] = new Ripple(ripples[i-1]);
  }
  ripples[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(190,230)));
}