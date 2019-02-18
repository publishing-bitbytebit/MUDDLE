class YellowTangs{
  //properties of fish
  float x, y, w;
  float Xspeed;
  
  //constructor function
  YellowTangs(float x, float y){
    this.x = x;
    this.y = y;
    w = 10;
    Xspeed = random(1, 2);
  }
    
  void swim(){
    //gradually move across the screen
    x = x - Xspeed;
    
    //loop back around 
    if(x < 0){
      x = 1050;
    }
  }
  
  void display(){
  noStroke();
  
  /* Here I used the for loop established for the 
  Rain Drop game and reversed its direction. Then I 
  layered the tear drops over one another to create 
  depth. */
  
  //tail fin
  fill(234, 255, 15);
  for (int i = 2; i < 8; i++) {
      ellipse(this.x+13 + i*4, this.y, i*2, i*2.5);
  }
  for (int i = 2; i < 8; i++) {
      fill(232, 184, 7, 127);
      ellipse(this.x+10 + i*4, this.y, i+3, i*1.5);
  }
  
  /* Here I just played with the tear drop 
  again to create a layering effect.*/
  
  //fish lips
  fill(255, 247, 0);
  for (int i = 2; i < 8; i++) {
      ellipse(this.x - 11 - i*2, this.y, i, i-1);
  }
  
  //dorsal fin
  fill(234, 255, 15);
  ellipse(this.x-5, this.y-7, w+20, w*3);
  ellipse(this.x, this.y-8, w+20, w*3);
  ellipse(this.x+5, this.y-9, w+20, w*3);
  ellipse(this.x+10, this.y-10, w+20, w*3);
  ellipse(this.x+12, this.y-9, w+20, w*3);
  
  //anal fin
  fill(232, 184, 7);
  ellipse(this.x+5, this.y+5, w+10, w*2);
  ellipse(this.x+10, this.y+6, w+10, w*2);
  fill(234, 255, 15);
  ellipse(this.x+16, this.y+6, w+10, w*2);
    
  
  //body of fish
  fill(255, 247, 0);
  ellipse(this.x+2, this.y-2, w*5, w*3);
  fill(234, 255, 15);
  ellipse(this.x-13, this.y, w*2+5, w*1.5);
  
  //fish eye
  fill(232, 184, 7);
  ellipse(this.x-16, this.y-5, w-3, w-3);
  fill(0);
  ellipse(this.x-16, this.y-5, w-6, w-6);
  
  //fins
  fill(232, 184, 7, 127);
  ellipse(this.x, this.y-2, w+2, w+10);
  fill(234, 255, 15);
  ellipse(this.x-2, this.y+4, w-2, w-2);
 
  }
   
   /*Here I adapted the caught function from the Rain
   Drop game.*/
   
   void caught(){
     //The fish will go off screen when intersected, then continue
     //to swim gradually across the screen. Allows for unlimited play time.
     x = 1050;
   }
}