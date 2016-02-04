ArrayList<Pipe> blah = new ArrayList<Pipe>();

void setup()
{
  size(550,750);
  
  posx = width/3;
  posy = height/2;
  pipes = new Pipe();
}

int posx;
int posy;

Pipe pipes;

void draw()
{
  background(0);
  fill(255);
  
  bird();
  
  posy += 5;
  if (mousePressed)
  {
    posy -= 15;
  } 
  
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
    
}