#!/bin/bash
cd "`pwd`/../a"

for f in abs advance alignof alignofValue assert assertionFailure contains count debugPrint debugPrintln distance dropFirst dropLast dump enumerate equal extend fatalError filter find first flatMap getVaList indices insert isEmpty isUniquelyReferenced isUniquelyReferencedNonObjC join last lazy lexicographicalCompare map max maxElement min minElement numericCast overlaps partition
do
  touch `echo $f.swift`
done
