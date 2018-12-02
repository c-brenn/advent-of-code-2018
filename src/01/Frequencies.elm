module Frequencies exposing (partOne, partTwo)

import Parser exposing ((|.), (|=))
import Set


prefixedIntParser : Parser.Parser Int
prefixedIntParser =
    Parser.oneOf
        [ Parser.succeed negate
            |. Parser.symbol "-"
            |= Parser.int
        , Parser.succeed identity
            |. Parser.symbol "+"
            |= Parser.int
        ]


inputParser : Parser.Parser (List Int)
inputParser =
    Parser.sequence
        { start = ""
        , separator = ""
        , end = ""
        , spaces = Parser.spaces
        , item = prefixedIntParser
        , trailing = Parser.Optional
        }


parse : String -> List Int
parse input =
    case Parser.run inputParser input of
        Ok ints ->
            ints

        Err _ ->
            []



-- How I actually did part 1:
-- $ pbpaste | paste -s - | bc


partOne : String -> Int
partOne input =
    parse input
        |> List.sum



-- Danger, loops forever if no state is reached twice


findRepeatedState : List Int -> Set.Set Int -> Int -> List Int -> Int
findRepeatedState originalDeltas previousStates state deltas =
    case deltas of
        [] ->
            findRepeatedState originalDeltas previousStates state originalDeltas

        delta :: rest ->
            let
                nextState =
                    state + delta
            in
            if Set.member nextState previousStates then
                nextState

            else
                findRepeatedState originalDeltas (Set.insert nextState previousStates) nextState rest


partTwo : String -> Int
partTwo input =
    let
        deltas =
            parse input

        state =
            0

        previousStates =
            Set.singleton state
    in
    findRepeatedState deltas previousStates state deltas
