
final int biggies = 10;
final int particles = 100;
final float speed = 15;

Particle[] particle = new Particle[particles + biggies];
float maxSpeed = 15;
float heightOfRoof = 0;

int counter;
void setup(){
  size(800, 800);
  
  randomSeed(23);
  for(int i = 0; i < biggies; i++){
    float size = sqrt(pow(300, 2) / (PI * biggies));
    particle[particle.length - biggies + i] = new Particle(size, 
      new PVector(random(width - 100), random(height)));
  }
  for(int i = 0; i < particle.length - biggies; i++){
    particle[i] = new Particle();
  }
  
  frameRate(30);
  for(int i = 0; i < particle.length; i++){
    particle[i].checkParticles(false);
  }
  
}

void draw(){
  heightOfRoof /= 1.1;
  
  if(frameCount / 30.0 >= TWO_PI){
    noLoop();
    println(counter);
    return;
  }
  //speed = -cos(frameCount / 30.0) * maxSpeed / 2 + maxSpeed / 2;
  background(30);
  
  
  noStroke();
  /*
  fill(40);
  rect(width - 100, 0, 100, height);
  fill(255);
  rect(0, 95, width - 100, 5);
  pushMatrix();
  translate(0, (95 - 20) - heightOfRoof * 5);
  triangle((width - 100) / 2 - 25, 25, (width - 100) / 2, 0, (width - 100) / 2 + 25, 25);
  popMatrix();
  rect((width - 100) / 2 - 10, 85 - heightOfRoof * 5, 20, heightOfRoof * 5 + 10);
  */
  color c = color(map(speed, 0, maxSpeed, 0, 230) + 25, 50, 200 - map(speed, 0, maxSpeed, 0, 200));
  
  float heightSpeed = map(speed, 0, maxSpeed, 0, height);
  fill(c);
  rect(width - 40, height - heightSpeed, 100, height);
  for(int i = 0; i < particle.length; i++){
    fill(c);
    particle[i].update();
    particle[i].draw();
  }
  for(int i = 0; i < particle.length; i++){
    particle[i].checkParticles(true);
  }
  fill(255);
  textSize(26);
  pushMatrix();
  textAlign(CENTER);
  translate(width - 40 - 13, height / 2);
  rotate(PI + HALF_PI);
  text("Temperatur", 0, 0);
  popMatrix();
  
  //saveFrame("output/fysik_idealgas_tryk"+nf(frameCount,3)+".png");
}
