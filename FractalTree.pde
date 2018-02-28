private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .3;
private int r, g, b, step;

public void setup() 
{   
	size(800,800);
	strokeWeight(2);
  r = 5;
  g = 221;
  b = 227;
  step = -5;
} 

public void draw() 
{ 
  r = r + step;
  g = g + step;
  b = b + step;
  if(g < -10 || r > 255)
  {
    step = step * -1;
  }
	background(r, g, b);   
	stroke(0,255,0);   
	line(400,800,400,700);   
	drawBranches(400, 700, 140, 3 * Math.PI / 2); 
} 

public void drawBranches(float x, float y, double branchLength, double angle) 
{   
	double angle1, angle2;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	float endX1, endX2, endY1, endY2;
	endX1 = (float)(branchLength * Math.cos(angle1) + x);
  endY1 = (float)(branchLength * Math.sin(angle1) + y);
  endX2 = (float)(branchLength * Math.cos(angle2) + x);
  endY2 = (float)(branchLength * Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  if(branchLength > smallestBranch)
  {
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 