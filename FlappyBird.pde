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

  //posx = width/3;
  //posy = height/2;

  //birds = new Bird();

  //ends = new End();

  minim = new Minim(this);
  player1 = minim.loadFile("explosion.wav");

  high_score = 0;
  load_in_score(); // loads score from txt file

  gamestate = 0;

  minim = new Minim(this);

  reset();
  //endpos = height/4;
}

//***************************************************************************

int endpos;

PrintWriter output;
int high_score;
String name;

int score = 0;

String textValue = "";

int posx;
int posy;

Pipe pipes;

Bird birds;

End ends;

int gamestate;

int firstoption = 150;

//***************************************************************************

void draw()
{
  background(135, 206, 250);
  fill(255);

  textSize(48);
  //text(gui.get(Textfield.class,"Name").getText(), 360,130);
  //text(textValue, 360,180);

  if (gamestate == 0)
  {

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
  }

  if (gamestate == 1)
  {
    background(135, 206, 250);

    if ( frameCount % 120 == 0 )
    {
      Pipe newtoppipe = new Top_pipe();

      blah.add(newtoppipe);
    }

    birds.birdRender();
    birds.birdUpdate();

    for ( int i = 0; i < blah.size(); ++i)
    {
      blah.get(i).render();
      blah.get(i).update();
    }

    for (int i = blah.size() - 1; i >= 0; i--)
    {
      Pipe blahblah = blah.get(i);

      if ( blahblah instanceof Pipe)
      {
        if ( posx >= blahblah.yi && posy <= blahblah.yj && posx <= blahblah.yi + blahblah.pipeWidth || posy < 0)
        {
          player1.play();
          gamestate = 2;
        }

        if ( posx >= blahblah.yi && posy >= (blahblah.gap + blahblah.yj) && posx <= blahblah.yi + blahblah.pipeWidth || posy > height )
        {
          player1.play();
          gamestate = 2;
        }
      }
    }

    points();

    high_score = score;
  }//end gamestate == 1 

  if (gamestate == 2)
  {
    ends.EndScreen();
    reset();

    if (keyPressed)
    {
      if (key == 's')
      {
        gamestate = 0;
      }
    }
  }

  //if ( gamestate == 3)
  //{
  //  background(100, 100, 100);
  //  text(high_score/15, width/2, height/2); // display text
  //  //text(name, width/3,height/3);
  //}
}

void reset()
{
  posx = width/3;
  posy = height/2;

  birds = new Bird();

  ends = new End();

  endpos = height/4;
}

//***************************************************************************

void points()
{

  for (int i = 0; i < blah.size(); i++)
  {
    Pipe pipeScore = blah.get(i);

    if ( posx > pipeScore.yi && posx < ( pipeScore.yi + pipeScore.pipeWidth ))
    {
      score = score + 1;
    }
    fill(0);
    //divide by 15 because the brd get 15 points everytime it is in the gap
    text(""+score/15, width/2, 600);
  }
}

//***************************************************************************


//***************************************************************************

void save_score()
{
  output = createWriter("data/score.txt"); // creates a file called score.txt in your data folder

  output.println(high_score + "," + name); // writes high_score to file

  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
}

//***************************************************************************

void load_in_score()
{
  String[] lines = loadStrings("data/score.txt"); 

  int score = 0;

  for (int i = 0; i < lines.length; i++ )
  {
    String[] parts = lines[i].split(",");
    score = parseInt(parts[0]);
    name = parts[1];
  }

  saveStrings("data/score.txt", lines);

  if (score > 0)
  {
    high_score = score;
  }
}

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