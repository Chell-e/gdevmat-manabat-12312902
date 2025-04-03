Walker[] matters = new Walker[10];

void setup()
{
   size(1280, 720, P3D);
   camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
   for (int i = 0; i < 10; i++)
   {   
       matters[i] = new Walker();
       matters[i].mass = random(3, 15);
       matters[i].scale = matters[i].mass * 11;
       matters[i].randomColor = color (random(256), random(256), random(256), 5);
       matters[i].position.x = 640 * randomGaussian();
       matters[i].position.y = 360 * randomGaussian();
   }
}

void draw()
{
    background(255);
    
    for (Walker i : matters)
    {
        for (Walker j : matters)
        {
            i.update();
            i.render();
            
            if (i != j)
            {
                 i.applyForce(j.calculateAttraction(i));
            }
        }
    }
}
