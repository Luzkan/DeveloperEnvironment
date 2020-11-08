## Task #1
Utworzyć dwie kopie robocze własnego repozytorium. Na przykładowym pliku tekstowym doprowadzić do konfliktu, a następnie ręcznie rozwiązać konflikt.
W sprawozdaniu przedstawić, oprócz wykonywanych poleceń, zawartości plików ze znacznikami konfliktu.

___

## Klonowanie repozytorium po raz pierwszy (`v001`)
##### Cloning repository into `v001`
```console
$ cd v001
$ svn checkout https://repo.cs.pwr.edu.pl/244979 --username 244979 --password ********
```

## Tworzenie nowego pliczku
##### Creating new file
```console
$ cd 244979
$ touch test.txt
$ echo 'hej' >> test.txt
$ svn add test.txt
$ svn commit test.txt -m 'New File'
```

## Klonowanie repozytorium po raz drugi (`v002`)
##### Cloning repository into `v002`
```console
$ cd ../v002
$ svn checkout https://repo.cs.pwr.edu.pl/244979
```

## Modyfikacja Pliczku w `v001` i commit
##### Modifying file `v001` & commit
```console
$ cd ./v001/244979
$ echo 'world' >> test.txt
$ svn commit test.txt -m 'Hej World'
$     *hasło*
```

## Modyfikacja Pliczku w `v002` i konflikt
##### Modifying file `v002` & raising conflict
```console
$ cd ../../v002/244979
$ svn status -u
       *  xx  test.txt

$ echo '! :)' >> test.txt
$ svn status -u
  M    *  xx  test.txt

$ svn update
  C    test.txt
  Merge conflict discover in file 'test.txt'
```

W tym momencie, w `v002` pojawiają się trzy pliczki: `test.txt.mine`, `test.txt.r34`, `test.txt.r35`.
##### At this point in `v002` three new files should appear: `test.txt.mine`, `test.txt.r34`, `test.txt.r35`.

## Wygląd pliku `test.txt`
##### Insides of the `test.txt` file
```console
(otwarte w nowym commandline)

$ cat test.txt
  hej
  <<<<<<< .mine
  ! :)
  ||||||| .r34
  =======
  world
  >>>>>>> .r35
```

Teraz należy odpowiednio poprawić pliki, usuwając znaczniki konfliktu.
##### Now it's time to resolve conflict in the file, by fixing it and removing conflict tokens.

## Kontyunacja - resolve-conflict
##### Continuation - resolve-conflict
```console
$ df                        # Show Difference
  hej
  <<<<<<< .mine
  ! :)
  ||||||| .r34
  =======
  world
  >>>>>>> .r35
$ e                         # Edit File
  *edytowanie pliczku*
  hej
  world
  ! :)
$ ctrl + x                  # Wyjdź
$ T                         # Zgoda na zapis
$ enter                     # Zapis
$ r                         # Mark as resolved
```

## Commit zmian
##### Commit changes
```console
$ svn commit test.txt -m 'Hej World! :)'
```