void bird()
{ 
  int posx = width/2;
  int posy = height/2;

  stroke(0);
  
  //body
  fill(255, 215 , 0);
  ellipse(posx, posy, 60, 50);
  
  //white eye
  fill(255);
  ellipse(posx + 15, posy - 15, 25, 25);
  
  //eye ball
  fill(0);
  ellipse(posx + 18, posy - 15, 5, 5);
  
  //beak
  fill(255, 0 , 100);
  ellipse(posx + 30, posy + 5, 30, 15);
  
  //wing
  fill(255, 150, 0);
  ellipse(posx - 25, posy, 35, 25);
}