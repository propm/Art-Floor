int SIZE = 20;
Clack[] clacks = new Clack[SIZE];
PImage back, hibi;

void setup() {
  //fullScreen();
  size(600, 600);
  colorMode(HSB,360,100,100);
  background(0);
  smooth();
  frameRate(30);
  imageMode(CENTER);
  back = loadImage("huyu.jpg");
  hibi = loadImage("hibi.png");
  back.resize(width,height);
  
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, "127.0.0.1", 5204); 
  
  for(int i=0;i<SIZE;i++) {
    clacks[i] = new Clack();
  }
}



void draw() {
  background(0);
  noTint();
  image(back,width/2,height/2);
  for(int i=0;i<SIZE;i++) {
    if(clacks[i].getFlag()) {
      clacks[i].move();
      clacks[i].rippleDraw();
    }
  }
  //Client
  if (myClient.available() >= 8) { 
  X=readInt();
  Y=readInt();
  println(X+","+Y);
  }
  ellipse(X, Y, 10, 10);
  clacks[0].init(X,Y,random(5,10),int(random(100,170)));
}

// mouse ver.
void mousePressed() {
  for(int i=SIZE-1;i>0;i--) {
    clacks[i] = new Clack(clacks[i-1]);
  }
  clacks[0].init(mouseX,mouseY,random(5,10),int(random(100,170)));
}

// keyboard ver.
void keyPressed() {
  for(int i=SIZE-1;i>0;i--) {
    clacks[i] = new Clack(clacks[i-1]);
  }
  clacks[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(100,170)));
}