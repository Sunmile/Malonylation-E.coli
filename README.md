# Malonylation-E.coli
## Requirements
* Matlab2016a
* R 3.3.4
## Introduction of three encoding method
### Physiochemical Properties
14 properties polarity, polarizability, accessible,hydrophobicity, solvent, net charge index of side chains, molecular weight, PK-N, PK-
C, optical rotation, melting point, entropy of formation, heat capacity and absolute entropy which were selected from AAIndex database. \

### Binary Encoding
Binary feature extraction transforms amino acids into orthogonal numeric vectors. For example, alanine (A) is encoded as “100000000000000000000”, cystein (C) is encoded as “010000000000000000000” and so on.\

### Position Specific Amino Acid Propensity (PSAAP)
For every amino acid, we calculated the every amino acid frequency in the peptide P surrounding the center lysine site as below:\
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f5.png"> 

## Other formula：
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f1.png"> \
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f2.png"> \
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f3.png"> \
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f4.png"> \
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f6.png"> \
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f7.png"> \
<img src="https://github.com/Sunmile/Malonylation-E.coli/blob/master/picture/f8.png"> \


