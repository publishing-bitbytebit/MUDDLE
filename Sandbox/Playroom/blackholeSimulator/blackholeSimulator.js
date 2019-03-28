/*
 * Black Hole Simulator
 * @gmoe 30-03-2017
 *
 * Your mouse is now a black hole!
 * 
 * Space: Reset current environment
 * r: Toggle repel/attract behavior
 */

const initBlackHoleSize = 75;
const numOfParticles = 750;
const G = 6.67;

const system = [];
const particleColors = [
  color(37, 115, 171), //Neptune blue
  color(171, 37, 44),  //Mars red
  color(171, 97, 37), //Mercury brown
  color(108, 171, 37)  //Earth green
];

let bgImage;
let mouse;
let shouldRepel = false;

function resetSystem(int numOfParticles) {
  for (let i = 0; i < numOfParticles; i += 1) {
    system[i] = new Particle();
  }
}

function setup() {
  size(1178, 663);
  bgImage = loadImage("stars.jpg");
  mouse = new Particle(width/2, height/2, initBlackHoleSize, color(0));
  resetSystem(numOfParticles);
}

void keyPressed() {
  if(key == ' ') {
    resetSystem(numOfParticles);
    mouse.size = initBlackHoleSize;
  }
  if(key == 'r') {
    shouldRepel = !shouldRepel;
  }
}

void draw() {
  background(bgImage);
  
  for(Particle p: system) {
    p.display(); 
  }
  
  mouse.display();
  mouse.x = mouseX;
  mouse.y = mouseY;
  
  if(mousePressed) {
    for(int i=0; i < system.length; ++i) {
      system[i].attractTo(mouse);
    }
  }
}

void resetSystem(int numOfParticles) {
  system = new Particle[numOfParticles];
  for(int i=0; i < system.length; ++i) {
    system[i] = new Particle();
  }
}

color varyColor(color c, int deviation) {
  int red = floor(random(red(c)-deviation, red(c)+deviation));
  int green = floor(random(green(c)-deviation, green(c)+deviation));
  int blue = floor(random(blue(c)-deviation, blue(c)-deviation));
  return color(red, green, blue);
}