ArrayList<Pipe> blah = new ArrayList<Pipe>();

void setup()
{
  size(550,750);
  
  //rectMode(CENTER);
  
  posx = width/3;
  posy = height/2;
  
  birds = new Bird();
}

int posx;
int posy;

Pipe pipes;


Bird birds;

void draw()
{
  background(135, 206, 250);
  fill(255);
  
  birds.birdRender();
  birds.birdUpdate();
  
  if( frameCount % 120 == 0 )
  {
    Pipe newtoppipe = new Top_pipe();

    blah.add(newtoppipe);

  }
  
  for( int i = 0; i < blah.size(); ++i)
  {
    blah.get(i).render();
    blah.get(i).update();
  }
  
  for(int i = blah.size() - 1 ; i >= 0 ; i--)
  {
    Pipe blahblah = blah.get(i);
    
    if( blahblah instanceof Pipe)
    {
      if( posx >= blahblah.yi && posy <= blahblah.yj && posx <= blahblah.yi + blahblah.pipeWidth || posy < 0)
      {
          blah.remove(blahblah);
      }
      
      if( posx >= blahblah.yi && posy >= height - blahblah.yj + blahblah.gap && posx <= blahblah.yi + blahblah.pipeWidth || posy >= height )
      {
         blah.remove(blahblah);
      }
      
      /*if( posy <= blah.get(i).yj  || posy >= (blah.get(i).bot) )
      {
        stop();
      }*/
    }
  }
  
  /*if(posy < height || posy > height)
  {
    text("End Game", 100, 100);
  }*/
  
  int score = 0;
  
  for(int i = 0 ; i < blah.size() ; i++)
  {
    if( blah.get(i).yi == posx )
    {
      score++;
    }
    stroke(0);
    text(""+score, width/2, 600);
  }
    
}