%For converting an edgelist exported from an R igraph into a structure file
function PGS = edgelist2str(adj, nodes, edges)

fileID = fopen(adj);
orig = textscan(fileID, '%d %d');
fclose(fileID);
nodes1 = cell2mat(orig(1));
nodes2 = cell2mat(orig(2));
PGS = cell(1);
matrix = zeros(2,edges);
for n=1:edges
    matrix(2,n) = int32(nodes1(n,1)+1);
    matrix(1,n) = int32(nodes2(n,1)+1);
end
PGS{1,1} = matrix;
save(['structureN' int2str(nodes) 'L' int2str(edges) '.mat'], 'PGS');
