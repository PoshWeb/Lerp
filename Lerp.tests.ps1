describe lerp {
    context 'Calculates linear interpolation' {
        it 'Lerps in 1D' {
            lerp 1 2 .5 | Should -Be 1.5
        }
        it 'Lerps in 2D' {
            lerp 1,2 3,4 .5 | Should -Be (
                [Numerics.Vector2]::new(2,3)
            )
        }
        it 'Lerps in 3D' {
            lerp 1,2,3 4,5,6 .5 | Should -Be (
                [Numerics.Vector3]::new(2.5,3.5,4.5)
            )
        }
        it 'Lerps in 4D' {
            lerp 1,2,3,4 5,6,7,8 .5 | Should -Be (
                [Numerics.Vector4]::new(3,4,5,6)
            )
        }
    }
}
