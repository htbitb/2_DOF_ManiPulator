function dMdei = Comp_dMdei( M,ei )
dMdei=simplify([diff(M(1,1),ei),diff(M(1,2),ei);...
                diff(M(2,1),ei),diff(M(2,2),ei)]);
              
end