int flushTime = 0; 

void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  float gaussian = randomGaussian();
  println(gaussian);
  
  float standardDeviation = 100;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  x = min(width / 2, x);
  x = max(-width / 2, x);
  
  float y = random(-height / 2, height / 2);
  
  gaussian = randomGaussian();
  standardDeviation = 20;
  mean = 40;
  float size = standardDeviation * gaussian + mean;
  
  noStroke();
  
  fill(
    random(0,256), 
    random(0,256),
    random(0,256), 
    random(10,101) 
    ); 
      
  circle(x, y, size);
    
  flushTime++;
  if (flushTime >= 300)
  {
    background(255);
    flushTime = 0;
  }
}
