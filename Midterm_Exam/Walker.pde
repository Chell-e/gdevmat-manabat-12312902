public class Walker
{
   public PVector position = new PVector();
   public float scale = 0;
   public float r = 100, g = 200, b = 300, a = 255;

   public Walker(){}
   
   public void render()
   {
     noStroke();
     fill(r, g, b, a);
     circle(position.x, position.y, scale); 
   }
   
   public void randomPosition()
   {
     float gaussian = randomGaussian();
     float standardDeviationX = 270, standardDeviationY = 270;
     float mean = 0;
     
     position.x = standardDeviationX * gaussian + mean;
     position.x = min(width / 2, position.x);
     position.x = max(-width / 2, position.x);
     
     gaussian = randomGaussian();
     
     position.y = standardDeviationY * gaussian + mean;
     position.y = min(height / 2, position.y);
     position.y = max(-height / 2, position.y);    
   }
   
   public void randomScale()
   {
     float gaussian = randomGaussian();
     float standardDeviation = 15;
     float mean = 0;
     
     scale = standardDeviation * gaussian + mean;
   }
   
   public void randomColor()
   {    
     r = random(256);
     g = random(256);
     b = random(256);
     a = random(50, 246);
   }
   
   public void setColor(float r, float g, float b, float a)
   {
     this.r = r;
     this.g = g;
     this.b = b;
     this.a = a;
   }
   
   public void moveTowardsDirectionOf(PVector target)
   {
     PVector direction = PVector.sub(target, this.position).normalize().mult(10);
     position.add(direction);
   }
}
