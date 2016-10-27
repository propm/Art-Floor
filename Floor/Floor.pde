//Set...kirikaetatokini itidodake kisetugotono settei
int season;
int SIZE = 20;
Ripple[] ripples = new Ripple[SIZE];
Clack[] clacks = new Clack[SIZE];

PImage back, hibi;

void setup(){
  season=0; 
  colorMode(HSB,360,100,100);
  background(0);
  size(600,600);
  smooth();
  frameRate(30);
  // Connect to the local machine at port 5204.
  // This example will not run if you haven't
  // previously started a server on this port.
  myClient = new Client(this, "127.0.0.1", 5204);
  

  for(int i=0;i<SIZE;i++) {
    ripples[i] = new Ripple();
  }
  for(int i=0;i<SIZE;i++) {
    clacks[i] = new Clack();
  }
  
  hibi = loadImage("hibi.png");
}

void draw(){
   switch(season){
     case 1:
       springDraw();
       break;
     case 2:
       summerDraw();
       break;
     case 3:
       fallDraw();
       break;
     case 4:
       winterDraw();
       break;
   }
}

void springDraw(){  
  background(0);
  image(back,0,0);
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

void summerDraw(){
  background(0);
  image(back,0,0);
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

void fallDraw(){
  background(0);
  noTint();
  image(back, 0, 0);
  for(int i=0;i<SIZE;i++) {
    if(clacks[i].getFlag()) {
      clacks[i].move();
      clacks[i].clackDraw();
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

void winterDraw(){
    background(0);
  noTint();
  image(back,width/2,height/2);
  for(int i=0;i<SIZE;i++) {
    if(clacks[i].getFlag()) {
      clacks[i].move();
      clacks[i].clackDraw();
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

void mousePressed() {
  switch(season){
    case 1:
      for(int i=SIZE-1;i>0;i--) {
        ripples[i] = new Ripple(ripples[i-1]);
      }
      ripples[0].init(mouseX,mouseY,random(5,10),int(random(190,220)));
      break;
    
    case 2:
      for(int i=SIZE-1;i>0;i--) {
        ripples[i] = new Ripple(ripples[i-1]);
      }
      ripples[0].init(mouseX,mouseY,random(5,10),int(random(190,220)));
      break;
      
    case 3:
      for(int i=SIZE-1;i>0;i--) {
        clacks[i] = new Clack(clacks[i-1]);
      }
      clacks[0].init(mouseX,mouseY,random(5,10),int(random(100,170)));
      break;

    case 4:
      for(int i=SIZE-1;i>0;i--) {
        clacks[i] = new Clack(clacks[i-1]);
      }
      clacks[0].init(mouseX,mouseY,random(5,10),int(random(100,170)));
      break;
  }
}

void keyPressed(){
  if(key == CODED ){
    if(keyCode == RIGHT ){
      season++;
      if(season >= 5)
        season = 1;
      Set();
      println(season);
    }
  }
  
  switch(season){
    case 1:
      for(int i=SIZE-1;i>0;i--) {
        ripples[i] = new Ripple(ripples[i-1]);
      }
      ripples[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(190,230)));
      break;
      
    case 2:
      for(int i=SIZE-1;i>0;i--) {
        ripples[i] = new Ripple(ripples[i-1]);
      }
      ripples[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(190,230)));
      break;
      
    case 3:
      for(int i=SIZE-1;i>0;i--) {
        clacks[i] = new Clack(clacks[i-1]);
      }
      clacks[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(100,170)));
      break;
      
      
    case 4:
      for(int i=SIZE-1;i>0;i--) {
        clacks[i] = new Clack(clacks[i-1]);
      }
      clacks[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(100,170)));
      break;
  }
}