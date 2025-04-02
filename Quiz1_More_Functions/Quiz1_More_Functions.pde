int time = 0;
int amplitude = 30;
float frequency = 0.05;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  
  drawCartesianPlane();

  graphFunction1();
  graphFunction2();
  graphFunction3(amplitude, frequency);

  time++;
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
      line(i, -2, i, 2);
      line(-2, i, 2, i);
  } 
}

void drawLinearFunction()
{
    color red = color(255, 0, 0);
    fill(red);
    noStroke();
    
    for (int x = -200; x <= 200; x++)
    {
       circle(x, x + 2, 5); 
    }
}

void drawQuadraticFuntion()
{
    color green = color(0, 255, 0);
    fill(green);
    stroke(green);    
    
    for (float x = -300; x <= 300; x += 0.1f)
    {
       circle(x * 10, ((float)Math.pow(x,2) + (x * 2) - 5), 5);
    }
}

void drawCircle()
{
    color blue = color(0, 0, 255);
    fill(blue);
    stroke(blue);  
    float radius = 50;
    
    for (int x = 0; x <= 360; x++)
    {
       circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5); 
    }
}


void graphFunction1()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) - 15 * x - 3, 5);
  }
  
}

void graphFunction2() 
{ 
  color purple = color(255, 0, 255);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, -5 * x + 30, 5);
  }
}

void graphFunction3(float amplitude, float frequency)
{
  color pink = color(255, 153, 204);
  fill(pink);
  stroke(pink);
  
  for (float x = -300; x <= 300; x += 0.1)
  {
    circle(x, (float)Math.sin((x + time) * frequency) * amplitude, 5);
  }

}

void keyPressed()
{
  if (keyCode == UP)
  {
    amplitude += 10;
  }
  if (keyCode == DOWN)
  {
    amplitude -= 10;
  }
  if (keyCode == LEFT)
  {
    frequency += 0.05;
  }
  if (keyCode == RIGHT)
  {
    frequency -= 0.05;
  }
}
