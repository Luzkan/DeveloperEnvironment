## Task #6
W następujących po sobie kolejnych "commitach":

  - dodać dwa pliki o różnych zawartościach: a.txt i b.txt (svn add ...)
  - usunąć b.txt (svn delete ...)
  - dopisać wiersz tekstu do a.txt i przenieść a.txt do b.txt (svn move ...)
  - dopisać wiersz tekstu do b.txt i przenieść b.txt do c.txt (svn move ...)
  - dodać nowy plik b.txt (svn add ...)

Wyświetlić historię każdego obiektu i historię całego podkatalogu (svn log -v ...). Wykorzystując "peg-revision" i "operative revision" wyświetl zawartości pliku c.txt i wszystkich jego wcześniejszych wersji.

___

## Klonowanie repozytorium
##### Cloning repository
```console
$ svn checkout https://repo.cs.pwr.edu.pl/244979
$     *hasło*
$ cd 244979
```

## Tworzenie dwóch różnych plików
##### Creating two different files
```console
$ touch a.txt
$ touch b.txt
$ echo 'a' >> a.txt
$ echo 'b' >> b.txt
$ svn add a.txt
  A         a.txt
$ svn add b.txt
  A         b.txt
$ svn commit -m 'Bullet 1'
```

## Usunięcie `b.txt`
##### Deleting `b.txt`
```console
$ svn delete b.txt
  D         b.txt
$ svn commit -m 'Bullet 2'
```

## Dopisanie wierszu tekstu w `a.txt` i przeniesienie do `b.txt`
##### Adding a row of text in `a.txt` and moving it to `b.txt`
```console
$ echo 'a2' >> a.txt
$ svn move a.txt b.txt
  A         b.txt
  D         a.txt
$ svn commit -m 'Bullet 3'
```

## Dopisanie wierszu tekstu w `b.txt` i przeniesienie do `c.txt`
##### Adding a row of text in `b.txt` and moving it to `c.txt`
```console
$ echo 'b2' >> b.txt
$ svn move b.txt c.txt
  A         c.txt
  D         b.txt
$ svn commit -m 'Bullet 4'
```

## Tworzenie nowego pliku `b.txt`
##### Creating new file `b.txt`
```console
$ touch b.txt
$ svn add b.txt
  A         b.txt
$ svn commit -m 'Bullet 5'
```

## Zmiany pliku - `svn log c.txt -v`
##### Showing changes with `svn log c.txt -v`
```console
$ svn log c.txt -v
  ------------------------------------------------------------------------
  r43 | 244979 | 2020-11-08 16:37:18 +0100 (nie) | 1 linia
  Zmodyfikowane ścieżki:
    D /b.txt
    A /c.txt (z /b.txt:42)

  Bullet 4
  ------------------------------------------------------------------------
  r42 | 244979 | 2020-11-08 16:36:38 +0100 (nie) | 1 linia
  Zmodyfikowane ścieżki:
    D /a.txt
    A /b.txt (z /a.txt:41)

  Bullet 3
  ------------------------------------------------------------------------
  r40 | 244979 | 2020-11-08 16:34:37 +0100 (nie) | 1 linia
  Zmodyfikowane ścieżki:
    A /a.txt
    A /b.txt

  Bullet 1
  ------------------------------------------------------------------------
```

## Operative Revision & Peg Revision
```console
$ svn log c.txt@43 -v -r 43
  ------------------------------------------------------------------------
  r43 | 244979 | 2020-11-08 16:37:18 +0100 (nie) | 1 linia
  Zmodyfikowane ścieżki:
    D /b.txt
    A /c.txt (z /b.txt:42)

  Bullet 4
  ------------------------------------------------------------------------
$ svn log c.txt -v -r 41
  ------------------------------------------------------------------------
```

## Wyświetlanie zawartości `c.txt` i jego wcześniejszych wersji
##### Showing changes inside of `c.txt` file in all of it's iterations
### Operative Revision
```console
$ svn cat c.txt -r 43
  a
  a2
  b2

$ svn log c.txt -r 42
  a
  a2

$ svn log c.txt -r 40
  a
```

### Peg Revision
```console
$ svn cat c.txt@43
  a
  a2
  b2

$ svn log b.txt@42
  a
  a2

$ svn log c.txt@40
  a
```
