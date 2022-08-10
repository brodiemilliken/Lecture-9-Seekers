class Seeker{
  PVector pos, vel;
  float maxS, minS, mT, mTC, mA, dir, a, aP;
  
  public Seeker(float x, float y, float maxSpeed, float minSpeed, float maxAcceleration, float accelerationPoint, float maxTurnConst){
    pos = new PVector(x,y);
    dir = -atan2(mouseX-pos.x,mouseY-pos.y) + PI/2;
    vel = new PVector(maxSpeed * cos(dir),maxSpeed * sin(dir));
    maxS = maxSpeed;
    minS = minSpeed;
    mA = maxAcceleration;
    mTC = maxTurnConst;
    aP = accelerationPoint;
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
    //Call set max turn rate method
    setTurnRate();
    dir = -atan2(mouseX-pos.x,mouseY-pos.y) + PI/2;
    float rotate = dir - vel.heading();

    if (rotate >= PI) rotate -= TWO_PI;
    
    //After finding rotate, call acceleration
    acceleration(rotate);

    if (rotate > 0 && rotate > mT) rotate = mT;
    else if (rotate < 0 && rotate < -mT) rotate = -mT;

    vel.rotate(rotate);
    
    //accelerate velocity vector
    if (a > 0) vel.mult(mA);
    else vel.div(mA);
    
    //constrain velocity vector
    if (vel.mag() > maxS) vel.setMag(maxS);
    else if (vel.mag() < minS) vel.setMag(minS);
  }
  
  void setTurnRate(){
    mT = 1/(vel.mag() + mTC);
  }
  
  void acceleration(float rotation){
    if (abs(rotation) < aP) a = 1;
    else a = -1;
  }
}
