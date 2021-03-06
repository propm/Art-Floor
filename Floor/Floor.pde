//Set...kirikaetatokini itidodake kisetugotono settei
int season;
int SIZE = 50;
int Levx, Levy;
Ripple[] ripples = new Ripple[SIZE];
Clack[] clacks = new Clack[SIZE];
Client[] client=new Client[10];
float[] x=new float[5];
float[] y=new float[5];
PImage back, hibi, sakura, suimen;
PImage[] leaves;

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
    client[0] = new Client(this, "127.0.0.1", 1002);
    client[1] = new Client(this, "127.0.0.1", 1001);
    
    client[2] = new Client(this, "127.0.0.1", 2002);
    client[3] = new Client(this, "127.0.0.1", 2001);
    
    client[4] = new Client(this, "127.0.0.1", 3002);
    client[5] = new Client(this, "127.0.0.1", 3001);
    
    client[6] = new Client(this, "127.0.0.1", 4002);
    client[7] = new Client(this, "127.0.0.1", 4001);
    
    client[8] = new Client(this, "127.0.0.1", 5002);
    client[9] = new Client(this, "127.0.0.1", 5001);  

  leaves = new PImage[29];
  for(int j=1;j<leaves.length;j++){
    leaves[j-1]=loadImage("落ち葉_"+j+".png"); 
  }
  Happa = new ArrayList<leave>();
  Arei = new ArrayList<sakura>();
  king = new ArrayList<kingyo>();
  for(int i=0;i<SIZE;i++) {
    ripples[i] = new Ripple();
  }
  for(int i=0;i<SIZE;i++) {
    clacks[i] = new Clack();
  }
  
  hibi = loadImage("hibi.png");
  sakura = loadImage("sakura.PNG");
  suimen = loadImage("suimen.png");
  Fish[0] = loadImage("aka.png");
  Fish[1] = loadImage("kuro.png");
  Fish[2] = loadImage("akr.png");
  
}

void draw(){
  //Cilent
  GetData();
  setPosition();
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
  image(suimen, 0, 0);
  
  for (int i = 0; i < Arei.size(); i++) {
    sakura tmp = Arei.get(i);
    tmp.Draw();
  }
  
  for(int i=0;i<SIZE;i++) {
    if(ripples[i].getFlag()) {
      ripples[i].move();
      ripples[i].rippleDraw();
    }
  }
  //ellipse(X, Y, 10, 10);
  if(millis() % 1000 == 0){
    for(int i = 0; i < 5; i++){
      ripples[i].init(int(X[i]),int(Y[i]),random(5,10),int(random(190,220)));
    }
  }
}

void summerDraw(){
  background(0);
  println(frameRate);
  image(back,width/2,height/2);  
  image(suimen, width/2, height/2);
  for (int i = 0; i < king.size(); i++) {
    kingyo tmp = king.get(i);
    tmp.Draw();
  }
  for(int i=0;i<SIZE;i++) {
    if(ripples[i].getFlag()) {
      ripples[i].move();
      ripples[i].rippleDraw();
    }
  }
  //ellipse(X, Y, 10, 10);
  if(millis() % 30 == 0){
    for(int i = 0; i < 5; i++){
      ripples[i].init(int(X[i]),int(Y[i]),random(5,10),int(random(190,220)));
    }
  }
}

void fallDraw(){
  background(0);
  noTint();
  image(back, width/2, height/2);
  for(int j=1;j<leaves.length;j++){
    leaves[j-1]=loadImage("落ち葉_"+j+".png"); 
  }
  if(millis() % 30 == 0){
    for(int i = 0; i < 5; i++){
        Levx = int(X[i]);
        Levy = int(Y[i]);
        Happa.add(new leave());
    }
  }
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
  if(millis() % 30 == 0){
    for(int i = 0; i < 5; i++){
      clacks[i].init(int(X[i]),int(Y[i]),random(5,10),int(random(100,170)));
    }
  }
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
      Levx = mouseX;
      Levy = mouseY;
      Happa.add(new leave());
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
      if(key == ';')
        Arei.add(new sakura());
      if((key == '-') && (Arei.size() > 0))
        Arei.remove(0);
      else{
        for(int i=SIZE-1;i>0;i--) {
          ripples[i] = new Ripple(ripples[i-1]);
        }
        ripples[0].init(int(random(0,width)),int(random(0,height)),random(5,15),int(random(190,230)));
      }
      break;
      
    case 2:
      if(key == ';')
        king.add(new kingyo());
      if((key == '-') && (king.size() > 0))
        king.remove(0);
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