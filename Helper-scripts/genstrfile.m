% Generates a random graph with the specified number of nodes and edges
% nodes = # of nodes
% edges = # of edges
function strfile = genstrfile(nodes, edges)

nodes = 89;
edges = 100;

PGS = cell(1);
matrix = zeros(2, edges);
used = diag(ones(1,nodes));
min = 1;
max = nodes;

% Assigns random connections to each node
for e=1:edges
  disp(e);
  matrix(1,e) = cast(((max-min).*rand + min),'int16');
  val = cast(((max-min).*rand + min),'int16');
  while (used(matrix(1,e),val) == 1)
    val = cast(((max-min).*rand + min),'int16');
  end
  matrix(2,e) = val;
  used(matrix(1,e),val) = 1;
end
PGS{1,1} = matrix;
save(['structureN' int2str(nodes) 'L' int2str(edges) '.mat'], 'PGS');
