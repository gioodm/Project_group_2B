# Myelinated Axon Model

Modeling the effect of intra-axonal heterogeneity on the action potential conduction

## Getting Started

### Prerequisites

To run the model you will need MATLAB. This model and the associated GUI have been tried using the following combinations:

* MATLAB R2013b running on Windows 7   
* MATLAB R2016a running on OSX El Capitan   

### Installing

Clone or copy the directory to any location. Add the directory to the MATLAB path, or, at the MATLAB command prompt run:

```
>>Setup()
```

which will add the directory to the user's MATLAB path (after asking) and open the GUI.

## Reproducing the data

For exact data reproduction, use MATLAB 2021b.

In order to replicate the values of the Research Project 2, Group 2B run:

```
>>RunModel.m 			% voltage traces data for variation model
>>makeFigures		 	% recreate all figures used in the report
```

which are in the main directory. There is more example code in the Examples directory which will replicate other uses of the model (in [Bakiri et al. (2011)](http://onlinelibrary.wiley.com/doi/10.1113/jphysiol.2010.201376/abstract), [Ford et al. (2015)](https://www.nature.com/articles/ncomms9073)) and [Arancibia-Carcamo et al. (2017)](https://elifesciences.org/articles/23329).

## Authors

* Max Jacobs
* Jarno Koetsier
* Giorgia Del Missier
* Xenia Sterl

Research project 2

Master of Systems Biology

Maastricht University