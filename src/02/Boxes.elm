module Boxes exposing (main)

import Dict
import Html exposing (div, h3, p, text)


input =
    [ "qysdgimlcaghpfozuwejmhrbvx"
    , "qysdtiklcagnpfhzuwbjmhrtvx"
    , "qysdtiflcsgnpfozuwejmhruvx"
    , "qkshtiklnagnpfozuwejmhrbvx"
    , "qysdtnklcagnpmozuwejmhrrvx"
    , "qysdttkecagnpfozuwijmhrbvx"
    , "qyedtiklcagnvfozuweymhrbvx"
    , "qyzdtikzcagnpfozuwejmhqbvx"
    , "qysdtiklcagnpfozlwedmhqbvx"
    , "qjsdtiklcagnpfozubejmhrbvq"
    , "qysdtiklcagnpfozvvejmhrbex"
    , "qdsdziklcagnpfouuwejmhrbvx"
    , "qysttikqccgnpfozuwejmhrbvx"
    , "qysdtiklcagnpbozwwecmhrbvx"
    , "qysdtiklcagnpfozuwexmmrjvx"
    , "nysdtiklcqgjpfozuwejmhrbvx"
    , "cysdoiqlcagnpfozuwejmhrbvx"
    , "qysdthxlcagnpfozuwejmcrbvx"
    , "qyswtiklcrgnpfozuwejmhrbvf"
    , "qysdtiklcagnpfozurejmhvpvx"
    , "qysdtiklcegnpfdzuwejghrbvx"
    , "qysdtjkluagnpfozuwenmhrbvx"
    , "qysdtimlcagnpjwzuwejmhrbvx"
    , "qyrdtiklcegnpeozuwejmhrbvx"
    , "qysdmiklcagnpfokswejmhrbvx"
    , "qysdtizlcagnpiozuwecmhrbvx"
    , "qysdtiklcignafxzuwejmhrbvx"
    , "qycdjiklcagnpzozuwejmhrbvx"
    , "qysdtiklcagnpjozuwepihrbvx"
    , "qyedtiklcrgnpfozuvejmhrbvx"
    , "mysdtikrcagnpfozwwejmhrbvx"
    , "qysdtiklcagnpfozuhcjmhrbsx"
    , "qmsdtiklcagnpfozuwehmhrevx"
    , "qgsdtiklcagnpfozuwejvhrbvp"
    , "lysdtikleagnpfozuwejmhrnvx"
    , "qxsdtivlzagnpfozuwejmhrbvx"
    , "qysdtiklcoggpfozuwebmhrbvx"
    , "wysdtiklcagnpfozuwejmornvx"
    , "jysdtiklvagntfozuwejmhrbvx"
    , "qmsdtiklcagnpfozuwejmrrbax"
    , "qysdttklcagnpfoiuwejmhrbvh"
    , "qysdtnklcaenpfozupejmhrbvx"
    , "qysdtoklcagnpfozuwexmhrbvq"
    , "qysdtiklcagnpuoeuwejmhrjvx"
    , "iysdtitncagnpfozuwejmhrbvx"
    , "qysdtixrcagnprozuwejmhrbvx"
    , "qyfdtiplcagnpfouuwejmhrbvx"
    , "qysdtmklcagnpfowuwejmhrbox"
    , "qysdtiklcagnxiozuwejphrbvx"
    , "fysdtiklcagnptozuwejmhrbvo"
    , "qysdqiklcagnplozuwejmhmbvx"
    , "qysdtwkacagnpfosuwejmhrbvx"
    , "qysdtitlcagnpfozufajmhrbvx"
    , "qysdtcklcagopfdzuwejmhrbvx"
    , "qmfdtdklcagnpfozuwejmhrbvx"
    , "qysztiklcaonpfozuwejmhrbfx"
    , "qygdtiklcggnpfozuwejmhrhvx"
    , "qysdiiklcagnpfozukejmcrbvx"
    , "qysdtrkloagnpfozuwujmhrbvx"
    , "qycdtiklcagnpfozywejmhrlvx"
    , "qgsdtikdcagnpfozgwejmhrbvx"
    , "qyudtikleagvpfozuwejmhrbvx"
    , "pysdtiqlcagnpfozuwejmarbvx"
    , "qysdtiklcaenpfozuwehahrbvx"
    , "qhsttiklcagnpfovuwejmhrbvx"
    , "zysdtikqmagnpfozuwejmhrbvx"
    , "rysdtikacagnpfozuwevmhrbvx"
    , "zysntikllagnpfozuwejmhrbvx"
    , "qysttimlcagndfozuwejmhrbvx"
    , "qysdtiklcaxopfqzuwejmhrbvx"
    , "qysdtislcagnpfozuwejmtrbnx"
    , "qysdviklcagnpfozswejmhibvx"
    , "qmsdtiklrygnpfozuwejmhrbvx"
    , "qysztiklcagnpfozuwejmorbrx"
    , "xysdtiklcagnzwozuwejmhrbvx"
    , "qysjthklcagnpfozowejmhrbvx"
    , "qysdtiklcagnpfofxwemmhrbvx"
    , "jysdtiklcagnpfozfwehmhrbvx"
    , "qysdtgklaagnpfozhwejmhrbvx"
    , "qqsdtiklcaenpfozuwejmhrvvx"
    , "qysdtikloajppfozuwejmhrbvx"
    , "qysdtiklcagnpwozuwejmhrhsx"
    , "qpsdtiklcapnprozuwejmhrbvx"
    , "qyzdtiklcagnpcozuwejmhrbvc"
    , "qusdhiklcagnpfozuwejmhrbxx"
    , "qysdtiklcagnpfozqwejthrvvx"
    , "qysvtiklcagnpfoiuwedmhrbvx"
    , "qgsdtiklcagvpfozuwejmhrbvf"
    , "qysdtikxcawnpfozuwejmarbvx"
    , "qyvctiklcaynpfozuwejmhrbvx"
    , "qyyltiklnagnpfozuwejmhrbvx"
    , "oysdtillcagnpfozuwejmnrbvx"
    , "qysdtiklcagnpfozuvmjmhrbzx"
    , "qykdtikocagnpfhzuwejmhrbvx"
    , "qysdtvkloagnpfozuwejmkrbvx"
    , "qysetiklcagnpfozuwejmhrxvh"
    , "qysdtiklcavnpfuzuwejmhrbvh"
    , "qmndtiklcagnpfojuwejmhrbvx"
    , "qysdtialcagnpfozuwejmdrqvx"
    , "qysdtiklcagnpfozuwejtzrbvv"
    , "qysdtiklxagnpyozufejmhrbvx"
    , "qysdtiklcagnpfgzewejahrbvx"
    , "qysdtiklcagppsozuwejmhrdvx"
    , "qykdtiklcainpfozuwejqhrbvx"
    , "qysdtiklcagnpfszxwejmhubvx"
    , "qyrdtiklcagkptozuwejmhrbvx"
    , "qysdsiklcagnpfozsvejmhrbvx"
    , "qypdtiklcagypfozuwejmhrlvx"
    , "qssdtiklcagnpfozuwqjmirbvx"
    , "qyshtiklcagnpfrzuwyjmhrbvx"
    , "qysdtiklcagnpfqzuwenmgrbvx"
    , "qysdtiklcagnpfonuwejmhkwvx"
    , "qysdhiklcagnpfokuwejmhrfvx"
    , "jysrtiklcaenpfozuwejmhrbvx"
    , "qysdtiilcagnpfozuwejmhcbvl"
    , "qysdtiklcagnheozuwejmhrbvn"
    , "qysdtikucagwpfojuwejmhrbvx"
    , "qysdtinlctgnpfozuwujmhrbvx"
    , "qysdtiklcagnpiozuwejmtrbjx"
    , "qysktiklcagqpfozuwcjmhrbvx"
    , "qysddiklcagnpfozpwejmhrbvh"
    , "wysdtiplcagnpfozuwejyhrbvx"
    , "qysdtiklcagnpfjzlwejmhrcvx"
    , "qysdtikleagopbozuwejmhrbvx"
    , "qysdtqklcwgnpfozuwejmirbvx"
    , "qysdtiklcugnpmozuwejmhrbvp"
    , "qysdtiklcagnpfozpwejmnrbvz"
    , "qysdtiklcagnpcozuwejmhbbmx"
    , "uysitiklcagnpfozewejmhrbvx"
    , "qykdtiklcasnpfozuwejdhrbvx"
    , "qyjdtiklcagnpqozuzejmhrbvx"
    , "qysdtiklcagaifozuwejmhrbvh"
    , "qysdtiklcagnhfozuwyjrhrbvx"
    , "qysetiklcaanpfozuwyjmhrbvx"
    , "qyfdtiklcagnphozulejmhrbvx"
    , "qysdtikkcrgnpfozuwejmhpbvx"
    , "qysdtiklcarnpfdzuwejmhrbvq"
    , "qysdtiklcfyrpfozuwejmhrbvx"
    , "rysdtitlcagnpfoznwejmhrbvx"
    , "qysdtiilcagnffozugejmhrbvx"
    , "qysdyifloagnpfozuwejmhrbvx"
    , "qysdtiklcegnpfozuwejmlrcvx"
    , "qysdtiklcagnpfozuwajmhbbqx"
    , "qysptrklcarnpfozuwejmhrbvx"
    , "qysdtiklcagnldozuwejmhwbvx"
    , "qysdtiklczgqpfozuwejmhobvx"
    , "qyxdtiklcagcpfoiuwejmhrbvx"
    , "qysatiklczgnpfozawejmhrbvx"
    , "qysduiklcagnpfoziwejyhrbvx"
    , "qysdtgklqagnpfozujejmhrbvx"
    , "qysdtiqlcagnpfozzdejmhrbvx"
    , "qysdtiklcngnpfofuwejmzrbvx"
    , "qysdtiklcagnyfozuwejrnrbvx"
    , "qysdtiplcagnpfozowmjmhrbvx"
    , "qyswtiklcagnplozuwedmhrbvx"
    , "qyseiiklcagnpfozuwejmhibvx"
    , "qysdtiklcagnpfozutusmhrbvx"
    , "qysdtimlcagnpfozccejmhrbvx"
    , "qnsdniklcagnpfobuwejmhrbvx"
    , "qysrtiklcagnpfofuwejmhrbyx"
    , "qyzdtiklcagnpfoizwejmhrbvx"
    , "qysdtjslcdgnpfozuwejmhrbvx"
    , "qysdtiklcagnpxoyuwejmrrbvx"
    , "qysdtikllagnpfmzuwbjmhrbvx"
    , "qysdtitlcagnkfozuwejwhrbvx"
    , "qymdtiklcggnpfozuwejmzrbvx"
    , "qysdtiklclfnpfozuhejmhrbvx"
    , "qysdtyklcagnpfozuwejmhhbix"
    , "qysetiklcagnpfozuwejmhrspx"
    , "qysdipklcagnpfozuwejmhrbex"
    , "uysgtiklcagnpmozuwejmhrbvx"
    , "qysdtiklmagnpfozuwqlmhrbvx"
    , "qysdtiklcagnyfozxwejmhrmvx"
    , "qysutillcagnpfozuwejmhrbbx"
    , "casdtiklcagnpfopuwejmhrbvx"
    , "qesdtiklctgnpfmzuwejmhrbvx"
    , "qysdtiklcagopfozjwejmdrbvx"
    , "jzsdtiklcagnpfozuwejmurbvx"
    , "qysdtiklcjgnpfonuwejrhrbvx"
    , "qysdtiklcrgnpnozuwejmhqbvx"
    , "oyhdtiklcagnpfozuwekmhrbvx"
    , "qysstiklcagjpfozuwejmhrbnx"
    , "qyudtiklsagnpsozuwejmhrbvx"
    , "qysdtiilcagnpfozusejmhrbva"
    , "qysdtiklcaknpfozmwejmhgbvx"
    , "qysdbiklcpgnpfozuwejmrrbvx"
    , "qybdtiklcagvpfokuwejmhrbvx"
    , "qysatiklcagnpwofuwejmhrbvx"
    , "qysdtiklcadnpfonuwejmcrbvx"
    , "qysdtijfcagnpfozuvejmhrbvx"
    , "qysdtiklcagnpfhluuejmhrbvx"
    , "qysdtiklcagnpfoguwejqhrwvx"
    , "qlsdtiklcagnpfojuwehmhrbvx"
    , "qyhdtiolcagnpfozuwejmhrzvx"
    , "qmsdtiklcagnppozuwpjmhrbvx"
    , "qysdtiklvvgnpfvzuwejmhrbvx"
    , "qysdtiklcagnpfszuwajmhrcvx"
    , "qysdtiklcagnpfmzuwekmhrbyx"
    , "qysdtiklcagwpfozumevmhrbvx"
    , "qysdtaklcagnpfozuwejvhzbvx"
    , "qysotiklcagntffzuwejmhrbvx"
    , "qysdtiklcagnpfowuweqmhrivx"
    , "qysdtrkloagnxfozuwujmhrbvx"
    , "qasdiiklcagnpfozuwegmhrbvx"
    , "qysbtiklcagnpfozuwejthrbhx"
    , "hysdtikllagnpfozuwejmhrbbx"
    , "qyqdtiklcagnpsozuwejmcrbvx"
    , "qysdtiklcagnpiqzuwejmhrbux"
    , "qnsdtiklcagnpfozdwejmhbbvx"
    , "qysjbiklcagzpfozuwejmhrbvx"
    , "qysdtiklcagnpfifuwejmhrbvg"
    , "qysdtiklcaggpkozunejmhrbvx"
    , "qxsdtiklcavnpfozuwfjmhrbvx"
    , "qysdtikycabnpfkzuwejmhrbvx"
    , "qyswtzklcagnpfozuwejmhrlvx"
    , "qysdtikqcagnpfozuwejrhnbvx"
    , "qysdtiplaagnpfozuwejmhruvx"
    , "qjcdtiklcagnpfozujejmhrbvx"
    , "nysdtyklcagnpfozutejmhrbvx"
    , "qysrtiklcagnpfnzuwejmhrbdx"
    , "zysdtielcagnpfozuwezmhrbvx"
    , "qysdtikpvagnpfozuzejmhrbvx"
    , "qysdwiklcagnpfozueejmhrlvx"
    , "dysdmiklcagnpfozuwejzhrbvx"
    , "qysdtiklcjgnpfozuweimhmbvx"
    , "qysdtiklciynpyozuwejmhrbvx"
    , "qksdtiklcagnpbozubejmhrbvx"
    , "qysdtiklkagnpfozuwejmhrjvb"
    , "yyxdtiklcagnpfomuwejmhrbvx"
    , "qysdtiklcagnfnozuwejmhrbvv"
    , "qysdtzklcagnpfozuwejmhrmvb"
    , "qysduiklclgnpfozuwejmhrbvn"
    , "qyndtmklcavnpfozuwejmhrbvx"
    , "qisdkiklcagnpfozuwqjmhrbvx"
    , "qysdtrkycagypfozuwejmhrbvx"
    , "qhsdtiklcwgnmfozuwejmhrbvx"
    , "qysdaiklcannpfozupejmhrbvx"
    , "zysdtiklcagnpjozuwejmhrbwx"
    , "qysdtikxcagnpfozuwejmcrxvx"
    , "qysdtzklcagnpfozewejmhrbvk"
    , "qysdwtklcagnhfozuwejmhrbvx"
    , "qysdtqklcaenpfozuwejmdrbvx"
    , "qysdtiklcagnpfozuoeemhqbvx"
    , "nysdtikocagnpfozuwejmhwbvx"
    , "qysxtiklcagnpfozqwejmhrbax"
    , "qysdtielcasnpfozuwejmhsbvx"
    , "qysdtiklcaknpfozuwejcwrbvx"
    , "qysytiklcagnpfozdfejmhrbvx"
    , "qysdtiklcagmpfozuwejmgrbox"
    , "qysdtielcagnpfpzuwejhhrbvx"
    ]


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


partOne : Int
partOne =
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


partTwo : String
partTwo =
    possiblePairs input
        |> firstWhere differByOneCharacter
        |> Maybe.map (commonCharacters >> String.fromList)
        |> Maybe.withDefault "no matches found"


main =
    div []
        [ h3 [] [ text "Part 1" ]
        , p [] [ text <| String.fromInt partOne ]
        , h3 [] [ text "Part 2" ]
        , p [] [ text partTwo ]
        ]
