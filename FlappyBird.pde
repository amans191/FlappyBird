void setup()
{
  size(550,750);
  
  posx = width/3;
  posy = height/2;
  xy = height;
}

int posx;
int posy;
int xy;

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
  
  Pipe();
  xy -= 10;
  
}