## Task #4
Utworzyć we własnym repozytorium podkatalog (np. o nazwie "externals") i ustawić na nim własność (property) ‘svn:externals’, tak aby w odpowiednim podkatalogu znalazła się kopia robocza repozytorium zewnętrznego:

`https://repo.cs.pwr.edu.pl/info/`

Sprawdzić na dodatkowych kopiach roboczych jak działają "svn up", "svn co" bez opcji "--ignore-externals" oraz z tą opcją.

___

## Klonowanie repozytorium i tworzenie `externals`
##### Cloning repository and creating `externals` directory
```console
$ svn checkout https://repo.cs.pwr.edu.pl/244979
$ cd 244979
$ mkdir externals
$ svn add externals
$ cd externals
$ svn propset svn:externals 'info https://repo.cs.pwr.edu.pl/info/' .
$ svn commit externals -m 'New Folder - externals'
```

## Ustawienie `svn:externals`
##### Setting `svn:externals`
```console
$ cd externals
$ svn propset svn:externals 'info https://repo.cs.pwr.edu.pl/info/' .
$ svn commit externals -m 'New Folder - externals'
$ svn propget svn:externals externals
  info https://repo.cs.pwr.edu.pl/info/
```

## `svn:externals`
```console
$ cd externals
$ svn propset svn:externals 'info https://repo.cs.pwr.edu.pl/info/' .
$ svn commit externals -m 'New Folder - externals'
```

## Effects
### svn update
```console
$ svn up
  Fetching external item into 'externals/info':
  A    externals/info/SP-20-21
  A    externals/info/SP-20-21/l3
  A    externals/info/SP-20-21/l3/a
  ...

$ rm -rf externals
$ svn up --ignore-externals
  Odtworzono 'externals'
$ cd externals
$ tree
  .

  0 directories, 0 files
```

### svn checkout
```console
$ cd ..
$ mkdir ignored
$ cd ignored
$ svn co https://repo.cs.pwr.edu.pl/244979
  ...
  A    244979/externals/info/asciinema/4_meta-sprawozdanie.cast
  A    244979/externals/info/asciinema/2_pierwsze_zadanie.cast
  A    244979/externals/info/index.html
  ...
$ rm -rf 244979
$ svn co https://repo.cs.pwr.edu.pl/244979 --ignore-externals
$ cd 244979/externals
$ tree
  .

  0 directories, 0 files
```
