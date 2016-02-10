import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player1;

ArrayList<Pipe> blah = new ArrayList<Pipe>();

void setup()
{
  size(550, 750);

  minim = new Minim(this);
  player1 = minim.loadFile("explosion.wav");

  high_score = 0;
  load_in_score(); // loads score from txt file

  gamestate = 0;

  minim = new Minim(this);

  reset();

  output = createWriter("data/score.txt"); // creates a file called score.txt in your data folder
}

//***************************************************************************

int endpos; //for endscreen

//for saving highscore
PrintWriter output;
int high_score;
String name;

int score;

String textValue = "";

//for bird
int posx;
int posy;

Pipe pipes;

Bird birds;

End ends;

Highscreen highs;

//different states throughout the game
int gamestate;

//menu rects
int firstoption = 150;

//***************************************************************************

void draw()
{
  background(135, 206, 250);
  fill(255);

  if (gamestate == 0)
  {
    fill(255, 255, 0);
    text("Crappy Bird!", width/4 + 20, 100);  

    //play game option
    fill(255, 0, 0);
    rect(width/4, firstoption, width/2, firstoption/2);
    fill(255);
    textSize(32);
    text("Play Game!", width/4 + 50, firstoption + 50);

    //highscore option
    fill(255, 0, 0);
    rect(width/4, firstoption + (firstoption/3) * 2, width/2, firstoption/2);
    fill(255);
    textSize(32);
    text("Highscore!", width/4 + firstoption/3, (firstoption * 2));
  }//end gamestate 0

  if (gamestate == 1)
  {
    background(135, 206, 250);

    //so pipes appear every 2 seconds
    if ( frameCount % 120 == 0 )
    {
      Pipe newtoppipe = new Top_pipe();

      blah.add(newtoppipe);
    }

    //calling in bird
    birds.birdRender();
    birds.birdUpdate();

    for ( int i = 0; i < blah.size(); ++i)
    {
      blah.get(i).render();
      blah.get(i).update();
    }


    //detecting collison
    for (int i = blah.size() - 1; i >= 0; i--)
    {
      Pipe blahblah = blah.get(i);

      if ( blahblah instanceof Pipe)
      {
        //collision for top pipe
        if ( posx >= blahblah.yi && posy <= blahblah.yj && posx <= blahblah.yi + blahblah.pipeWidth || posy < 0)
        {
          player1.play(); //sound
          gamestate = 2;  //end screen
        }

        //collison for bottom pipe
        if ( posx >= blahblah.yi && posy >= (blahblah.gap + blahblah.yj) && posx <= blahblah.yi + blahblah.pipeWidth || posy > height )
        {
          player1.play(); //sound
          gamestate = 2; //end screen
        }
      }
    }

    points();

    //high_score = score;
  }//end gamestate == 1 

  //end screen
  if (gamestate == 2)
  {
    ends.EndScreen();

    //go back to main menu
    if (keyPressed)
    {
      if (key == 's')
      {
        gamestate = 0;
        reset();
      }
    }
  }

  if ( gamestate == 3)
  {
    background(135, 206, 250);
    highs.highUpdate();
    //text(high_score/15, width/2, height/2); // display text
    //text(name, width/3,height/3);
    
    if (keyPressed)
    {
      if (key == 's')
      {
        gamestate = 0;
        reset();
      }
    }
  }
}

//***************************************************************************

void reset()
{
  posx = width/3;
  posy = height/2;

  for (int i = 0; i < blah.size(); i++)
  {
    blah.remove(i);
  }

  birds = new Bird();

  ends = new End();
  
  highs = new Highscreen();
  
  endpos = height/4;
  
  score = 0;
}

//***************************************************************************

void points()
{

  for (int i = 0; i < blah.size(); i++)
  {
    Pipe pipeScore = blah.get(i);

    //seeing if bird passes pillar and then score increments by 1
    if ( posx > pipeScore.yi && posx < ( pipeScore.yi + pipeScore.pipeWidth ))
    {
      score = score + 1;
    }
    fill(0);
    //divide by 15 because the brd get 15 points everytime it is in the gap
    text(""+score/15, width/2, 600);
  }
  
  high_score = score;
}

//***************************************************************************
//saving score to an external file
void save_score()
{
  //output = createWriter("data/score.txt"); // creates a file called score.txt in your data folder

  output.println(high_score + "," + name); // writes high_score to file

  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
}

//***************************************************************************
//reading in data
void load_in_score()
{
  String[] lines = loadStrings("data/score.txt"); 

  int score1 = 0;

  for (int i = 0; i < lines.length; i++ )
  {
    String[] parts = lines[i].split(",");
    score1 = parseInt(parts[0]);
    name = parts[1];
  }

  saveStrings("data/score.txt", lines);

  if (score1 > 0)
  {
    high_score = score1;
  }
}

//***************************************************************************
//buttons for menu.
void mousePressed()
{
  //button to play game
  if ((mouseX >= width/4) && (mouseX <= (width - width/4)) && (mouseY >= firstoption) && mouseY <= (height - (firstoption + firstoption/2)))
  {
    gamestate = 1;
  }

  //button to view highscore
  if ((mouseX >= width/4) && (mouseX <= (width - width/4)) && (mouseY >= firstoption + (firstoption/3) * 2) && mouseY <= (height - (firstoption + (firstoption/3) * 2)))
  {
    gamestate = 3;
  }
}