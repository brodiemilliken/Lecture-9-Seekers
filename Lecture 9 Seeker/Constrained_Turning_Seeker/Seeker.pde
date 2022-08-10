class Seeker{
  PVector pos, vel;
  float mT, dir;
  public Seeker(float x, float y, float maxSpeed, float maxTurn){
    pos = new PVector(x,y);
    dir = -atan2(mouseX-pos.x,mouseY-pos.y) + PI/2;
    vel = new PVector(maxSpeed * cos(dir),maxSpeed * sin(dir));
    mT = maxTurn;
  }
  
  void show(){
    fill(255,50,50);
    push();
    translate(pos.x,pos.y);
    rotate(vel.heading());
    rect(-10,-5,20,10);
    pop();
  }
  
  void move(){  
    maxTurningConstraint();
    pos.add(vel);
  }
  
  void maxTurningConstraint(){
    dir = -atan2(mouseX-pos.x,mouseY-pos.y) + PI/2;
    float rotate = dir - vel.heading();

    if (rotate >= PI) rotate -= TWO_PI;
    
    if (rotate > mT) rotate = mT;
    else if (rotate < -mT) rotate = -mT;

    vel.rotate(rotate);
  }
}
