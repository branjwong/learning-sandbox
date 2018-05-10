-- file: ch03/BookStore.hs

-- Defining a new data type
data BookInfo = Book Int String [String]
                deriving (Show)

data MagazineInfo = Magazine Int String [String]
                    deriving (Show)

-- A type synonym
type CustomerId = Int
type ReviewBody = String
type BookRecord = (BookReview, BookInfo)

data BookReview = BookReview CustomerId ReviewBody String
data BetterReview = BetterReview BookInfo CustomerId ReviewBody


myInfo = Book 994352243 "Algebra of Programing" ["Richard Moor", "Oege de Moor"]

-- pattern matching
bookID (Book id title authors) = id
bookTitle (Book id title authors) = title

-- using wild cards
bookAuthors (Book _ _ authors) = authors

--

type CardHolder = String
type CardNumber = String
type Address = [String]

-- An algebraic data type
data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDeliver
                 | Invoice CustomerId
                   deriving (Show)

-- record syntax
data Customer = Customer 
    { customerID :: CustomerID
    , customerName :: String
    , customerAddress :: Address
    } deriving (Show)
