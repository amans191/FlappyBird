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
    posy -= 20;
  } 
  
  pipes.render();
}