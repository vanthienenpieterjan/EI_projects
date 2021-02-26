#include <TROOT.h>
#include <TFile.h>
#include <TChain.h>
#include <TTree.h>
#include <TBranch.h>
#include <TIterator.h>
#include <TObject.h>
#include <TKey.h>
#include <TLegend.h>
#include <TStyle.h>
#include "TApplication.h"
#include "TLine.h"
#include "TPaveLabel.h"
#include <TCanvas.h>

#include <iostream>
#include <fstream>
#include <sstream> 
#include <string>
#include <glob.h>
#include <ctype.h>
#include <sstream>
#include <vector>
#include <math.h>
#include "ProjectionData.hh"

using namespace std;

ProjectionData::ProjectionData()
{
 theApp=new TApplication("App", 0, 0);
 gStyle->SetCanvasColor(kWhite);     
 gStyle->SetCanvasBorderMode(0);     
 gStyle->SetPadBorderMode(0);
 c1 = new TCanvas("c1","Energy",0,0,900,800);
 leg1 = new TLegend(0.2,0.75,0.4,0.85);
 vrt = new TH2D("vrt","",320,-160,160,320,-160,160);
 vrt_px = new TH1D("vrt_px","",320,-160,160);
}
/*******************************************************/
ProjectionData::~ProjectionData()
{
 delete c1;
 delete leg1;
 delete vrt;
 if (vrt_px!=0) delete vrt_px;
 if (analog_px!=0) delete analog_px;
 delete theApp;
 if (analog!=0) delete analog;
}
/*******************************************************/
void ProjectionData::Plot()
{
Int_t totalNumberOfSimulations=1;
string baseNameIn="../output/flatfield";
string extensionIn=".root";	
string baseNameglobalPosX="../output/globalPosXff";
string baseNameglobalPosY="../output/globalPosYff";
string baseNameglobalPosZ="../output/globalPosZff";
string baseNameperfectCrystalPosX="../output/perfectCrystalPosXff";
string baseNameperfectCrystalPosY="../output/perfectCrystalPosYff";
string baseNameperfectCrystalPosZ="../output/perfectCrystalPosZff";
string baseNamevirtualVolumeInPosX="../output/virtualVolumeInPosXff";
string baseNamevirtualVolumeInPosY="../output/virtualVolumeInPosYff";
string baseNamevirtualVolumeInPosZ="../output/virtualVolumeInPosZff";
string baseNamevirtualVolumeOutPosX="../output/virtualVolumeOutPosXff";
string baseNamevirtualVolumeOutPosY="../output/virtualVolumeOutPosYff";
string baseNamevirtualVolumeOutPosZ="../output/virtualVolumeOutPosZff";
string baseNameEnergy="../output/energyff";
string extensionOut=".dat";
string filenameIn;
string filenameOut;

Float_t globalPosX;
Float_t globalPosY;
Float_t globalPosZ;
Float_t energy;
Double_t opath;
Double_t perfectCrystalPosX;
Double_t perfectCrystalPosY;
Double_t perfectCrystalPosZ;
Double_t virtualVolumeInPosX;
Double_t virtualVolumeInPosY;
Double_t virtualVolumeInPosZ;
Double_t virtualVolumeOutPosX;
Double_t virtualVolumeOutPosY;
Double_t virtualVolumeOutPosZ;

stringstream ss;
string isimstr;

TTree *Singles;
Int_t nentries;

Double_t* gpx;
Double_t* gpy;
Double_t* gpz;
Double_t* pcpx;
Double_t* pcpy;
Double_t* pcpz;
Double_t* vvinx;
Double_t* vviny;
Double_t* vvinz;
Double_t* vvoutx;
Double_t* vvouty;
Double_t* vvoutz;
Double_t* energies;
Int_t* totalnentries = new Int_t[1*totalNumberOfSimulations];

for (Int_t isim=1;isim<=totalNumberOfSimulations;isim++)
{
// num2str	
ss.str(""); // empty stream
ss << isim;
isimstr = ss.str();
	
//filenameIn = baseNameIn+isimstr+extensionIn;
filenameIn = baseNameIn+extensionIn;
vrtfile = TFile::Open(filenameIn.c_str());

Singles = (TTree*)gDirectory->Get("Singles");
//Int_t binSizeX=18000; // number of pixels in x-dimension
//Int_t binSizeY=10000; // number of pixels in y-dimension
//Double_t colliX=3.6/2; // half the size of the x-dimension of the detection plane
//Double_t colliY=2.0/2; // half the size of the y-dimension of the detection plane
//Double_t colliXsq=colliX*colliX;
//Double_t colliYsq=colliY*colliY;
//Double_t factorX=2*colliX/binSizeX; //pixel size
//Double_t factorY=2*colliY/binSizeY; //pixel size
//Double_t* projections=new Double_t[1*binSizeX*binSizeY]; //1 projection of binSize*binSize
//Double_t* projectionsReal=new Double_t[1*binSizeX*binSizeY]; //1 projection of binSize*binSize
//Double_t* projectionsImag=new Double_t[1*binSizeX*binSizeY]; //1 projection of binSize*binSize
//Double_t referenceZ;
Singles->SetBranchAddress("energy",&energy);
Singles->SetBranchAddress("globalPosX",&globalPosX);
Singles->SetBranchAddress("globalPosY",&globalPosY);
Singles->SetBranchAddress("globalPosZ",&globalPosZ);
Singles->SetBranchAddress("opath",&opath);
Singles->SetBranchAddress("perfectCrystalPosX",&perfectCrystalPosX);
Singles->SetBranchAddress("perfectCrystalPosY",&perfectCrystalPosY);
Singles->SetBranchAddress("perfectCrystalPosZ",&perfectCrystalPosZ);
Singles->SetBranchAddress("virtualVolumeInPosX",&virtualVolumeInPosX);
Singles->SetBranchAddress("virtualVolumeInPosY",&virtualVolumeInPosY);
Singles->SetBranchAddress("virtualVolumeInPosZ",&virtualVolumeInPosZ);
Singles->SetBranchAddress("virtualVolumeOutPosX",&virtualVolumeOutPosX);
Singles->SetBranchAddress("virtualVolumeOutPosY",&virtualVolumeOutPosY);
Singles->SetBranchAddress("virtualVolumeOutPosZ",&virtualVolumeOutPosZ);

nentries=(Int_t)Singles->GetEntries();
//cout<<"There are "<<nentries<<" entries"<<endl;
totalnentries[isim-1]=nentries;

gpx=new Double_t[1*nentries];
gpy=new Double_t[1*nentries];
gpz=new Double_t[1*nentries];
pcpx=new Double_t[1*nentries];
pcpy=new Double_t[1*nentries];
pcpz=new Double_t[1*nentries];
vvinx=new Double_t[1*nentries];
vviny=new Double_t[1*nentries];
vvinz=new Double_t[1*nentries];
vvoutx=new Double_t[1*nentries];
vvouty=new Double_t[1*nentries];
vvoutz=new Double_t[1*nentries];
energies=new Double_t[1*nentries];

for (int iter=0;iter<nentries;iter++)
 {
  gpx[iter]=0;
  gpy[iter]=0;
  gpz[iter]=0;
  pcpx[iter]=0;
  pcpy[iter]=0;
  pcpz[iter]=0;  
  vvinx[iter]=0;
  vviny[iter]=0;
  vvinz[iter]=0;
  vvoutx[iter]=0;
  vvouty[iter]=0;
  vvoutz[iter]=0;
  energies[iter]=0;
 }
//cout<<"entries: "<<nentries<<endl;
for (Int_t i=0;i<nentries;i++)
{
 Singles->GetEntry(i);
 //cout << "entry " << i+1 << " of " << nentries << endl;
 //cout<<"energy: "<<energy<<endl;
 if (energy<=0.060 && energy>=0.010) // energy range between 10 and 60 kev now
   {
	gpx[i]=globalPosX;
	gpy[i]=globalPosY;
	gpz[i]=globalPosZ;
	pcpx[i]=perfectCrystalPosX;
	pcpy[i]=perfectCrystalPosY;
	pcpz[i]=perfectCrystalPosZ;	
	vvinx[i]=virtualVolumeInPosX;
	vviny[i]=virtualVolumeInPosY;
	vvinz[i]=virtualVolumeInPosZ;
	vvoutx[i]=virtualVolumeOutPosX;
	vvouty[i]=virtualVolumeOutPosY;
	vvoutz[i]=virtualVolumeOutPosZ;
	energies[i]=energy;
   }
}


// Write to file
filenameOut = baseNameglobalPosX+isimstr+extensionOut;

ofstream file1(filenameOut,ios::binary);
file1.write((char*)gpx,sizeof(virtualVolumeInPosX)*1*nentries); 
file1.close(); 

filenameOut = baseNameglobalPosY+isimstr+extensionOut;

ofstream file2(filenameOut,ios::binary);
file2.write((char*)gpy,sizeof(virtualVolumeInPosX)*1*nentries); 
file2.close();

filenameOut = baseNameglobalPosZ+isimstr+extensionOut;

ofstream file3(filenameOut,ios::binary);
file3.write((char*)gpz,sizeof(virtualVolumeInPosX)*1*nentries); 
file3.close();

filenameOut = baseNamevirtualVolumeInPosX+isimstr+extensionOut;

ofstream file4(filenameOut,ios::binary);
file4.write((char*)vvinx,sizeof(virtualVolumeInPosX)*1*nentries); 
file4.close();

filenameOut = baseNamevirtualVolumeInPosY+isimstr+extensionOut;

ofstream file5(filenameOut,ios::binary);
file5.write((char*)vviny,sizeof(virtualVolumeInPosX)*1*nentries); 
file5.close();

filenameOut = baseNamevirtualVolumeInPosZ+isimstr+extensionOut;

ofstream file6(filenameOut,ios::binary);
file6.write((char*)vvinz,sizeof(virtualVolumeInPosX)*1*nentries); 
file6.close();

filenameOut = baseNamevirtualVolumeOutPosX+isimstr+extensionOut;

ofstream file7(filenameOut,ios::binary);
file7.write((char*)vvoutx,sizeof(virtualVolumeInPosX)*1*nentries); 
file7.close();

filenameOut = baseNamevirtualVolumeOutPosY+isimstr+extensionOut;

ofstream file8(filenameOut,ios::binary);
file8.write((char*)vvouty,sizeof(virtualVolumeInPosX)*1*nentries); 
file8.close();

filenameOut = baseNamevirtualVolumeOutPosZ+isimstr+extensionOut;

ofstream file9(filenameOut,ios::binary);
file9.write((char*)vvoutz,sizeof(virtualVolumeInPosX)*1*nentries); 
file9.close();

filenameOut = baseNameEnergy+isimstr+extensionOut;

ofstream file10(filenameOut,ios::binary);
file10.write((char*)energies,sizeof(virtualVolumeInPosX)*1*nentries); 
file10.close();

filenameOut = baseNameperfectCrystalPosX+isimstr+extensionOut;

ofstream file11(filenameOut,ios::binary);
file11.write((char*)pcpx,sizeof(virtualVolumeInPosX)*1*nentries); 
file11.close(); 

filenameOut = baseNameperfectCrystalPosY+isimstr+extensionOut;

ofstream file12(filenameOut,ios::binary);
file12.write((char*)pcpy,sizeof(virtualVolumeInPosX)*1*nentries); 
file12.close();

filenameOut = baseNameperfectCrystalPosZ+isimstr+extensionOut;

ofstream file13(filenameOut,ios::binary);
file13.write((char*)pcpz,sizeof(virtualVolumeInPosX)*1*nentries); 
file13.close();

// clear memory
delete[] gpx;
delete[] gpy;
delete[] gpz;
delete[] pcpx;
delete[] pcpy;
delete[] pcpz;
delete[] vvinx;
delete[] vviny;
delete[] vvinz;
delete[] vvoutx;
delete[] vvouty;
delete[] vvoutz;
delete[] energies;

}

ofstream file0("../output/numberOfEntries.dat",ios::binary);
file0.write((char*)totalnentries,sizeof(totalNumberOfSimulations)*1*totalNumberOfSimulations); 
file0.close();

//gStyle->SetOptStat("");
//c1->SetFillColor(0);
//c1->SetBorderMode(0);
//c1->SetLineColor(0);
//c1->SetLeftMargin(0.14);
//c1->Update();
//theApp->Run();

//c1->Connect("TCanvas","Closed()","TApplication",theApp,"Terminate()");
}
/*******************************************************/
