float FRICTION = 0.985;
public class Clack{
  int x,y;
  int size;
  int fade;
  float dia;
  float speed;
  boolean flag;
  
  Clack() {
    init(0,0,0,0);
    flag = false;
  }

  public Clack(Clack src) {
    this.x = src.x;
    this.y = src.y;
    this.speed = src.speed;
    this.size = src.size;
    this.dia = src.dia;
    this.flag = src.flag;
    this.fade = src.fade;
  }

  public void init(int _x, int _y, float _speed, int _size) {
    x = _x;
    y = _y;
    speed = _speed;
    size = _size;
    dia = 0.0;
    fade = 0;
    flag = true;
  }

  public void rippleDraw() {
    noFill();
    tint(360,360-fade);
    image(hibi,x,y,size,size);
  }

  public void move() {
    dia += speed;
    speed *= FRICTION;
    if(speed < 2.0){
      fade += 5;
    }
    if(speed < 0.5) {
      flag = false;
    }
  }

  public boolean getFlag() {
    return flag;
  }
}