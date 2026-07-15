<#
.SYNOPSIS
    Lerp!
.DESCRIPTION
    Lerp performs linear interpolation in one, two, three, or four dimensions.

    This calculates the point along a straight line between two points.
.EXAMPLE
    # Lerp in 1D
    lerp 1 2 .5
.EXAMPLE
    # Lerp in 2D
    lerp 1,2 3,4 .5
.EXAMPLE
    # Lerp in 3D
    lerp 1,2,3 4,5,6 .5
.EXAMPLE
    # Lerp in 4D
    lerp 1,2,3,4 5,6,7,8 .5
#>
param(
# The start point
[PSObject]
$Start,

# The end point
[PSObject]
$End,

# The amount of lerp
# The percentage of change between two points
[Alias('Change','Percent')]
[float]
$Amount
)

# If either start or end is empty, default them
if (-not $start) { $start = 0 }
if (-not $end) { $end = 0 }

# Check that objects are the same type
if ($start.GetType() -ne $end.GetType()) {
    throw "Objects must be the same type"
}

# Handle arrays
if ($start -is [object[]]) {
    # by trying to turn them into numbers.
    $startVector = $start -as [float[]]
    $endVector = $end -as [float[]]
    # Then check our vector lengths match.
    if ($startVector.Length -ne $endVector.Length) {
        throw "Arrays must be the same length"
    }
    # Then handle each potential dimension
    if ($startVector.Length -eq 1) {
        $start = [Numerics.Vector2]::new($startVector[0], 1)
        $end = [Numerics.Vector2]::new($endVector[0], 1)
    } elseif ($startVector.Length -eq 2) {
        $start = [Numerics.Vector2]::new($startVector)
        $end = [Numerics.Vector2]::new($endVector)
    } elseif ($startVector.Length -eq 3) {
        $start = [Numerics.Vector3]::new($startVector)
        $end = [Numerics.Vector3]::new($endVector)
    } elseif ($startVector.Length -eq 4) {
        $start = [Numerics.Vector4]::new($startVector)
        $end = [Numerics.Vector4]::new($endVector)
    } else {
        # or throw an exception because our array is too large.
        throw "Too big to lerp: Array must be 1-4 elements, not $($startVector.Length) : $startVector"      
    }
}

# If the start or end is an int or double, make them floats.
if ($start -is [int] -or $start -is [double]) {$Start = $start -as [float]}
if ($end -is [int] -or $end -is [double]) {$End = $End -as [float]}


# 1D Lerp
if ($start -is [float] -and $end -is [float]) {
    $start = [Numerics.Vector2]::new($start,0)
    $end = [Numerics.Vector2]::new($end,0)
    return [Numerics.Vector2]::Lerp($Start, $End, $Amount).X
}

# 2D Lerp
if ($Start -is [Numerics.Vector2]) {    
    return [Numerics.Vector2]::Lerp($Start, $End, $Amount)
}


# 3D Lerp
if ($Start -is [Numerics.Vector3]) {
    return [Numerics.Vector3]::Lerp($Start, $End, $Amount)
}

# 4D Lerp
if ($Start -is [Numerics.Vector4]) {
    return [Numerics.Vector4]::Lerp($Start, $End, $Amount)
}

# IF it's none of these things, throw.
throw "Invalid type $($Start.GetType().Fullname):  Must be one of -" + "int, float, double, or Numerics.Vector2/3/4"
