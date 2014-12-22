int sketch_width = 1650;
int sketch_height = 1100;
int cell_width = 11;
int cell_height = 11;
ArrayList<Plant> plants;
int x_yield_index, y_yield_index;


void setup() {
  size (sketch_width,sketch_height);
  background(0);
  plants = new ArrayList<Plant>();
  //(float temp_delta, int temp_nThresh, int temp_sThresh, int temp_noiseCoeff, float temp_cubeCoeff, float temp_sqCoeff, float temp_zSpeed, float temp_nFalloffCoeff, float temp_sFalloffCoeff)
  plants.add(new Plant(.03, 10, 35, 100, .03, 0, .005, .2, .08));
  plants.add(new Plant(.03, 45, 55, 120, .03, 0, .005, .05, .05));
  plants.add(new Plant(.03, 65, 90, 100, .03, 0, .005, .08, .2));
  Plant PlantA = plants.get(0);
  Plant PlantB = plants.get(1);
  Plant PlantC = plants.get(2);
  PlantA.initialize();
  PlantB.initialize();
  PlantC.initialize();
}

void draw () {
  println(frameRate);
  noStroke();
  Plant PlantA = plants.get(0);
  Plant PlantB = plants.get(1);
  Plant PlantC = plants.get(2);
  PlantA.update();
  PlantB.update();
  PlantC.update();
  x_yield_index = -1;
  for(int x = 0; x < width; x += 11) {
    x_yield_index += 1;
    y_yield_index = -1;
    for(int y = 0; y < height; y += 11) {
      y_yield_index += 1;                                  
      fill(PlantA.yieldArray[x_yield_index][y_yield_index], PlantB.yieldArray[x_yield_index][y_yield_index], PlantC.yieldArray[x_yield_index][y_yield_index]);
      rect(x, y, 11, 11);
    }
  } 
}
