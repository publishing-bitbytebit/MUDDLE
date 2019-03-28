/*
 * Black Hole Simulator
 * Original Processing sketch: 30-03-2017
 * p5.js version: 28-03-2019
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
  mouse = new Particle(width / 2, height / 2, initBlackHoleSize, color(0));
  resetSystem(numOfParticles);
}

function keyPressed() {
  if (keyCode === ' ') {
    resetSystem(numOfParticles);
    mouse.size = initBlackHoleSize;
  }
  if (keyCode === 'r') {
    shouldRepel = !shouldRepel;
  }
}

function draw() {
  background(bgImage);

  mouse.x = mouseX;
  mouse.y = mouseY;

  for (let i = 0; i < system.length; i += 1) {
    system[i].display();
    if (mousePressed) system[i].attractTo(mouse);
  }

  mouse.display();
}

function varyColor(color, deviation) {
  const red = floor(random(red(color) - deviation, red(color) + deviation));
  const green = floor(random(green(color) - deviation, green(color) + deviation));
  const blue = floor(random(blue(color) - deviation, blue(color) - deviation));
  return color(red, green, blue);
}
