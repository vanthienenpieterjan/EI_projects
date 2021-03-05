#include <iostream>
#include <string>
#include <vector>
#include "TFile.h"
#include <TChain.h>
#include "TCanvas.h"
#include <TLegend.h>
#include <TH1.h>
#include <TH2.h>
#include <TF1.h>
#include "TApplication.h"

using namespace std;

class ProjectionData
{
  public:
   ProjectionData();
   ~ProjectionData();
   void Plot();
  private:
   void PlotAnalog();
   Double_t CalculateFWTM();
   TCanvas* c1;
   TLegend* leg1;
   TH2D* vrt;
   TH2D* analog;
   TH1D* vrt_px;
   TH1D* analog_px;
   TApplication* theApp;
   TFile *vrtfile;
   TFile *analogfile;
};
