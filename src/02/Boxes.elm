module Boxes exposing (partOne, partTwo)

import Dict


countCharacterOccurrences : String -> List Int
countCharacterOccurrences str =
    String.toList str
        |> List.foldl (\char acc -> Dict.update char (Maybe.withDefault 0 >> (+) 1 >> Just) acc) Dict.empty
        |> Dict.values


countPairsAndTrios : List (List Int) -> ( Int, Int )
countPairsAndTrios characterCounts =
    let
        pairs =
            List.filter (List.any ((==) 2)) characterCounts
                |> List.length

        trios =
            List.filter (List.any ((==) 3)) characterCounts
                |> List.length
    in
    ( pairs, trios )


checksum : List String -> Int
checksum ids =
    ids
        |> List.map countCharacterOccurrences
        |> countPairsAndTrios
        |> (\( x, y ) -> x * y)


partOne : List String -> Int
partOne input =
    checksum input


cartesianProduct : List a -> List a -> List ( a, a )
cartesianProduct xs ys =
    List.concatMap (\x -> List.map (\y -> ( x, y )) ys) xs


differByOneCharacter : ( String, String ) -> Bool
differByOneCharacter ( x, y ) =
    let
        xChars =
            String.toList x

        yChars =
            String.toList y
    in
    doDifferByOneCharacter 0 xChars yChars


doDifferByOneCharacter : Int -> List Char -> List Char -> Bool
doDifferByOneCharacter differences xChars yChars =
    case ( differences, xChars, yChars ) of
        ( 1, [], [] ) ->
            True

        ( 0, x :: xs, y :: ys ) ->
            if x == y then
                doDifferByOneCharacter differences xs ys

            else
                doDifferByOneCharacter (differences + 1) xs ys

        ( 1, x :: xs, y :: ys ) ->
            if x == y then
                doDifferByOneCharacter differences xs ys

            else
                False

        _ ->
            False


commonCharacters : ( String, String ) -> List Char
commonCharacters ( x, y ) =
    let
        xChars =
            String.toList x

        yChars =
            String.toList y
    in
    doCommonCharacters [] xChars yChars
        |> List.reverse


doCommonCharacters : List Char -> List Char -> List Char -> List Char
doCommonCharacters acc xChars yChars =
    case ( xChars, yChars ) of
        ( x :: xs, y :: ys ) ->
            if x == y then
                doCommonCharacters (x :: acc) xs ys

            else
                doCommonCharacters acc xs ys

        _ ->
            acc


possiblePairs : List String -> List ( String, String )
possiblePairs strings =
    cartesianProduct strings strings


firstWhere : (a -> Bool) -> List a -> Maybe a
firstWhere f list =
    case list of
        [] ->
            Nothing

        x :: xs ->
            if f x then
                Just x

            else
                firstWhere f xs


partTwo : List String -> String
partTwo input =
    possiblePairs input
        |> firstWhere differByOneCharacter
        |> Maybe.map (commonCharacters >> String.fromList)
        |> Maybe.withDefault "no matches found"
