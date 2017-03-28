-- file: ch03/BookStore.hs

data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

data BookReview = BookRecord CustomerId ReviewBody

type CustomerId = Int
type ReviewBody = String
type BookRecord = (BookReview, BookInfo)

myInfo = Book 994352243 "Algebra of Programing" ["Richard Moor", "Oege de Moor"]

type CardHolder = String
type CardNumber = String
type Address = [String]

data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDeliver
                 | Invoice CustomerId
                   deriving (Show)
