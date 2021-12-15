# MUST Toolbox

[![DOI: MUST Toolbox](https://zenodo.org/badge/189009372.svg)](https://zenodo.org/badge/latestdoi/189009372)

MUST is a MATLAB toolbox containing a set of functions to analyze the computational properties of musical stimuli saved in MIDI format. Functions to assess Balance, Contour, Symmetry and Complexity are provided. A comprehensive description and formulation of the computational measures can be found in the Appendix B of the article cited at the end of this README file (included in the package). Two sets of musical stimuli to be used together with these measures can be found in <a href="https://osf.io/73mne/">MUST Set</a> and <a href="https://osf.io/k6gme/">NatMUST Set</a>, respectively consisting of composed stimuli and naturalistic stimuli curated from the Western classical repertoire (spanning the 14th-20th centuries).

## Installation and dependencies

This software requires MIDI files to be imported into MATLAB. In order to do this, you must extract the onset times, the duration and the MIDI pitch of each note event. This can be achieved in two ways:
- Using the MIDI toolbox to directly import MIDI files (Toiviainen, P., & Eerola, T. (2016). MIDI Toolbox 1.1. URL: https://github.com/miditoolbox/1.1).
- Using the `createmidimats.py` python script to convert MIDI files into CSVs, using the music21 package (Cuthbert, M. S., & Ariza, C. (2010). music21 v5.7.2. URL: https://web.mit.edu/music21/).

The MUST package does not require any installation. Download and unpack the MUST toolbox and include the package folder in the Matlab path variable.

## Examples

The package contains a file named `example.m` with an example of use of all the computational measures included in the package.

There is an additional file named `mustcsv.m` which includes reference code for (1) loading MIDI files using both approaches described in the previous section; (2) running the computational measures over all files in a specified folder; and (3) outputting results in a CSV file.

## Citation

If you use the source code or the <a href="https://osf.io/73mne/">MUST Set</a>, please make sure to reference the paper:

> Clemente, A., Vila-Vidal, M. , Pearce, M. T., Aguiló, G., Corradi, G., Nadal, M. (2020). A Set of 200 Musical Stimuli Varying in Balance, Contour, Symmetry, and Complexity: Behavioral and Computational Assessments. *Behavior Research Methods*, https://doi.org/10.3758/s13428-019-01329-8.

If you use the <a href="https://osf.io/k6gme/">NatMUST Set</a>, please make sure to reference the paper:

> Clemente, A., Kaplan, T. M., Pearce, M. T. (2021). The Naturalistic MUsical STimulus (NatMUST) set: 96 Excerpts Varying in Balance, Contour, Symmetry, and Complexity. *In Preparation*.


## License

Epylib is a free open-source software released under the General Public License version 3.
