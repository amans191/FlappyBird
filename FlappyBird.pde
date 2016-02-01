void setup()
{
  size(550,750);
}

int posx = 275;
int posy = 375;

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
}