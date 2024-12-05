lines = readlines("day4/input.txt")
mat = map(line -> collect(Char, line), lines)

function num_xmas(mat, i, j, n, m)

    count = 0 
    # check up 
    if i - 3 >= 1 
        if mat[i][j] == 'X' && 
           mat[i-1][j] == 'M' && 
           mat[i-2][j] == 'A' && 
           mat[i-3][j] == 'S' 
            count += 1
        end
    end

    # check left up diagonal     
    if j - 3 >= 1 && i - 3 >= 1
        if mat[i][j] == 'X' && 
           mat[i-1][j-1] == 'M' && 
           mat[i-2][j-2] == 'A' && 
           mat[i-3][j-3] == 'S'
            count += 1
        end
    end

    # check left 
    if j - 3 >= 1
        if mat[i][j] == 'X' && 
           mat[i][j-1] == 'M' && 
           mat[i][j-2] == 'A' && 
           mat[i][j-3] == 'S'
            count += 1
        end
    end

    # check left down diagonal
    if i + 3 <= n && j - 3 >= 1
        if mat[i][j] == 'X' && 
           mat[i+1][j-1] == 'M' && 
           mat[i+2][j-2] == 'A' && 
           mat[i+3][j-3] == 'S'
            count += 1
        end
    end 
    
    # down 
    if i + 3 <= n 
        if mat[i][j] == 'X' && 
           mat[i+1][j] == 'M' && 
           mat[i+2][j] == 'A' && 
           mat[i+3][j] == 'S'
            count += 1
        end
    end

    # check right down diagonal
    if i + 3 <= n && j + 3 <= m
        if mat[i][j] == 'X' && 
           mat[i+1][j+1] == 'M' && 
           mat[i+2][j+2] == 'A' && 
           mat[i+3][j+3] == 'S'
            count += 1
        end
    end

    # check right
    if j + 3 <= n 
        if mat[i][j] == 'X' && 
           mat[i][j+1] == 'M' && 
           mat[i][j+2] == 'A' && 
           mat[i][j+3] == 'S'
            count += 1
        end
    end

    # check right up

    if i - 3 >= 1 && j + 3 <= n
        if mat[i][j] == 'X' && 
            mat[i-1][j+1] == 'M' && 
            mat[i-2][j+2] == 'A' && 
            mat[i-3][j+3] == 'S'
             count += 1
         end
    end

    return count
end 

function num_x_mas(mat, i, j, n, m)
    if i - 1 >= 1 && j - 1 >= 1 && i + 1 <= n && j + 1 <= m
        c1 = mat[i-1][j-1] 
        c2 = mat[i+1][j-1]
        c3 = mat[i+1][j+1]
        c4 = mat[i-1][j+1]
        if mat[i][j] == 'A' && ((c1 == 'M' && c3 == 'S') || (c1 == 'S' && c3 == 'M')) && ((c2 == 'M' && c4 == 'S') || (c2 == 'S' && c4 == 'M'))
            return 1
        end
    end

    return 0
end 


function count_xmas(mat) 
    n = size(mat)[1]
    m = size(mat[1])[1]
    p1 = 0
    p2 = 0 
    for i in eachindex(mat)
        for j in eachindex(mat[i])
            p1 += num_xmas(mat, i, j, n, m)
            p2 += num_x_mas(mat, i, j, n, m)
        end 
    end 

    return (p1, p2)
end 

count_xmas(mat)