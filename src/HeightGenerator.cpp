#include "HeightGenerator.h"
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <math.h>

using namespace std;

const float amplitude = 0.75f;
const float interpConst = 10.f;
// int octaves = # of generated terrains (now = 2) increases ridgedness
// float roughness = # of decrements per octave (now = 2)

HeightGenerator::HeightGenerator(int w, int d) {
  width = w;
  depth = d;
}

std::vector<float> HeightGenerator::generateHeight() {
  std::vector<float> terrain = generate(amplitude, interpConst);
  std::vector<float> detail = generate(amplitude/4, interpConst/4);
  std::vector<float> detail2 = generate(amplitude/16, interpConst/16);
  return sumHeights(terrain, detail, detail2);
}

std::vector<float> HeightGenerator::generate(float amp, float interpC) {
  std::vector<float> noise = getNoise(amp);
  std::vector<float> interp = linearInterp(noise);
  return getSmoothInterp(interp, interpC);
}

std::vector<float> HeightGenerator::sumHeights(std::vector<float> h, std::vector<float> d, std::vector<float> d2) {
  std::vector<float> height(width*depth, 0.f);
  for (int i = 0; i < width*depth; i++) {
    height[i] = h[i] + d[i] + d2[i];
  }
  return height;
}

std::vector<float> HeightGenerator::getSmoothInterp(std::vector<float> interp, float interpC) {
  std::vector<float> smoothInterp(width*depth, 0.f);
  for (int i = 0; i < depth; i++) {
    for (int j = 0; j < width; j++) {
      float z = float(i)/interpC;
      float x = float(j)/interpC;
      int iZ = int(z);
      int iX = int(x);
      float fracZ = z - iZ;
      float fracX = x - iX;
      int ind = iZ*width + iX;
      float v1 = interp[ind];
      float v2 = interp[ind+1];
      float v3 = interp[ind+width];
      float v4 = interp[ind+width+1];
      float i1 = interpolate(v1, v2, fracX);
      float i2 = interpolate(v3, v4, fracX);
      smoothInterp[i*width + j] = interpolate(i1, i2, fracZ);
    }
  }
  return smoothInterp;
}

float HeightGenerator::interpolate(float a, float b, float blend) {
  double theta = blend*M_PI;
  float f = float(1.f - cos(theta))*0.5;
  return a*(1.f - f) + b*f;
}

std::vector<float> HeightGenerator::linearInterp(std::vector<float> noise) {
  std::vector<float> heightBuf(width*depth, 0.f);
  for (int i = 0; i < depth; i++) {
    for (int j = 0; j < width; j++) {
      int ind = i*width+j;
      heightBuf[ind] += noise[ind]/4;
      if (j > 0) {
        heightBuf[ind] += noise[ind-1]/8.f;
      }
      if (j < width-1) {
        heightBuf[ind] += noise[ind+1]/8.f;
      }
      if (i > 0) {
        heightBuf[ind] += noise[ind-width]/8.f;
      }
      if (i < depth-1) {
        heightBuf[ind] += noise[ind+width]/8.f;
      }
      if (j > 0 && i > 0) {
        heightBuf[ind] += noise[ind-width-1]/16.f;
      }
      if (j > 0 && i < depth-1) {
        heightBuf[ind] += noise[ind+width-1]/16.f;
      }
      if (j < width-1 && i > 0) {
        heightBuf[ind] += noise[ind-width+1]/16.f;
      }
      if (j < width-1 && i < depth-1) {
        heightBuf[ind] += noise[ind+width+1]/16.f;
      }
    }
  }
  return heightBuf;
}

std::vector<float> HeightGenerator::getNoise(float amp) {
  std::vector<float> noise(width*depth, 0.f);
  srand((unsigned)time(NULL));
  for (int i = 0; i < width*depth; i++) {
    if (i/width != 0 && i/width != depth-1 && i%width != 0 && i%width != width-1) {
      float random = float(rand() % 1000 + 1)/500.f - 1.f;
      noise[i] = amp*random;
    }
  }
  return noise;
}
