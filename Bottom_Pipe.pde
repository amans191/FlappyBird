class Bottom_pipe extends Pipe
{
  //int botyj;
  void render()
  {
    /*for(int i = 0 ; i < blah.size(); i++)
    {
      botyj = (Top_pipe)blah.get(i).yj;
    }*/
    stroke(255);
    fill(0 , 255, 0);
    
    //bottom pipe
    rect(yi, height, pipeWidth, - (height - (yj + gap)));
  }
  
  void update()
  {
    yi -= 5;
  }
}