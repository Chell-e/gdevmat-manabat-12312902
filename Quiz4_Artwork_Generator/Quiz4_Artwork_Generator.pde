void setup()
{
  size(1020, 720, P3D);
  background(255);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();

void draw()
{
  noStroke();
  
  myWalker.render();
  myWalker.perlinWalk(); 
  myWalker.perlinScale(); 
  myWalker.perlinColor(); 
}
