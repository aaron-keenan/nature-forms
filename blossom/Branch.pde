class Branch {
  PVector startPoint, endPoint;
  float branchWidth;
  boolean finished = false;
  color branchColour;
  
  Branch(PVector _startPoint, PVector _endPoint, float _branchWidth, color _branchColour) {
    startPoint = _startPoint;
    endPoint = _endPoint;
    branchWidth = _branchWidth;
    branchColour = _branchColour;
  }
  
  void display() {
    strokeWeight(branchWidth);
    stroke(branchColour, 255);
    line(startPoint.x, startPoint.y, endPoint.x, endPoint.y);
  }
  
  Branch branch(float branchAngle) {
    PVector dir = PVector.sub(endPoint, startPoint);
    dir.rotate(branchAngle);
    dir.mult(random(0.6, 0.8));
    PVector newEndPoint = PVector.add(endPoint, dir);
    float newBranchWidth = branchWidth * (0.60 + random(0.15));
    newBranchWidth = constrain(newBranchWidth, 1, branchWidth);
    Branch b = new Branch(endPoint, newEndPoint, newBranchWidth, branchColour);
    return b;
  }
}
