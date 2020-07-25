class BranchGroup {
  ArrayList<Branch> branches = new ArrayList<Branch>();
  ArrayList<Flower> flowers = new ArrayList<Flower>();
  Flower flower;
  StringList sides = new StringList("right", "left", "bottom");
  String side;
  float startAngle;
  float startLength;
  float branchWidth;
  int recursions;
  color lightest = color(71, 58, 41);
  color darkest = color(12, 9, 4);
  
  BranchGroup() {
    side = getSide();
    float branchSize = branchGroupProgress * (1 + random(0.75));
    branchWidth = 4 + 12 * branchSize;
    startLength = 120 + 360 * branchSize;
    startAngle = -PI/2 + random(PI);
    recursions = getRecursions();
  }
  
  String getSide() {
    int totalSides = sides.size();
    return sides.get(int(random(totalSides)));
  }
  
  int getRecursions() {
    return 2 + int(random(3));
  }
  
  void generate() {
    pushMatrix();
      translate(width/2, height/2);
      if (side == "left") {
        rotate(PI/2);
      } else if (side == "right") {
        rotate(-PI/2);
      } else if (side == "top") {
        rotate(PI);
      }
      translate(-width/2 + random(width), height/2 + 10 + branchGroupProgress * random(300));
      addTrunk();
      addChildBranches();
      addFlowers();
      
      for (Branch branch : branches) {
        branch.display();
      }
      
      for (Flower flower : flowers) {
        flower.display();
      }
    popMatrix();
  }
  
  void addTrunk() {
    rotate(startAngle);
    PVector startPoint = new PVector(0, 0);
    PVector endPoint = new PVector(0, -startLength);
    color branchColour = lerpColor(lightest, darkest, random(1));
    Branch root = new Branch(startPoint, endPoint, branchWidth, branchColour);
    branches.add(root);
  }
  
  void addChildBranches() {
    for(int currentRecursion = 0; currentRecursion <= recursions; currentRecursion++) {
      for(int i = branches.size() -1; i >= 0; i--){
        Branch current = branches.get(i);
        if(!current.finished){
          int diversionCount = 1 + int(random(3));
          for (int j = 0; j <= diversionCount; j++) {
            branches.add(current.branch(random(-PI/6, PI/6)));
          }
        }
        current.finished = true;
      }
    }
  }
  
  void addFlowers() {
    for(int i = 0; i < branches.size(); i++){
      Branch current = branches.get(i);
      if(!current.finished){
        PVector flowerPosition = current.endPoint.copy();
        float flowerSize = branchWidth * (1.6 + random(1.6));
        flower = new Flower(flowerPosition, flowerSize);
        flowers.add(flower);
      }
    }
  }
}
