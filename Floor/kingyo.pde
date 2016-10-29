PImage[] Fish = new PImage[3];
int[] TIME = new int[3];
class kingyo{
  boolean flag;
  int ran, dis;
  int tranx, trany;
  float x, y;
  float angle;
  float way;
  int iro;
  int time;
  
  kingyo(){
    reset();
  }
  
  void reset(){
    x = random(width,0);
    y = random(0,height); 
    flag = true;
    iro = int(random(0,2));
    time = 0;
  }
  
  void Draw(){
    
    if(flag){
      ran = int(random(1,3));
      angle = (random(0,2*PI));
      way += angle;
      dis = int(random(100,300));
      tranx = int(random(-100,width+100));
      trany = int(random(-100,height+100));
      flag = false;
      time = TIME[ran];
    }
    
    else{
      switch(ran){
        case 1 :
          translate(x,y);// x -= x; y -= y;
          rotate(angle);
          image(Fish[iro],x,y,30,30);
          rotate(-angle);
          translate(-x,-y);
          x += cos(angle)*dis / TIME[ran];
          y += sin(angle)*dis / TIME[ran];
          break;
          
        case 2 :
          translate(tranx,trany);
          rotate(angle/TIME[ran]);
          image(Fish[iro],x,y,30,30);
          rotate(-angle/TIME[ran]);
          translate(-tranx,-trany);
          break;
      }      
      if(TIME[ran] <= 0){
        flag = true;
      }
      TIME[ran]--;
    }    
  }
}
ArrayList <kingyo> king;