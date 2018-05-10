Haskell
=======

GHCI
````

Using the functionality of other modules.

    .. code-block:: console

        ghci> :module + Data.Ratio

Inspecting functions.

    .. code-block:: console

        ghci> :info (+)
        ghci> :info (+)


Print the type of an expression after the expression.

    .. code-block:: console

        ghci> :set +t
        ghci> :unset +t

Print the type of a given expression.

    .. code-block:: console

        ghci> :type it
        it :: Integer
        ghci> :type 3 + 2
        3 + 2 :: (Num t) => t

Load a source file.

    .. code-block:: console

        ghci> :load BookStore
        [1 of 1] Compiling Main             ( BookStore.hs, interpreted )
        Ok, modules loaded: Main.

Terminal
````````

Run as a script.

    .. code-block:: haskell

        -- file: ch01/WC.hs
        -- lines beginning with "--" are comments.

        main = interact wordCount
            where wordCount input = show (length (lines input)) ++ "\n"

    .. code-block:: console

        $ cat quux.txt
        Teignmouth, England
        Paris, France
        Ulm, Germany
        Auxerre, France
        Brunswick, Germany
        Beaumont-en-Auge, France
        Ryazan, Russia
        $ runghc WC < quxx.txt
        7