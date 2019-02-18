class Jellyfish {
  //jellyfish properties
  float x, y, w;
  float Yspeed;

  //constructor
  Jellyfish(float x, float y, float w) {
    this.x = x;
    this.y = y;
    this.w = w;
    Yspeed = random(-.5, -1);
  }

  //the jellyfish will float upward and loop back around
  void floatUp() {
    y += Yspeed;

    if (y < 0) {
      y = 600;
    }
  }


  void display() {

    //body of Jellyfish
    noStroke();
    fill(243, 235, 250, 200);
    ellipse(this.x, this.y+8, this.w*1.8, this.w-10);
    fill(255);
    ellipse(this.x-7, this.y, this.w/5+5, this.w/5+10);
    ellipse(this.x, this.y-3, this.w/5+5, this.w/5+10);
    ellipse(this.x+7, this.y, this.w/5+5, this.w/5+10);
    fill(192, 138, 240, 127);
    ellipse(this.x, this.y, this.w*2, this.w+9);
  }

  /* Here I adapted the caught function from the Rain
   Drop game.*/

  void caught() {
    Yspeed = random(-.5, -1);
    y = 700;
    //When the barracuda catches a jellyfish, the reef background image 
    //flashes quickly (like electricity) and the score returns to 0.
    if (Yspeed == random(-.5, -1)) {
      filter(THRESHOLD, 0.5); //Affects the Pimage
    }
  }
}