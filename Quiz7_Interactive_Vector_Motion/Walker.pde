public class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
   
   public float velocityLimit = 10;
   public float scale = 15;
  
   public Walker()
   {
     
   }
   
   public void update()
   {
       this.velocity.add(acceleration);
       this.velocity.limit(velocityLimit);
       this.position.add(velocity);
   }
   
   public void render()
   {
       circle(position.x, position.y, scale); 
   }
  
   public void randomPosition()
   {
       this.position.x = random(-640, 641);
       this.position.y = random(-360, 361);
   }
   
   public void randomScale()
   {
       this.scale = random(5, 41);
   }
}
