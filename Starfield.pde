Stars [] bob;
void setup()
{
  size(600, 600);
  background(0);
  bob = new Stars[250];
  for (int i = 0; i < bob.length; i++)
  {
    bob[i] = new NormalParticle();
  }
  bob[0] = new OddballParticle();
  bob[1]  = new JumboParticle();
  noCursor();
}
void draw()
{
  fill(0);
  ellipse(300, 300, 20, 20);
  fill(0, 0, 0, 75);
  rect(0, 0, 600, 600);
  for (int i = 0; i < bob.length; i++)
  {
    bob[i].show();
    bob[i].move();
  }
}

class NormalParticle implements Stars
{
  double myX, myY, mySpeed, myDir, size;

  NormalParticle()
  {
    myDir = (Math.random() * (3*Math.PI));
    mySpeed = (Math.random() * 4.5) + 3;
    myX = 300;
    myY = 300;
    size = 0.5;
  }
  public void move()
  {
    myX += Math.cos(myDir)*mySpeed;
    myY += Math.sin(myDir)*mySpeed;
    if (myX > 600 || myX < 0)
    {
      myX = 300;
      myY = 300;
      size = 0.5;
    }
    if (myY > 600 || myY < 0)
    {
      myY = (Math.random() * 22) + 292;
      myX = (Math.random() * 22) + 292;
      size = 0.5;
    }
    size += .1;
  }
  public void show()
  {
    noStroke();
    fill(222);
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
}

interface Stars
{
  public void move();
  public void show();
}


public class OddballParticle implements Stars
{
  double myX = 300;
  double myY = 300;
  public void show()
  {
    fill(150);
    stroke((int)Math.random()*255, (int)Math.random()*255, 75);
    ellipse((float)myX - 15, (float)myY, 5, 3);
    ellipse((float)myX + 15, (float)myY, 5, 3);
    ellipse((float)myX - 8, (float)myY + 5, 5, 3);
    ellipse((float)myX + 8, (float)myY + 5, 5, 3);
  }
  public void move()
  {
    myX = mouseX;
    myY = mouseY;
  }
}

public class JumboParticle extends NormalParticle
{
  public void show()
  {
    strokeWeight(2);
    stroke(0, 0, 123);
    fill(185, 0, 125);
    ellipse((float)myX, (float)myY, (float)size, (float)size);
  }
  public void move()
  {
    myX += Math.cos(myDir)*mySpeed;
    myY += Math.sin(myDir)*mySpeed;
    if (myX > 600 || myX < 0)
    {
      myX = 250;
      myY = 250;
      size = 13;
      myDir = (Math.random() * (3*Math.PI));
    }
    if (myY > 600 || myY < 0)
    {
      myY = (Math.random() * 19) + 292;
      myX = (Math.random() * 19) + 292;
      size = 13;
      myDir = (Math.random() * (3*Math.PI));
    }
    size += .7;
  }
}
