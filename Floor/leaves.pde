class leave{
  int x, y;
  int count;
  leave(){
    reset();
  }
  
  void Draw(int num_) {
    
    image(leaves[count], x, y);
    count++;
    if(count > 27)
    Happa.remove(num_);
    
  }
  
  void reset(){
    x = Levx;
    y = Levy;
    count = 0;
  }
  
  void addd(int x_, int y_){
    if(Happa.size() > 0)
    Happa.add(new leave());
  }
}

ArrayList<leave> Happa;