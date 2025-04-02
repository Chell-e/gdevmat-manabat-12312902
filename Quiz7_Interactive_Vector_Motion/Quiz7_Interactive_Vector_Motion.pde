Walker[] walkers = new Walker[100];

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    fill(128);
  
    for (int i = 0; i < 100; i++)
    {
        walkers[i] = new Walker();
        walkers[i].randomPosition();
        walkers[i].randomScale();
    }
}

PVector mouse()
{
    float x = mouseX - Window.windowWidth / 2;
    float y = -(mouseY - Window.windowHeight / 2);
    return new PVector(x, y);
}

PVector accelerateTowardsDirectionOf(PVector target)
{
    return PVector.sub(mouse(), target).normalize().mult(0.2);
}  

void draw()
{
    background(80);
  
    for (int i = 0; i < walkers.length; i++)
    {
       walkers[i].acceleration = accelerateTowardsDirectionOf(walkers[i].position); 
       walkers[i].update();
       walkers[i].render();
    }
}
