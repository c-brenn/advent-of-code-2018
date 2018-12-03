module DayThreeTest exposing (suite)

import Expect
import Fabric
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Day Three"
        [ describe "Part One"
            [ let
                input =
                    """
                    #1 @ 1,3: 4x4
                    #2 @ 3,1: 4x4
                    #3 @ 5,5: 2x2
                    """
              in
              test "the sample input" <|
                \_ -> Expect.equal 4 (Fabric.partOne input)
            ]
        , describe "Part Two"
            [ let
                input =
                    """
                    #1 @ 1,3: 4x4
                    #2 @ 3,1: 4x4
                    #3 @ 5,5: 2x2
                    """
              in
              test "the sample input" <|
                \_ -> Expect.equal (Just 3) (Fabric.partTwo input)
            ]
        ]
