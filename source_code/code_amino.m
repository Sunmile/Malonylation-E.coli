function code_seq=code_amino(seqs,kernel,times,space)

for j=1:size(seqs,1)
    seq=seqs(j,:);
    code_index_seq = [];
    for i=space
        code_index_seq=[code_index_seq;code_amino_pair(seq,i)];
    end
    code_index_seq=code_index_seq';
    code_seq(j,:)=sum(code_index_seq.*kernel);
end
end


