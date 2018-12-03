module Fabric exposing (partOne, partTwo)

import Parser exposing ((|.), (|=))
import Set exposing (Set)


type alias Point =
    { x : Int
    , y : Int
    }


type alias Claim =
    { id : Int
    , position : Point
    , width : Int
    , length : Int
    }


{-| Input comes in the form:
"""
#1 @ 12,548: 19x10
#2 @ 939,145: 29x27
#3 @ 115,603: 23x23
#4 @ 293,741: 24x29
...
"""

Where each line is a Claim

-}
inputParser : Parser.Parser (List Claim)
inputParser =
    Parser.sequence
        { start = ""
        , separator = ""
        , end = ""
        , spaces = Parser.spaces
        , item = claimParser
        , trailing = Parser.Optional
        }


pointParser : Parser.Parser Point
pointParser =
    Parser.succeed Point
        |= Parser.int
        |. Parser.symbol ","
        |= Parser.int


claimParser : Parser.Parser Claim
claimParser =
    Parser.succeed Claim
        |. Parser.symbol "#"
        |= Parser.int
        |. Parser.spaces
        |. Parser.symbol "@"
        |. Parser.spaces
        |= pointParser
        |. Parser.symbol ":"
        |. Parser.spaces
        |= Parser.int
        |. Parser.symbol "x"
        |= Parser.int


parse : String -> List Claim
parse input =
    Parser.run inputParser input
        |> Result.withDefault []


{-| Convert a Point into a scalar
-}
flattenPoint : Point -> Int
flattenPoint { x, y } =
    (x * gridWidth) + y


gridWidth : Int
gridWidth =
    1000


pointsWithin : Claim -> List Point
pointsWithin claim =
    let
        columnIndices =
            List.range claim.position.x (claim.position.x + claim.width - 1)

        rowIndices =
            List.range claim.position.y (claim.position.y + claim.length - 1)
    in
    List.concatMap (\x -> List.map (\y -> Point x y) rowIndices) columnIndices


addClaimOccupancies : Claim -> ( Set Int, Set Int ) -> ( Set Int, Set Int )
addClaimOccupancies claim ( singleOccupantCells, multiOccupantCells ) =
    let
        flattenedPoints =
            List.map flattenPoint (pointsWithin claim)

        addPoint flattenedPoint ( s, m ) =
            if Set.member flattenedPoint s then
                ( s, Set.insert flattenedPoint m )

            else
                ( Set.insert flattenedPoint s, m )

        ( newSingle, newMulti ) =
            List.foldl addPoint ( singleOccupantCells, multiOccupantCells ) flattenedPoints
    in
    ( newSingle, newMulti )


buildCellOccupancies : List Claim -> ( Set Int, Set Int )
buildCellOccupancies claims =
    List.foldl addClaimOccupancies ( Set.empty, Set.empty ) claims


cellsWithMultipleOccupants : List Claim -> Int
cellsWithMultipleOccupants claims =
    let
        ( _, multiOccupantCells ) =
            buildCellOccupancies claims
    in
    Set.size multiOccupantCells


partOne : String -> Int
partOne input =
    cellsWithMultipleOccupants <| parse input


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


above : Claim -> Claim -> Bool
above a b =
    a.position.y > (b.position.y + b.length - 1) || b.position.y > (a.position.y + a.length - 1)


leftOf : Claim -> Claim -> Bool
leftOf a b =
    a.position.x > (b.position.x + b.width - 1) || b.position.x > (a.position.x + a.width - 1)


doTheyOverlap : Claim -> Claim -> Bool
doTheyOverlap a b =
    let
        sameClaim =
            a.id == b.id
    in
    not (sameClaim || leftOf a b || above a b)


polygon : List Claim -> (Claim -> Bool)
polygon claims =
    let
        checks : List (Claim -> Bool)
        checks =
            List.map doTheyOverlap claims

        apply : a -> (a -> b) -> b
        apply a f =
            f a
    in
    \claim ->
        List.any (apply claim) checks


partTwo : String -> Maybe Int
partTwo input =
    let
        claims =
            parse input
    in
    firstWhere (not << polygon claims) claims
        |> Maybe.map .id
