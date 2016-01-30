void setup()
{
  size(550,750);
}

int posx = width/2;
int posy = height/2;

void draw()
{
  background(0);
  fill(255);
  
  bird();
  
  posy += 5;
  if (mousePressed)
  {
    posy-=20;
  } 
}