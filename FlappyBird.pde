void setup()
{
  size(550,750);
  y =width/2;
  
}
int y;


void draw()
{
  background(0);
  fill(255);
  
  ellipse(width/2, y, 10, 10);
  y++;
  if (mousePressed)
    {
      y-=20;
    } 
    
 
  /*for(int i = 0; i < height; i++)
  {
    y-=100;
    
    if (mousePressed)
    {
      y+=20;
    } 
  }*/
}