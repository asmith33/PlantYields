class Plant
{
  float delta;
  float xnoise;
  float ynoise;
  float znoise;
  float xstart;
  float ystart;
  int yield;
  int nThresh;
  int sThresh;
  float cubeCoeff;
  float sqCoeff;
  float zSpeed;
  int noiseCoeff;
  float sFalloffCoeff;
  float nFalloffCoeff;
  int yieldArray[][] = new int[sketch_width/cell_width][sketch_height/cell_height];
  
  Plant(float temp_delta, int temp_nThresh, int temp_sThresh, int temp_noiseCoeff, float temp_cubeCoeff, float temp_sqCoeff, float temp_zSpeed, float temp_nFalloffCoeff, float temp_sFalloffCoeff) {
    delta = temp_delta;
    xnoise = 0;
    ynoise = 0;
    znoise = 0;
    xstart = 0;
    ystart = 0;
    yield = 0;
    nThresh = temp_nThresh;
    sThresh = temp_sThresh;
    cubeCoeff = temp_cubeCoeff;
    sqCoeff = temp_sqCoeff;
    zSpeed = temp_zSpeed;
    noiseCoeff = temp_noiseCoeff;
    nFalloffCoeff = temp_nFalloffCoeff;
    sFalloffCoeff = temp_sFalloffCoeff;
  }
  
  void initialize () {
    xnoise = random(17);
    xstart = xnoise;
    ynoise = random(17);
    znoise = random(17);
    for(int x=0; x < sketch_width/cell_width; x+=1) {
      ynoise += delta;
      xnoise = xstart;
      for(int y=0; y < sketch_height/cell_height; y+=1) {
        xnoise += delta;
        if (y < nThresh) {
          yield = int(noiseCoeff*noise(xnoise,ynoise,znoise)-nFalloffCoeff*(y-nThresh)*(y-nThresh));
        } else if (y > sThresh) {
          yield = int(noiseCoeff*noise(xnoise,ynoise,znoise)-sFalloffCoeff*(y-sThresh)*(y-sThresh));
        } else {
          yield = int(noiseCoeff*noise(xnoise,ynoise,znoise));
        }
        if (yield < 0) {
          yield = 0;
        }
        yield = int(cubeCoeff*yield*yield*yield);
        if (int(map(yield, 0, 8500, 0, 255)) > 255) {
          yieldArray[x][y] = 255;
        } else {
          yieldArray[x][y] = int(map(yield, 0, 8500, 0, 255));
        }
      }
    }
  }
  
  void update () {
    znoise += zSpeed;
    xnoise = xstart;
    ynoise = ystart;
    for(int x=0; x < sketch_width/cell_width; x+=1) {
      ynoise += delta;
      xnoise = xstart;
      for(int y=0; y < sketch_height/cell_height; y+=1) {
        xnoise += delta;
        if (y < nThresh) {
          yield = int(noiseCoeff*noise(xnoise,ynoise,znoise)-nFalloffCoeff*(y-nThresh)*(y-nThresh));
        } else if (y > sThresh) {
          yield = int(noiseCoeff*noise(xnoise,ynoise,znoise)-sFalloffCoeff*(y-sThresh)*(y-sThresh));
        } else {
          yield = int(noiseCoeff*noise(xnoise,ynoise,znoise));
        }
        if (yield < 0) {
          yield = 0;
        }
        yield = int(cubeCoeff*yield*yield*yield);
        if (int(map(yield, 0, 8500, 0, 255)) > 255) {
          yieldArray[x][y] = 255;
        } else {
          yieldArray[x][y] = int(map(yield, 0, 8500, 0, 255));
        }
      }
    }
  }
  
}

  
