class Pipe
{
  int xi;
  int yi;
  int pipeWidth;
  int gap;
  int yj;
  int bot;
  
  //constructor
  Pipe()
  {
    xi = 0;
    yi = width;
    pipeWidth = 75;
    gap = 250;
    yj = (int)random(50, 450);
    bot = - (height - (yj + gap));
  }
  
  void render()
  {
    stroke(255);
    fill(0 , 255, 0);
    
    //top pipe
    rect(yi, xi, pipeWidth, yj);
    
    //bottom pipe
    rect(yi, height, pipeWidth, bot);
  }
  
  void update()
  {
    yi -= 5;
  }
  
  void checkCollision()
  {
    
  }
}