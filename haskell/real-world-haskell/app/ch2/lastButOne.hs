-- file:ch2/lastButOne.hs

lastButOne :: [a] -> a
lastButOne list =
  last (init list)
