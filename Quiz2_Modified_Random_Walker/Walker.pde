class Walker
{
  float x;
  float y;
  
  void render()
  {
    circle(x, y, 30);
  }
  
  void randomWalk() 
  {
    int rng = int(random(8)); 
    
    if (rng == 0) 
    {
      y += 10;
    }
    else if (rng == 1) 
    {
      y -= 10;
    }
    else if (rng == 2) 
    {
      x -= 10;
    }
    else if (rng == 3)  
    {
      x += 10;
    }
    else if (rng == 4) 
    {
      y += 10;
      x -= 10;
    }
    else if (rng == 5)
    {
      y += 10;
      x += 10;
    }
    else if (rng == 6) 
    {
      y -= 10;
      x -= 10;
    }
    else if (rng == 7) 
    {
      y -= 10;
      x += 10;
    }
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(1, 101));
            
    if (rng <= 20) 
    {
        y += 10;
    }
    else if (rng <= 30) 
    {
        y -= 10;
    }
    else if (rng <= 10) 
    {
        x -= 10;
    }
    else if (rng <= 40) 
    {
        x += 10;
    }
  }
  
    void randomColors() 
  {
    fill(
      int(random(0, 256)), 
      int(random(0, 256)), 
      int(random(0, 256)), 
      int(random(50, 101)) 
      );      
  }
}
