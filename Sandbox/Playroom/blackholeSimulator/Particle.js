class Particle {
  Particle() {
    this.x = random(width);
    this.y = random(height);
    this.size = random(10,60);
    this.fillColor = varyColor(particleColors[floor(random(particleColors.length))], 35);
  }

  Particle(x, y, size, fillColor) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.fillColor = fillColor;
  }

  display() {
    fill(fillColor);
    ellipse(this.x, this.y, this.size, this.size);
  }

  delete() {
    this.size = 0;
    this.x = -100;
    this.y = -100;
  }

  distanceFrom(neighborParticle) {
    return sqrt(
      sq(neighborParticle.x - this.x, 2)
      + sq(neighborParticle.y - this.y, 2)
    );
  }

  attractTo(particle) {
    const distance = this.distanceFrom(particle);
    const directionX = (particle.x - x) / distance;
    const directionY = (particle.y - y) / distance;
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
