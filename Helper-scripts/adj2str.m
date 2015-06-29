function PGS = adj2str(adj, nodes, edges)

% data = importdata(adj, '\t');
data = adj;
disp(data);
PGS = cell(1);
matrix = zeros(2,edges);
counter = 1;
for i=1:nodes
    for j=1:nodes
        if data(i,j)==1
            matrix(2,counter)=i;
            matrix(1,counter)=j;
            counter = counter + 1;
        end
    end
end
PGS{1,1} = matrix;
save(['structureN' int2str(nodes) 'L' int2str(edges) '.mat'], 'PGS');
