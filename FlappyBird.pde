ArrayList<Pipe> blah = new ArrayList<Pipe>();

void setup()
{
  size(550,750);
  
  //rectMode(CENTER);
  
  posx = width/3;
  posy = height/2;
  pipes = new Pipe();
  
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
  
  pipes.render();
  pipes.update();
  
  if( frameCount % 120 == 0 )
  {
    Pipe newpipe = new Pipe();
    blah.add(newpipe);
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
      if( dist(posx,posy,blahblah.yi,blahblah.yj) <= 50 )
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