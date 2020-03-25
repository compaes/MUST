# MUST Toolbox

[![DOI]()]() 

MUST is a MATLAB toolbox containing a set of functions to analyze the computational properties of musical stimuli saved in MIDI format. Functions to assess Balance, Contour, Symmetry and Complexity are provided. A comprehensive description and formulation of the computational measures can be found in the Appendix B of the article cited at the end of this README file (included in the package). A set of musical stimuli to be used together with these measures can be found in <a href="https://osf.io/73mne/">MUST Set</a>.

## Installation and dependencies

This software uses the MIDI toolbox to import the MIDI files into MATLAB, to extract the onset times, the duration and the MIDI pitch of each note event (Toiviainen, P., & Eerola, T. (2016). MIDI Toolbox 1.1. URL: https://github.com/miditoolbox/1.1).

The MUST package does not require any installation. Download and unpack the MUST toolbox and include the package folder in the Matlab path variable.

## Examples

The package contains a file named `example.m` with an example of use of all the computational measures included in the package.

## Citation

If you use the source code, please make sure to reference both the package and the paper:

> Vila-Vidal, M., & Clemente, A. (2020). MUST Toolbox v1.0, https://github.com/compaes/MUST. Zenodo, doi:***.

> Clemente, A., Vila-Vidal, M. , Pearce, M. T., Aguiló, G., Corradi, G., Nadal, M. (2020). A Set of 200 Musical Stimuli Varying in Balance, Contour, Symmetry, and Complexity: Behavioral and Computational Assessments. *Behavior Research Methods*, https://doi.org/10.3758/s13428-019-01329-8.

If you use the <a href="https://osf.io/73mne/">MUST Set</a>, please make sure to reference it as follows:

> Clemente, A., Vila-Vidal, M., Nadal, M., Pearce, M. T., Corradi, G., & Aguiló, G. (2020). MUST Set, https://doi.org/10.17605/OSF.IO/73MNE.

## License

Epylib is a free open-source software released under the General Public License version 3.
