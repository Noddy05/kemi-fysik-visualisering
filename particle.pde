class Particle{
  
  PVector direction = new PVector(1, 1).normalize();
  PVector position = new PVector(random(15, width - 100 - 15), random(15, height));
  boolean bigParticle = false;
  float rad = 15;
  
  Particle(){
    direction = new PVector(random(-1, 1), random(-1, 1)).normalize();
    
  }
  
  Particle(float rad, PVector position){
    this.rad = rad;
    bigParticle = true;
    direction = new PVector();
    this.position = position;
  }
  
  void update(){
    if(bigParticle)
      return;
    
    position.add(direction.copy().mult(speed));
    checkWalls();
  }
  
  void checkParticles(boolean count){
    for(int i = 0; i < particle.length; i++){
      Particle other = particle[i];
      if(other == this)
        continue;
        
      
      float dist = dist(position.x, position.y, other.position.x, other.position.y);
      if(dist <= (rad + other.rad) / 2){
        if(other.bigParticle && count){
          counter++;
        }
        direction = position.copy().sub(other.position).normalize();
        if(other.bigParticle)
          position.sub(direction.copy().mult(dist - (rad + other.rad) / 1.95));
      }
    }
  }
  
  void checkWalls(){
    if(position.x < 0){
      direction.x *= -1;
      position.x = 0;
    }
    if(position.x > width - 100 - 15 / 2){
      direction.x *= -1;
      position.x = width - 100 - 15 / 2;
    }
    if(position.y < 15 / 2){
      direction.y *= -1;
      position.y = 15 / 2;
      heightOfRoof += 0.5;
    }
    if(position.y > height){
      direction.y *= -1;
      position.y = height;
    }
  }
  
  void draw(){
    if(bigParticle){
      fill(255);
    }
    
    circle(position.x, position.y, rad);
  }
}
