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
    xi = 0;
    yi = width;
    pipeWidth = 75;
    gap = 100;
    yj = (int)random(0, 500);
  }
  
  void render()
  {
    stroke(255);
    fill(0 , 255, 0);
    rect(yi, xi, pipeWidth, yj);
  }
  
  void update()
  {
    yi -= 5;
  }
}