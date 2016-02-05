class Bottom_pipe extends Pipe
{
  void render()
  {
    stroke(255);
    fill(0 , 255, 0);
    
    //bottom pipe
    rect(yi, height, pipeWidth, bot);
  }
  
  void update()
  {
    yi -= 5;
  }
}