class Pipe
{
  int xi;
  int pipeWidth;
  int gap;
  int yj;
  
  void render()
  {
    xi = width;
    pipeWidth = 50;
    gap = 100;
    yj = (int)random(500);
    
    stroke(255);
    fill(0 , 255, 0);
    rect(xi, xi + gap, gap, yj);
  }
}