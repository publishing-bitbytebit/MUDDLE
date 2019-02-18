class Barracuda {
  //properties of fish
  float x, y, w;
  float Xspeed;

  //constructor function
  Barracuda(float x, float y) {
    this.x = x;
    this.y = y;
    w = 10;
    Xspeed = (1.5);
  }

  void swim() {
    //move across the screen
    this.x = this.x - Xspeed;

    //loop back around 
    if (this.x < 0) {
      this.x = 1050;
    }
  }

  /* The raionale for the term "hunting" here is while the user
   hovers in the frame, they can manipulate the Barracuda's position
   to execute the charge function, essentially preparing for the hunt. */

  void move(boolean hunting) {
    if (hunting) {
      this.y -= 1.5; //rise
    } else {
      this.y += .5; //fall
    }
  }

  //The Barracuda will charge forward very quickly
  void attack(boolean attack) {
    if (attack) {
      this.Xspeed += .3;
    } else {
      this.Xspeed -= Xspeed;
    }

    //The Barracuda will stay within the sketch. If he falls to the 
    //bottom, he will sit there until the rise key is hit. 
    this.y = constrain(this.y, 0+15, height-15);
  }


  void display() {
    noStroke();

    /* Here I used the for loop established for the 
     Rain Drop game and reversed its direction. Then I 
     layered the tear drops over one another to create 
     depth. */

    //tail fin
    fill(5, 7, 72);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x+25 + i*6, this.y, i*6, i*6);
    }
    for (int i = 2; i < 8; i++) {
      fill(63, 101, 160);
      ellipse(this.x+15 + i*6, this.y, i*3, i*3);
    }

    /* Here I just played with the tear drop 
     again to create a layering effect.*/

    //lower fin no.1
    stroke(0);
    strokeWeight(.5);
    fill(5, 7, 72);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x-110, this.y + i*4, i*3, i*2);
    }

    //main body of fish
    noStroke();
    fill(5, 7, 72);
    ellipse(this.x-60, this.y-6, w*20, w*4);
    fill(63, 101, 160);
    ellipse(this.x-85, this.y, w*24, w*4);

    //spots on upper body
    stroke(0);
    fill(5, 7, 72);
    ellipse(this.x-60, this.y-15, w+4, w+5);
    ellipse(this.x-40, this.y-13, w+3, w+4);
    ellipse(this.x-20, this.y-12, w+2, w+3);
    ellipse(this.x, this.y-10, w+1, w+2);
    ellipse(this.x-80, this.y-15, w+3, w+4);
    ellipse(this.x-100, this.y-13, w+2, w+3);
    ellipse(this.x-120, this.y-12, w+1, w+2);
    ellipse(this.x+20, this.y-8, w-1, w);

    //spots on lower body
    ellipse(this.x-60, this.y+13, w+3, w+4);
    ellipse(this.x-40, this.y+11, w+2, w+3);
    ellipse(this.x-20, this.y+10, w+1, w+2);
    ellipse(this.x, this.y+8, w, w+1);
    ellipse(this.x-80, this.y+13, w+2, w+3);
    ellipse(this.x-100, this.y+11, w+1, w+2);
    ellipse(this.x-120, this.y+10, w, w+1);
    ellipse(this.x+20, this.y+6, w-1, w);

    //lower fin no.2
    stroke(0);
    strokeWeight(.5);
    fill(5, 7, 72);
    for (int i = 2; i < 8; i++) {
      ellipse(this.x-105, this.y + 10 + i*2, i*3, i*2);
    }

    //gills
    stroke(0);
    strokeWeight(1);
    fill(63, 101, 160);
    ellipse(this.x-140, this.y-2, w*4, w*3);
    noStroke();
    ellipse(this.x-145, this.y-1, w*4, w*3);

    //fish eye
    noStroke();
    fill(37, 45, 245);
    ellipse(this.x-145, this.y-5, w+5, w+5);
    fill(202, 220, 247);
    ellipse(this.x-145, this.y-5, w, w);
    fill(0);
    ellipse(this.x-145, this.y-5, w-4, w-4);

    //teeth
    fill(255);
    ellipse(this.x-198, this.y+2, w-1, w-1);
    ellipse(this.x-188, this.y+2, w-1, w-1);
    ellipse(this.x-178, this.y+2, w-1, w-1);
    ellipse(this.x-168, this.y+2, w-1, w-1);

    //mouth of fish
    fill(59, 2, 2);
    ellipse(this.x-200, this.y+2, w+3, w-2);
    ellipse(this.x-192, this.y+2, w+3, w-2);
    ellipse(this.x-182, this.y+2, w+3, w-2);
    ellipse(this.x-172, this.y+2, w+3, w-2);
    ellipse(this.x-162, this.y+2, w+3, w-2);
  }
}