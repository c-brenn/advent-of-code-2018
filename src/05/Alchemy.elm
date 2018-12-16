module Alchemy exposing (partOne, partTwo, reaction)


partOne : String -> Int
partOne polymer =
    reaction polymer |> String.length


reaction : String -> String
reaction polymer =
    String.toList polymer
        |> List.foldl react []
        |> String.fromList


react : Char -> List Char -> List Char
react x seen =
    case seen of
        [] ->
            [ x ]

        y :: ys ->
            if x /= y && Char.toLower x == Char.toLower y then
                ys

            else
                x :: seen


partTwo : String -> Maybe Int
partTwo polymer =
    let
        start =
            Char.toCode 'a'

        end =
            Char.toCode 'z'

        deleteUnit : Char -> String
        deleteUnit char =
            String.replace (String.fromChar char) "" polymer
                |> String.replace (String.fromChar <| Char.toUpper char) ""
    in
    List.range start end
        |> List.map Char.fromCode
        |> List.map deleteUnit
        |> List.map partOne
        |> List.minimum
