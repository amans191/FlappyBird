class End
{
  void EndScreen()
  {
    stroke(255);
    fill(225, 178, 86);
    
    rect(width/4, endpos, width/2, height/2);
    
    fill(255, 0, 0);
    stroke(255);
    rect(width/4 + 10, height - (height/3), width/2 - 20, 50);
    
    fill(255);
    textSize(32);
    text("Main Menu!", width/4 + 45, (height - (height/3) + 40));
    
    posx = width/2;
    posy = height/2;
    
    birds.birdRender();
  }
  
  void mousePressed()
  {
   if( (mouseX > width/4 + 10) && (mouseX < width - (width/4 + 10)) && (mouseY > (height - (height/3))) && mouseY > (height - (height/3)) + 50);
   {
     gamestate = 0;
   }
  }
}