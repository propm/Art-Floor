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
      angle = random(0,2*PI);
      way = random(0,2*PI);
      dis = int(random(100,300));
      tranx = int(random(0,width));
      trany = int(random(0,height));
      flag = false;
      time = TIME[ran];
    }else{
      switch(ran){
        case 1 :
          /*translate(x,y);// x -= x; y -= y;
          rotate(angle-PI/2);
          image(Fish[iro],0,0,30,30);
          rotate(-angle+PI/2);
          translate(-x,-y);
          x += cos(angle)*dis / TIME[ran];
          y += sin(angle)*dis / TIME[ran];
          break;*/
          
        case 2 :
          translate(tranx,trany);
          rotate(way);
          translate(-tranx + x, -trany + y);
          rotate(PI/2);
          image(Fish[iro],x-tranx,y-trany,30,30);
          rotate(-PI/2);
          translate(tranx - x,trany - y);
          rotate(-way);
          translate(-tranx,-trany);
          way += angle/TIME[ran];
          break;
      }      
      if(time <= 0){
        flag = true;
      }
      time--;
    }    
  }
}
ArrayList <kingyo> king;