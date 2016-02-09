void EndScreen()
{
  stroke(255);
  fill(225, 178, 86);
  
  rect(width/4, endpos, width/2, height/2);
  
  for (int i = 0; i < height/4; i++)
  {
    endpos -= 5;
  }
  
  if (endpos == height/4)
  {
    stop();
  }
}