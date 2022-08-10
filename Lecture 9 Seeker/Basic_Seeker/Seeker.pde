class Seeker{
  PVector pos;
  float mS, dir;
  public Seeker(float x, float y, float maxSpeed){
    pos = new PVector(x,y);
    mS = maxSpeed;
  }
  
  void show(){
    fill(255,50,50);
    push();
    translate(pos.x,pos.y);
    rotate(dir);
    rect(-10,-5,20,10);
    pop();
  }
  
  void move(){
    dir = -atan2(mouseX-pos.x,mouseY-pos.y) + PI/2;
    pos.add(PVector.fromAngle(dir).mult(mS));

  }
}
