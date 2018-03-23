#pragma once
#ifndef __HeightGenerator__
#define __HeightGenerator__

#include <vector>

class HeightGenerator
{
public:
  HeightGenerator(int w, int d);
  std::vector<float> generateHeight();
  int width, depth;
private:
  std::vector<float> generate(float amp, float interpC);
  std::vector<float> sumHeights(std::vector<float> h, std::vector<float> d, std::vector<float> d2);
  std::vector<float> getNoise(float amp);
  std::vector<float> linearInterp(std::vector<float> noise);
  std::vector<float> getSmoothInterp(std::vector<float> interp, float interpC);
  float interpolate(float a, float b, float blend);
};

#endif
