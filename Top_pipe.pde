class Top_pipe extends Pipe
{
  void render()
  {
    stroke(255);
    fill(0 , 255, 0);
    
    //top pipe
    rect(yi, xi, pipeWidth, yj);
    Pipe newbotpipe = new Bottom_pipe();
    blah.add(newbotpipe);
    
    newbotpipe.yj = yj;
  }
  
  void update()
  {
    yi -= 5;
  }
}