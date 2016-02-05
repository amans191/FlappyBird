class Top_pipe extends Pipe
{ 
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
}