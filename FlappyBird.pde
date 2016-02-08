import controlP5.*;

ControlP5 gui;

ArrayList<Pipe> blah = new ArrayList<Pipe>();

void setup()
{
  size(550,750);
  
  //rectMode(CENTER);
  
  posx = width/3;
  posy = height/2;
  
  birds = new Bird();
  
  PFont font = createFont("arial", 48);
  
  gui = new ControlP5(this);
  
  //gui.addTextfield("Name")
  // .setPosition(width/4,height/3)
  // .setSize(250,100)
  // .setFont(font)
  // .setFocus(true)
  // .setColor(color(255,0,0))
  // ;
    
  //gui.addButton("Play Game!")
  //.setPosition(width/2,height/2)
  //.setSize(100,100)
  ////set the way it is activated : RELEASE the mouseboutton or PRESS it
  //.activateBy(ControlP5.RELEASE);
  //;
    
   gamestate = 0;
}

  int score = 0;
  
String textValue = "";

int posx;
int posy;

Pipe pipes;

Bird birds;

int gamestate;

void draw()
{
  background(135, 206, 250);
  fill(255);
  
  textSize(48);
  //text(gui.get(Textfield.class,"Name").getText(), 360,130);
  //text(textValue, 360,180);
  
  if(mousePressed)
    gamestate = 1;
  
  if (gamestate == 1)
  {
    if( frameCount % 120 == 0 )
    {
      Pipe newtoppipe = new Top_pipe();

      blah.add(newtoppipe);
    }
  
    birds.birdRender();
    birds.birdUpdate();
  
    for( int i = 0; i < blah.size(); ++i)
    {
      blah.get(i).render();
      blah.get(i).update();
    }
  
    for(int i = blah.size() - 1 ; i >= 0 ; i--)
    {
      Pipe blahblah = blah.get(i);
      
      if( blahblah instanceof Pipe)
      {
        if( posx >= blahblah.yi && posy <= blahblah.yj && posx <= blahblah.yi + blahblah.pipeWidth || posy < 0)
        {
            //blah.remove(blahblah);
            EndScreen();
            stop();
            println("blah");
        }
        //else
        //{
        //  score = score + 1;
        //}
      
        if( posx >= blahblah.yi && posy >= (blahblah.gap + blahblah.yj) && posx <= blahblah.yi + blahblah.pipeWidth || posy > height )
        {
           //blah.remove(blahblah);
           stop();
           println("blah");
           score++;
        }
      }
    }
  
  
    points();
    
    /*if(posy < height || posy > height)
    {
      text("End Game", 100, 100);
    }*/
  }//end gamestate == 1 if    
}

void points()
{

  
  for(int i = 0 ; i < blah.size() ; i++)
  {
    Pipe pipeScore = blah.get(i);
    if( posy >= pipeScore.yj && posy <= (pipeScore.gap +pipeScore.yj) && posx != pipeScore.yi)
    {
      score++;
    }
    stroke(0);
    text(""+score, width/2, 600);
  }
}