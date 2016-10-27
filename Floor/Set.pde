void Set(){
  switch(season){
    case 1:
    imageMode(CORNER);
    back = loadImage("stone.jpg");
    FRICTION = 0.985;
    break;
    
    case 2:
    imageMode(CORNER);
    back = loadImage("summer.png");
    back.resize(width,height);
    break;
    
    case 3:
    imageMode(CORNER);
    back = loadImage("leaves.jpg");
    back.resize(width,height);
    hibi = loadImage("leave.png");
    break;
    
    case 4:
    imageMode(CENTER);
    back = loadImage("huyu.jpg");
    back.resize(width,height);
    hibi = loadImage("hibi.png");
    SIZE = 20;
    FRICTION = 0.985;
    break;
  }
}