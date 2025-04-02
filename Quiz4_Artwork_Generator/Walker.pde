public class Walker
{
  public float x;
  public float y;
  public float scale;
  
  public float tx = 0, ty = 10000;  
  public float tScale = 5150;  
  
  public float tR = 100;
  public float tG = 200;
  public float tB = 300;
  
  void render()
  {
    circle(x, y, scale);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -width / 2, width / 2);
    y = map(noise(ty), 0, 1, -height / 2, height / 2);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  void perlinScale() 
  {
    scale = map(noise(tScale), 0, 1, 5, 150);    
    tScale += 0.01f;
  }
  
  void perlinColor() 
  {
    fill(
      map(noise(tR), 0, 1, 0, 255),
      map(noise(tG), 0, 1, 0, 255),
      map(noise(tB), 0, 1, 0, 255), 255
    );
    
    tR += 0.01f;
    tG += 0.01f;
    tB += 0.01f;
  }
}
