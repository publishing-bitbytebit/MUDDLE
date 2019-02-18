import processing.sound.*;
SoundFile intro;

/* Game Objective: Maneuver the Barracuda to help him catch his dinner!
 Swim toward the reef fish using the UP arrow to rise and the LEFT
 arrow to charge forward. Beware though, the jellyfish are deadly
 and if eaten the score the Barracuda will receive a nasty shock! */

PImage photo1, photo2;//Reef background image
PFont f;
int score = 0;//score variable
int lives = 5; //lives variable
float x = 10;//Used to simplify hard coded numbers
float y = 10;//in the main body of the code.
boolean splash = true;
boolean gameOver = false;

//array of jellyfish that affect the score
Jellyfish [] jellies1 = new Jellyfish[5];

//array of jellyfish that appear when the game ends
Jellyfish [] jellies2 = new Jellyfish[5];

Bubbles [] bubbles = new Bubbles[10];
YellowTangs [] species3 = new YellowTangs[5];
ClownFish [] species2 = new ClownFish[5];
Dottybacks [] species1 = new Dottybacks[10];
Barracuda user;

void setup() {
  size(1000, 675);
  photo1 = loadImage("reef2.jpg");
  photo2 = loadImage("fishbones.png");
  f = createFont("Cooper Black", 12, true);

  intro = new SoundFile(this, "BARRACUDA_INTRO.wav");
  
  if(splash == true) {
    intro.play();
  } 

  user = new Barracuda(x*105, height/2);

  //initialize Dottybacks class (purple fish)
  for (int i = 0; i < species1.length; i ++) {
    species1[i] = new Dottybacks(x*105, random(x*10, y*60));
  }

  //initialize ClownFish class (orange fish)
  for (int i = 0; i < species2.length; i ++) {
    species2[i] = new ClownFish(x*105, random(x*10, y*60));
  }

  //initialize YellowTangs class (yellow fish)
  for (int i = 0; i < species3.length; i ++) {
    species3[i] = new YellowTangs(x*105, random(x*10, y*60));
  }

  //initialize Jellyfish that will be interacted with in the game
  for (int i = 0; i < jellies1.length; i ++) {
    jellies1[i] = new Jellyfish(random(x*5, y*95), random(y*70), x*2+5);
  } 

  //initialize Jellyfish that will appear when the game ends
  for (int i = 0; i < jellies2.length; i ++) {
    jellies2[i] = new Jellyfish(random(x*5, y*95), random(y*70), x*2+5);
  }


  //initialize Bubbles class
  for (int i = 0; i < bubbles.length; i ++) {
    bubbles[i] = new Bubbles(random(x*5, y*95), random(y*70), x*2+5);
  }
}

void draw() {
  image(photo1, 0, 0);

  if (splash) {
    textFont(f, 64);
    textAlign(CENTER); 
    fill(142, 17, 17);
    text("BARRACUDA", width/2, height/2-50);
    textFont(f, 28);
    text("CLICK TO START", width/2, height/2+170);
    fill(255);
    text("Maneuver the Barracuda to help him catch his dinner!", width/2, height/2+10);
    text("Swim toward the reef fish using the UP arrow to rise", width/2, height/2+40);
    text("and the LEFT arrow to charge forward.", width/2, height/2+70);
    text("Beware though, the jellyfish are deadly and if eaten", width/2, height/2+100);
    text("the Barracuda will receive a nasty shock!", width/2, height/2+130);

    if (mousePressed == true) {
      splash = false; //Game starts when user clicks the mouse.
    }
  } else if (gameOver == true) {
    textFont(f, 64);
    textAlign(CENTER);
    fill(142, 17, 17);
    text("GAME OVER", width/2, height/2); //If game over is true, display "GAME OVER" and the user's end score. 
    textFont(f, 30);
    textAlign(CENTER);
    fill(255);
    text("SCORE: " + score, width/2, height/2+40);

    for (int i = 0; i < jellies1.length; i ++) { //jellyfish will appear and float upward when the game over sequence starts. 
      jellies2[i].display();
      jellies2[i].floatUp();
    }
  } else {

    //This is the charge function for the barracuda.
    if (keyPressed && keyCode == 37) {
      user.attack(true);
    } else {
      user.attack(false);
    }

    //This is the rise/fall function adapted from the flappy bird
    //exercise you showed us in class. This is also a function of the Barracuda.
    if (keyPressed && keyCode == 38) {
      user.move(true);
    } else {
      user.move(false);
    }

    //move and display Barracuda
    user.swim();
    user.display();

    //move and display Dottybacks
    for (int i = 0; i < species1.length; i ++) {
      species1[i].display();
      species1[i].swim();

      // This is the caught function for each fish species. 
      if (dist(species1[i].x, species1[i].y, user.x-x*16, user.y-y) < 20) {
        //look out for the barracuda!
        species1[i].caught();
        //Score increases by one when a fish is caught
        score++;
      }
    }

    //move and display ClownFish
    for (int i = 0; i < species2.length; i ++) {
      species2[i].display();
      species2[i].swim();

      if (dist(species2[i].x, species2[i].y, user.x-x*16, user.y-y) < 20) {
        //look out for the barracuda!
        species2[i].caught();
        score++;
      }
    }

    //move and display YellowTangs
    for (int i = 0; i < species3.length; i ++) {
      species3[i].display();
      species3[i].swim();

      if (dist(species3[i].x, species3[i].y, user.x-x*16, user.y-y) < 20) {
        // look out for the barracuda!
        species3[i].caught();
        score++;
      }
    }

    //move and display Bubble class
    //bubbles float gently upward
    for (int i = 0; i < bubbles.length; i ++) {
      bubbles[i].display();
      bubbles[i].floatUp();
    }

    //move and display Jellyfish class
    //Jellyfish float upward
    for (int i = 0; i < jellies1.length; i ++) {
      jellies1[i].display();
      jellies1[i].floatUp();

      if (dist(jellies1[i].x, jellies1[i].y, user.x-x*16, user.y-y) < 20) {
        // look out for the barracuda!
        jellies1[i].caught();
        //Lives will decrease when a jellyfish is caught.
        lives --;

        if (lives <= 0) { //If you run out of lives, the game will end.
          gameOver = true;
        }
      }
    }

    /*The Score display and function was adapted straight from the Rain Catcher game. 
     The Lives function and display was adapted from the Improved Rain Catcher game. */
    fill(255);
    textSize(24);
    text("Score: " +score, x*6, y*5);
    text("Lives: " +lives, x*6, y*5+30);
    image(photo2, x, y*5+40); //this is the little fishbones image next to the lives bar
    photo2.resize(30, 30); 
    fill(142, 17, 17);
    rect(x+40, y*5+50, lives*10, 10);
  }
}