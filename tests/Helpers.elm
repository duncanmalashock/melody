module Helpers exposing (noteListsEqual, keyListsEqual, chordListsEqual)

import Note exposing (Note)
import Key exposing (Key)
import Chord exposing (Chord)
import Set
import Expect


noteListsEqual : List Note -> List Note -> Expect.Expectation
noteListsEqual listA listB =
    listsEqual Note.toString listA listB


keyListsEqual : List Key -> List Key -> Expect.Expectation
keyListsEqual listA listB =
    listsEqual Key.toString listA listB


chordListsEqual : List Chord -> List Chord -> Expect.Expectation
chordListsEqual listA listB =
    listsEqual Chord.toString listA listB


listsEqual : (a -> String) -> List a -> List a -> Expect.Expectation
listsEqual toStringFn listA listB =
    Expect.equalSets
        (Set.fromList <| List.map toStringFn listA)
        (Set.fromList <| List.map toStringFn listB)
