module DayFourTest exposing (suite)

import Expect
import Sleepy exposing (Event(..))
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Day Four"
        [ describe "parseInput"
            [ let
                input =
                    """
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
"""
              in
              test "it makes nice Events" <|
                \_ -> Expect.equal (Sleepy.parse input) (Ok [])
            ]
        ]
