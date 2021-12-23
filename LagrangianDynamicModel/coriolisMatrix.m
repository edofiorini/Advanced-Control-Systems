function [C] = coriolisMatrix(q, dq, B)


    partialB = cat(3, diff(B, q(1)), diff(B, q(2)), diff(B, q(3)));

    C = zeros(3,'sym');
    for i=1:3
        for j=1:3
            for k=1:3
                cijk = 1/2 * (partialB(i,j,k) + partialB(i,k,j) - partialB(j,k,i)) * dq(k);
                C(i, j) = C(i, j) + cijk;
            end
        end
    end
    C = simplify(C);
end

