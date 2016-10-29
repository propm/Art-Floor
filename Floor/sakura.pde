class sakura{
  float x, y;
  float r;
  
  sakura() {
    reset();
  }
  
  void Draw() {
    
    x = move(x);
    y = move(y);
    translate(x, y);
    rotate(r);
    image(sakura, 0, 0, 20, 20);
    rotate(-r);
    translate(-x, -y);
      
  }
  
  void reset() {
    x = random(width);
    y = random(height);
    r = random(0, 2*PI);
  }
  
  float move(float xy){
    if(xy > 600){
      xy = 0;
    }else if(xy < 0){
      xy = 600;
    }else{
      xy += random(-0.04, 0.01);
    }
      
    return xy;
  }
}

ArrayList<sakura> Arei;