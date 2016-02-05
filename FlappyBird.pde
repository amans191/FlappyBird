ArrayList<Pipe> blah = new ArrayList<Pipe>();

void setup()
{
  size(550,750);
  
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
  
  //bird();
  
  /*posy += 5;
  if (mousePressed)
  {
    posy -= 20;
  } */
  
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
  
  if(posy < height || posy > height)
  {
    text("End Game", 100, 100);
  }
    
}