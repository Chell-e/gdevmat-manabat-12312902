Walker blackHole = new Walker();
Walker[] otherMatter = new Walker[200];

int numOfFrames = 0;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  blackHole.randomPosition();
  blackHole.scale = 50;
  blackHole.setColor(255, 255, 255, 255);
    
  for (int i = 0; i < 200; i++)
  {
    otherMatter[i] = new Walker();
    otherMatter[i].randomPosition();
    otherMatter[i].randomScale();
    otherMatter[i].randomColor();
  }
}

PVector mouse()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector(x, y);
}

void draw()
{
  background(0);
  
  if (numOfFrames >= 100)
  {
    blackHole.randomPosition();
    
    for (int i = 0; i < otherMatter.length; i++)
    {
       otherMatter[i].randomPosition();
       otherMatter[i].randomScale();
       otherMatter[i].randomColor();       
    }
    numOfFrames = 0;
  }
 
  blackHole.moveTowardsDirectionOf(mouse());
  
  for (int i = 0; i < otherMatter.length; i++)
  {
    otherMatter[i].moveTowardsDirectionOf(blackHole.position);
    otherMatter[i].render();
    blackHole.render();
  }
  numOfFrames++;
}
