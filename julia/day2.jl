function main()
        # Read and parse the data
        data = [parse.(Int, split(line)) for line in readlines("./data/day2_dat.txt")]

    is_valid1 = Int[]
    for (i,row) in enumerate(data)
        diffs = diff(row)
        if all(abs.(diffs) .<= 3) && length(unique(sign.(diffs))) == 1
            push!(is_valid1, i)
        end
    end

    println("Part 1:")
    println(length(is_valid1))

    # Part 2
    is_valid2 = Int[]
    for (i, row) in enumerate(data)
        for j in 1:length(row)
            modified_row = deleteat!(copy(row), j)
            diffs = diff(modified_row)
            if all(abs.(diffs) .<= 3) && length(unique(sign.(diffs))) == 1
                push!(is_valid2, i)
                break
            end
        end
    end

    println("Part 2:")
    println(length(is_valid2))

end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end