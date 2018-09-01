function amino_composition=amino_acid_composition(Seq)


amino_composition=[];
model=['A'    'R'    'N'    'D'    'C'    'Q'    'E'  ...
    'G'    'H'    'I'    'L'    'K'    'M'    'F' ...  
    'P'    'S'    'T'    'W'    'Y'    'V'   'X'];
[m,n]=size(Seq);
for i=1:m
    for j=1:21
        amino_composition(i,j)=length(find(Seq(i,:)==model(j)));
    end
end


    