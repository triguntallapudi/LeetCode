# Write your MySQL query statement below
Select *,
    case
        when dna_sequence regexp '^ATG'
        THEN 1
        ELSE 0 
    END AS has_start,
    case
        when dna_sequence regexp '(TAA|TAG|TGA)$'
        THEN 1
        ELSE 0 
    END AS has_stop,
    case
        when dna_sequence regexp 'ATAT'
        THEN 1
        ELSE 0 
    END AS has_atat,
    case
        when dna_sequence regexp 'GGG'
        THEN 1
        ELSE 0 
    END AS has_ggg
from samples

