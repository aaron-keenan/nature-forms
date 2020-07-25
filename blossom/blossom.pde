BranchGroup[] branchGroups;
int totalBranchGroups;
float branchGroupProgress;
Sky sky;
CurrentDate currentDate = new CurrentDate();

void setup() {
  size(1080, 1080);
  sky = new Sky();
  sky.display();
  ellipseMode(RADIUS);
  totalBranchGroups = getTotalBranchGroups();
  setupBranchGroups();
  save("output/blossom-"+currentDate.toString()+".jpg");
}

void draw() {
}

int getTotalBranchGroups() {
  return 15;
}

void setupBranchGroups() {
  branchGroups = new BranchGroup[totalBranchGroups];
  for (int i = 0; i < totalBranchGroups; i++) {
    branchGroupProgress = map(i, 0, totalBranchGroups, 0, 1);
    BranchGroup group = new BranchGroup();
    group.generate();
  }
}
