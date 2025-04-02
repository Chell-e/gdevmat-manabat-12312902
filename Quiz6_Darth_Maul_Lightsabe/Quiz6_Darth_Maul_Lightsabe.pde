void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector(x, y);
}

void drawLightsaber(PVector direction)
{
  strokeWeight(9);
  stroke(255, 0, 0);
  
  PVector lightsaberMag = direction.normalize().mult(380);
  println(lightsaberMag.mag());

  line(0, 0, direction.x, direction.y);  
  strokeWeight(3);
  stroke(255, 255, 255);
  
  line(0, 0, direction.x, direction.y);  
  strokeWeight(6);
  stroke(0, 0, 0);
  
  direction.normalize().mult(100);
  line(0, 0, direction.x, direction.y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  
  drawLightsaber(mouse);
  drawLightsaber(mouse.mult(-1));
}
