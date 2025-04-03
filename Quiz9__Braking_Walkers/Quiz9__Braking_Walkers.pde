Walker[] walkers = new Walker[8];

void setup()
{
   size(1280, 720, P3D);
   camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
   
   int posY = 0;
   
   for (int i = 0; i < 8; i++)
   {   
       walkers[i] = new Walker();
       walkers[i].mass = 10 - i;
       walkers[i].scale = walkers[i].mass * 10;
       walkers[i].randomColor = color (random(256), random(256), random(256), 255);
       posY = 2 * (Window.h / 8) * (i - (8 / 2));
       walkers[i].position = new PVector(-500, posY);
   }
}

void mouseClicked()
{
    for(Walker walker : walkers)
    {
       walker.position.x = -500;
       walker.velocity = new PVector(0, 0);
    }
}

void draw()
{
    background(255);
    
    strokeWeight(5);
    stroke(0, 0, 0, 255);
    line(0, Window.top, 0, Window.bottom);
    
    for (Walker walker : walkers)
    {
        PVector accelerate = new PVector(0.2, 0);  

        float mew = 0.01f;
        
        if (walker.position.x >= 0)
        {
            mew = 0.4f;
        }
        
        float normal = 1;
        float magnitude = mew * normal;
    
        PVector friction = walker.velocity.copy();
        friction.mult(-1).normalize().mult(magnitude);
        
        walker.applyForce(friction);        
        walker.update();
        walker.render();
        walker.applyForce(accelerate);      
        walker.checkEdges();
    }
}
