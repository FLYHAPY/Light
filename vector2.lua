vector2 = {}

function vector2.new(nx, ny)
    return {x = nx, y = ny}
end

function vector2.add(vec1, vec2)
    local result = vector2.new(0, 0)
    result.x = vec1.x + vec2.x
    result.y = vec1.y + vec2.y
    return result
end

function vector2.sub(vec1, vec2)
    local result = vector2.new(0, 0)
    result.x = vec1.x - vec2.x
    result.y = vec1.y - vec2.y
    return result
end

function vector2.mult(vec, n)
    local result = vector2.new(0, 0)
    result.x = vec.x * n
    result.y = vec.y * n
    return result
end

function vector2.div(vec, n)
    local result = vector2.new(0, 0)
    result.x = vec.x / n
    result.y = vec.y / n
    return result
end

function vector2.magnitude(vec)
    return math.sqrt((vec.x * vec.x) + (vec.y * vec.y))
end

function vector2.normalize(vec)
    local mag = vector2.magnitude(vec)
    if mag ~= 0 then
        return vector2.div(vec, mag)
    end
    return vec
end

function vector2.clamp(vec, max)
    local mag = vector2.magnitude(vec)
    if mag > max then
        local result = vector2.normalize(vec)
        return vector2.mult(result, max)
    end
    return vec
end

function vector2.dot(vec1, vec2)
    return (vec1.x * vec2.x) + (vec1.y * vec2.y)
end



