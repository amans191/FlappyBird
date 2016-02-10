class End
{
  void EndScreen()
  {
    stroke(255);
    fill(225, 178, 86);

    rect(width/4, endpos, width/2, height/2);
    
    fill(0);
    textSize(32);
    text("You Scored: " + score/15, width/4 + 30, endpos + 50);

    fill(255, 0, 0);
    stroke(255);
    rect(width/4 + 10, height - (height/3), width/2 - 20, 50);

    fill(255);
    //textSize(32);
    text("Main Menu: S", width/4 + 40, (height - (height/3) + 40));

    posx = width/2;
    posy = height/2;

    birds.birdRender();
  }
}