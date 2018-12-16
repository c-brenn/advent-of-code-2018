module DayFiveTest exposing (suite)

import Alchemy
import Expect
import Test exposing (Test, describe, test)


sampleInput =
    "dabAcCaCBAcCcaDA"


suite : Test
suite =
    describe "Day Five"
        [ describe "reaction"
            [ test "removes repeated letters of opposite case" <|
                \_ -> Expect.equal (Alchemy.reaction "aA") ""
            , test "keeps repeated letters of the same case" <|
                \_ -> Expect.equal (Alchemy.reaction "aa") "aa"
            , test "continues the reactions after removing letters" <|
                \_ -> Expect.equal (Alchemy.reaction "abBA") ""
            ]
        , describe "Part One"
            [ test "counts the units remaining after the reaction" <|
                \_ -> Expect.equal (Alchemy.partOne sampleInput) 10
            ]
        , describe "Part Two"
            [ test "finds the length of the shortest possible polymer after one unit deletion and reaction" <|
                \_ -> Expect.equal (Alchemy.partTwo sampleInput) (Just 4)
            ]
        ]
