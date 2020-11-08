## Task #2
Utworzyć we własnym repozytorium poddrzewa katalogów (wykorzystać dane z listy 1), a następnie utworzyć kopie robocze, w których zostanie zademonstrowane wykorzystanie "sparse directories" do sprowadzenia różnych wybranych fragmentów podkatalogów.
Do wyświetlania drzew katalogów do sprawozdania użyć polecenia ‘tree’. 

___

## Klonowanie repozytorium i dodanie danych z Listy #1
##### Cloning repository and adding data from Tasklist #1
```console
$ svn checkout https://repo.cs.pwr.edu.pl/244979
$ cd 244979
$ svn export https://repo.cs.pwr.edu.pl/info/SP-20-21/l1/a/
$ svn add a
$ svn commit a -m 'New Folder'
```

## Usunięcie lokalnego repozytorium
##### Removing local copy of the repository
```console
$ cd ..
$ rm -rf 244979
```

## Sprarse Directories:
### Depth empty
```console
$ svn checkout https://repo.cs.pwr.edu.pl/244979 --depth empty
$ cd 244979
$ tree
  .

  0 directories, 0 files
$ svn update https://repo.cs.pwr.edu.pl/244979 --depth empty
$ tree
  .

  0 directories, 0 files
```

### Depth immediates
```console
$ svn update https://repo.cs.pwr.edu.pl/244979 --depth immediates a
$ tree
    └── a
        ├── a
        ├── aa
        ├── aaa
        ├── aab
        ├── ab
        ├── aba
        ├── abb
        ├── b
        ├── ba
        ├── baa
        ├── bab
        ├── bb
        ├── bba
        └── bbb
```


```console
$ svn update https://repo.cs.pwr.edu.pl/244979 --set-depth immediates a/a
$ tree
  └── a
      ├── a
      │   └── b
      ├── aa
      ├── aaa
      ...
```

### Depth infinity
```console
$ svn update https://repo.cs.pwr.edu.pl/244979 --set-depth infinity a/aa
$ tree
  └── a
      ├── a
      │   └── b
      ├── aa
      │   └── b
      │       └── aaab
      ├── aaa
      ├── aab
      ...
```
