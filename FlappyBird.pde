void setup()
{
  size(550,750);
}

void draw()
{
  bird();
  int y = 0;
  
  ellipse(width/2, y, 10, 10);
  for(int i = 0; i < height -1; i++)
  {
    y-=6;
    
    if (mousePressed)
    {
      y+=20;
      why no work
    } 
  }
}