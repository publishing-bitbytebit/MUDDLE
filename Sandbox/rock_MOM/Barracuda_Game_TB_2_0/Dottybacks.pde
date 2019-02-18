class Dottybacks {
  //properties of fish
  float x, y, w;
  float Xspeed;

  //constructor function
  Dottybacks(float x, float y) {
    this.x = x;
    this.y = y;
    w = 10;
    Xspeed = random(1, 2);
  }

  void swim() {
    //gradually move across the screen
    x = x - Xspeed;

    //loop back around 
    if (x < 0) {
      x = 1050;
    }
  }

  void display() {
    noStroke();

    /* Here I used the for loop established for the 
     Rain Drop game and reversed its direction. Then I 
     layered the tear drops over one another to create 
     depth. */

    //tail fin
    fill(37, 45, 245);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x+15 + i*4, this.y, i*2, i*2);
    }
    for (int i = 2; i < 8; i++) {
      fill(123, 54, 255);
      ellipse(this.x+10 + i*4, this.y, i, i);
    }

    /* Here I just played with the tear drop 
     again to create a layering effect.*/

    //fish lips
    fill(229, 12, 219);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x - 11 - i*2, this.y, i, i-1);
    }

    //body of fish
    fill(37, 45, 245);
    ellipse(this.x+2, this.y-2, w*5, w*2);
    fill(216, 37, 245);
    ellipse(this.x, this.y, w*5+2, w*2);

    //fish eye
    fill(37, 45, 245);
    ellipse(this.x-14, this.y-2, w-3, w-3);
    fill(0);
    ellipse(this.x-14, this.y-2, w-6, w-6);

    //fins
    strokeWeight(1);
    stroke(50);
    fill(229, 12, 219);
    ellipse(this.x, this.y-2, w+2, w+2);
    noStroke();
    ellipse(this.x-3, this.y-1, w-2, w-2);
  }

  /*Here I adapted the caught function from the Rain
   Drop game.*/

  void caught() {
    //The fish will go off screen when intersected, then continue
    //to swim gradually across the screen. Allows for unlimited play time. 
    x = 1050;
  }
}