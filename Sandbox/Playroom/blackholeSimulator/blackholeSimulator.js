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
const particleColors = [];

let mouse;
let shouldRepel = false;

class Particle {
  constructor(
    x = random(width),
    y = random(height),
    size = random(10, 60),
    fillColor = this.varyColor(particleColors[floor(random(particleColors.length))], 35)
  ) {
    Object.assign(this, { x, y, size, fillColor });
  }

  display() {
    fill(this.fillColor);
    ellipse(this.x, this.y, this.size, this.size);
  }

  delete() {
    this.size = 0;
    this.x = -100;
    this.y = -100;
  }

  varyColor(colorToChange, deviation) {
    const r = floor(random(red(colorToChange) - deviation, red(colorToChange) + deviation));
    const g = floor(random(green(colorToChange) - deviation, green(colorToChange) + deviation));
    const b = floor(random(blue(colorToChange) - deviation, blue(colorToChange) - deviation));
    return color(r, g, b);
  }

  distanceFrom(neighborParticle) {
    return sqrt(
      sq(neighborParticle.x - this.x, 2)
      + sq(neighborParticle.y - this.y, 2)
    );
  }

  attractTo(particle) {
    const distance = this.distanceFrom(particle);
    const directionX = (particle.x - this.x) / distance;
    const directionY = (particle.y - this.y) / distance;
    const gravitation = ((G * this.size * particle.size) / sq(distance, 2));

    if (shouldRepel) {
      this.x -= directionX * gravitation;
      this.y -= directionY * gravitation;
    } else {
      this.x += directionX * gravitation;
      this.y += directionY * gravitation;
    }

    // Blackhole swallow behavior
    if (
      particle.x - (particle.size / 3) <= this.x && this.x <= particle.x + (particle.size / 3)
      && particle.y - (particle.size / 3) <= this.y && this.y <= particle.y + (particle.size / 3)
    ) {
      particle.size += this.size / 100;
      this.delete();
    }
  }
}

function resetSystem(numOfParticles) {
  for (let i = 0; i < numOfParticles; i += 1) {
    system[i] = new Particle();
  }
}

function setup() {
  createCanvas(1178, 663);
  particleColors[0] = color(37, 115, 171); //Neptune blue
  particleColors[1] = color(171, 37, 44);  //Mars red
  particleColors[2] = color(171, 97, 37); //Mercury brown
  particleColors[3] = color(108, 171, 37);  //Earth green

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
