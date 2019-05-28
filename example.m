

nmat=readmidi('K49.mid');

"Bisect unbalance:"
biUnbalance(nmat)
"Center of mass offset"
comOffset(nmat)
"Event heterogeneity"
eventHeterogeneity(nmat,'2',0.5)

"Average absolute interval"
avAbsInterval(nmat)
"Melodic abruptness"
melAbruptness(nmat)
"Durational abruptness"
durAbruptness(nmat)
"Rhythmic abruptness"
rythmAbruptness(nmat)

"Total asymmetry"
asymTotal(nmat);
"Asymmetry index"
asymIndex(nmat);

"Event density"
eventDensity(nmat)
"Average local pitch entropy"
avLocalp1entropy(nmat)
"Pitch entropy"
p1entropy(nmat)
"2-tuple pitch entropy"
p2entropy(nmat)
"3-tuple pitch entropy"
p3entropy(nmat)
"Interval entropy"
i1entropy(nmat)
"2-tuple interval entropy"
i2entropy(nmat)
"Duration entropy"
d1entropy(nmat)
"2-tuple duration entropy"
d2entropy(nmat)
"3-tuple duration entropy"
d3entropy(nmat)
"Weighted permutation entropy"
wpEntropy(nmat)

