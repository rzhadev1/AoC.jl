lines = readlines("input.txt")
a = sort(map(x -> parse(Int, split(x, " ")[1]), lines))
b = sort(map(x -> parse(Int, split(x, " ")[4]), lines))
println(reduce(+, map(x -> abs(x[1] - x[2]), zip(a, b))))

counts = Dict()
for elt in b 
    if !(haskey(counts, elt))
        counts[elt] = 1
    else 
        counts[elt] += 1 
    end 
end 
similarity = reduce(+, map(x -> haskey(counts, x) ? counts[x]*x : 0, a))
println(similarity)