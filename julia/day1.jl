function main()
    # Import data
    numbers = [parse.(Int, split(line)) for line in readlines("./data/day1_dat.txt")]
    col1, col2 = first.(numbers), last.(numbers)
    
    # Part 1: 
    println("Part 1:")
    line_diff = abs.(sort(col1) .- sort(col2))
    println(sum(line_diff))
    
    # Part 2: 
    println("Part 2:")
    mul_obs = [x * count(==(x), sort(col2)) for x in sort(col1)]
    println(sum(mul_obs))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end