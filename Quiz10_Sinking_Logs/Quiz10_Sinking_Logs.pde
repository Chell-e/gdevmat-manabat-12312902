Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walkers = new Walker[10];

void setup()
{
   size(1280, 720, P3D);
   camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
   
   int posX = 0;
   
   for (int i = 0; i < 10; i++)
   {   
       walkers[i] = new Walker();
       walkers[i].mass = 10 - i;
       walkers[i].scale = walkers[i].mass * 11;
       walkers[i].randomColor = color (random(256), random(256), random(256), 255);
       posX = 2 * (Window.w / 10) * (i - (10 / 2));
       walkers[i].position = new PVector(posX, 300);
   }
}

void draw()
{
    background(255);
    ocean.render();
    
    float c = 0.1f;
    float normal = 1;
    float magnitude = c * normal;
    
    for (Walker walker : walkers)
    {
        walker.render();
        walker.update();
        
        PVector gravity = new PVector(0, -0.15 * walker.mass);
        walker.applyForce(gravity);
        
        PVector friction = walker.velocity.copy();
        friction = friction.mult(-1).normalize().mult(magnitude);
        walker.applyForce(friction);
        
        if (ocean.isCollidingWith(walker))
        {
            PVector dragForce = ocean.calculateDragForce(walker);
            walker.applyForce(dragForce);
        }
        else
        {
            PVector wind = new PVector(0.1, 0);
            walker.applyForce(wind);
        }
        
        walker.checkEdges();
    }
}
