class Bubbles {
  //bubble properties
  float x, y, w;
  float Yspeed;

  //constructor
  Bubbles(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    Yspeed = random(-.5, -1);
  }

  //the bubbles will float upward and loop back around
  void floatUp() {
    y += Yspeed;

    if (y < 0) {
      y = 600;
    }
  }

  //The Bubble display is just two circles overlayed on one another.
  void display() {
    noStroke();
    fill(211, 214, 234);
    ellipse(this.x, this.y, this.w, this.w);
    fill(255);
    ellipse(this.x+3, this.y-3, this.w-12, this.w-12);
  }
}