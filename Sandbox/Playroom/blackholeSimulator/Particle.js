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
  
  float distanceFrom(Particle p) {
    return sqrt(sq(p.x - this.x) + sq(p.y - this.y));
  }
 
  void attractTo(Particle p) {
    float distance = distanceFrom(p);
    float directionX = (p.x - x) / distance;
    float directionY = (p.y - y) / distance;
    float gravitation = ((G * this.size * p.size) / sq(distance));
    
    if(shouldRepel) {
      this.x -= directionX * gravitation;
      this.y -= directionY * gravitation;
    } else {
      this.x += directionX * gravitation;
      this.y += directionY * gravitation;
    }
    
    //Blackhole swallow behavior
    if(p.x-(p.size/3) <= this.x && this.x <= p.x+(p.size/3) &&
       p.y-(p.size/3) <= this.y && this.y <= p.y+(p.size/3)) {
         p.size += this.size / 100;
         this.delete();
    }
  }
}
