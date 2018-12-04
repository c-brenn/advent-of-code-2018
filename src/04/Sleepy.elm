module Sleepy exposing (Event(..), dateParser, minuteParser, parse, partOne, partTwo, timestampParser)

import Parser exposing ((|.), (|=))


type alias Minute =
    Int


type Event
    = ShiftStarted Int
    | NapStarted Minute
    | NapEnded Minute


type alias Nap =
    { start : Minute
    , end : Minute
    }


type alias Shift =
    { guard : Int
    , naps : List Nap
    }


parse : String -> Result (List Parser.DeadEnd) (List Event)
parse input =
    Parser.run inputParser input


inputParser : Parser.Parser (List Event)
inputParser =
    Parser.sequence
        { start = ""
        , separator = ""
        , end = ""
        , spaces = Parser.spaces
        , item = eventParser
        , trailing = Parser.Optional
        }


eventParser : Parser.Parser Event
eventParser =
    let
        timeParser : Parser.Parser Minute
        timeParser =
            Parser.succeed identity
                |= timestampParser
                |. Parser.spaces

        createEvent : Minute -> Parser.Parser Event
        createEvent minute =
            Parser.map (\f -> f minute) <| Parser.oneOf [ shiftStartedParser, napStartedParser, napEndedParser ]
    in
    Parser.andThen createEvent timeParser


intWithLeadingZero : Parser.Parser Int
intWithLeadingZero =
    Parser.oneOf
        [ Parser.succeed identity
            |. Parser.symbol "0"
            |= Parser.int
        , Parser.int
        ]


dateParser : Parser.Parser ()
dateParser =
    Parser.succeed ()
        |. intWithLeadingZero
        |. Parser.symbol "-"
        |. intWithLeadingZero
        |. Parser.symbol "-"
        |. intWithLeadingZero


minuteParser : Parser.Parser Minute
minuteParser =
    Parser.succeed identity
        |. intWithLeadingZero
        |. Parser.symbol ":"
        |= intWithLeadingZero


timestampParser : Parser.Parser Minute
timestampParser =
    Parser.succeed identity
        |. Parser.symbol "["
        |. dateParser
        |. Parser.spaces
        |= minuteParser
        |. Parser.symbol "]"


shiftStartedParser : Parser.Parser (Minute -> Event)
shiftStartedParser =
    Parser.succeed (\id -> \minute -> ShiftStarted id)
        |. Parser.symbol "Guard #"
        |= Parser.int
        |. Parser.symbol " begins shift"


napStartedParser : Parser.Parser (Minute -> Event)
napStartedParser =
    Parser.succeed NapStarted
        |. Parser.symbol "falls asleep"


napEndedParser : Parser.Parser (Minute -> Event)
napEndedParser =
    Parser.succeed NapEnded
        |. Parser.spaces
        |. Parser.symbol "wakes up"
        |. Parser.spaces


duration : Nap -> Int
duration { start, end } =
    end - start


countNaps : List Event -> List Nap -> ( List Nap, List Event )
countNaps events naps =
    case events of
        (NapStarted start) :: (NapEnded end) :: rest ->
            let
                nap =
                    { start = start, end = end }
            in
            countNaps rest (nap :: naps)

        _ ->
            ( naps, events )


buildShifts : List Event -> List Shift -> List Shift
buildShifts events shifts =
    case events of
        (ShiftStarted id) :: xs ->
            let
                ( naps, rest ) =
                    countNaps xs []

                shift =
                    { id = id, naps = naps }
            in
            buildShifts rest (shift :: shifts)

        _ ->
            shifts


partOne : String -> Int
partOne input =
    let
        events =
            parse input

        shifts =
            buildShifts events []

        sleepyHead =
            sleepiestGuard shifts

        sleepiestMinute =
            sleepiestMinute sleepyHead shifts
    in
    sleepyHead * sleepiestMinute


partTwo : String -> Int
partTwo input =
    7
