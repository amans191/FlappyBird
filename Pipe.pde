abstract class Pipe
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
  
  abstract void render();
  
  abstract void update();
}