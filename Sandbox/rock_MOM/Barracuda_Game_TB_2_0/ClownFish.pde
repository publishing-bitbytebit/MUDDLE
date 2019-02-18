class ClownFish {
  //properties of fish
  float x, y, w;
  float Xspeed;

  //constructor function
  ClownFish(float x, float y) {
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
    fill(0);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x+15 + i*4, this.y, i*2, i*3);
    }
    for (int i = 2; i < 8; i++) {
      fill(252, 91, 10);
      ellipse(this.x+10 + i*4, this.y, i+6, i*1.5);
    }

    /* Here I just played with the tear drop 
     again to create a layering effect.*/

    //fish lips
    fill(252, 166, 59);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x - 10 - i*2, this.y, i+2, i);
    }

    //front dorsal fin
    fill(0);
    ellipse(this.x, this.y-12, w+4, w+3);

    //back dorsal fin
    ellipse(this.x+20, this.y-10, w+3, w+2);

    //anal fin
    ellipse(this.x+20, this.y+10, w+3, w+2);


    //body of fish
    noStroke();
    fill(0);
    ellipse(this.x+2, this.y-2, w*5, w*2+4);
    fill(252, 91, 10);
    ellipse(this.x, this.y, w*5+2, w*2+4);

    //part of front dorsal fin
    fill(216, 80, 0, 200);
    ellipse(this.x-1, this.y-9, w+2, w+3);

    //part of back dorsal fin
    ellipse(this.x+18, this.y-7, w+1, w+1);

    //part of anal fin
    ellipse(this.x+18, this.y+7, w+1, w+1);


    //white patch near eye
    fill(255);
    ellipse(this.x-14, this.y-6, w-2, w-2);
    ellipse(this.x-12, this.y-4, w-2, w-2);
    ellipse(this.x-10, this.y-2, w-2, w-2);
    ellipse(this.x-12, this.y+2, w-2, w-2);
    ellipse(this.x-12, this.y+4, w-2, w-2);
    ellipse(this.x-14, this.y+6, w-2, w-2);

    //white patch down middle of body
    ellipse(this.x+8, this.y-6, w-2, w+1);
    ellipse(this.x+6, this.y-5, w, w-2);
    ellipse(this.x+8, this.y-2, w-2, w-2);
    ellipse(this.x+8, this.y+2, w-2, w-2);
    ellipse(this.x+6, this.y+4, w, w-2);
    ellipse(this.x+8, this.y+6, w-2, w+1);

    //white patch at base of tail fin
    ellipse(this.x+26, this.y, w, w-1);
    fill(216, 80, 0);
    ellipse(this.x+30, this.y, w-2, w-2);

    //fish eye
    fill(100, 22, 4);
    ellipse(this.x-18, this.y-2, w-3, w-3);
    fill(0);
    ellipse(this.x-18, this.y-2, w-6, w-6);

    //fins
    strokeWeight(2.5);
    stroke(0);
    fill(216, 80, 0);
    ellipse(this.x, this.y, w+2, w+2);
    noStroke();
    ellipse(this.x-3, this.y+3, w, w+1);
  }

  /*Here I adapted the caught function from the Rain
   Drop game.*/

  void caught() {
    //The fish will go off screen when intersected, then continue
    //to swim gradually across the screen. Allows for unlimited play time.
    x = 1050;
  }
}