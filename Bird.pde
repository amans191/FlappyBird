void bird()
{ 
  int posx = width/2;
  int posy = height/2;

  stroke(0);
  fill(255, 215 , 0);
  ellipse(posx, posy, 60, 50);
  
  fill(255);
  ellipse(posx + 15, posy - 15, 25, 25);
  
  fill(0);
  ellipse(posx + 18, posy - 15, 5, 5);
  
  fill(255, 0 , 100);
  ellipse(posx + 30, posy + 5, 30, 15);
  
  fill(255, 150, 0);
  ellipse(posx - 25, posy, 35, 25);
}