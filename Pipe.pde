class Pipe
{
  int xi;
  int yi;
  int pipeWidth;
  int gap;
  int yj;
  
  //constructor
  Pipe()
  {
    xi = width;
    yi = width;
    pipeWidth = 50;
    gap = 100;
    yj = (int)random(0, 500);
  }
  
  void render()
  {
    
    
    stroke(255);
    fill(0 , 255, 0);
    rect(yi, xi + pipeWidth, pipeWidth, yj);
  }
  
  void update()
  {
    yi -= 5;
  }
}