public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public float mass = 0;
  public color randomColor;
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
     PVector f = PVector.div(force, this.mass);
     this.acceleration.add(f); 
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {    
    noStroke();
    fill(randomColor);     
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {    
    if (this.position.x >= Window.right)
    {
        this.position.x = Window.right;
        this.velocity.x *= -1;
    }
    else if (this.position.y <= Window.bottom)
    {
        this.position.y = Window.bottom;
        this.velocity.y *= -1;
    }
  }
}
