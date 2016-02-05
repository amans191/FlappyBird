class Top_pipe extends Pipe
{
  void render()
  {
    stroke(255);
    fill(0 , 255, 0);
    
    //top pipe
    rect(yi, xi, pipeWidth, yj);
    
  }
  
  void update()
  {
    yi -= 5;
  }
}