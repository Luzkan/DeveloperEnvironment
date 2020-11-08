## Task #5
Przetestować zakładanie, usuwanie, zrywanie i podkradanie blokady plików ('svn lock' i związane z nim polecenia).

___

## Klonowanie repozytorium
##### Cloning repository
```console
$ svn checkout https://repo.cs.pwr.edu.pl/244979
$ cd 244979
```

## Lockowanie pliku `test.txt`
##### Locking `test.txt` file
```console
$ svn lock test.txt -m 'Locking File'
  'test.txt' zablokowane przez użytkownika '244979'.
$ svn status
  K  test.txt
$ svn info test.txt
  ...
  Żeton blokady: opaquelocktoken:3f5e6ffb-f35a-4602-ad6e-407d98326e36
  Właściciel blokady: 244979
  Blokada została utworzona: 2020-11-08 15:52:58 +0100 (nie)
  Opis blokady (1 linia):
  Lock File
```

## Lock/Unlock na nowym pliku `lock.txt`
##### Using `lock`/`unlock` commands on `lock.txt` file
```console
$ touch lock.txt
$ svn add lock.txt
$ svn commit -m 'Locked File'
$ svn lock lock.txt -m 'Locking the File'
  'lock.txt' zablokowane przez użytkownika '244979'.
$ svn status
  K  lock.txt
$ svn unlock test.txt -m 'Locking File'
  'lock.txt' odblokowane.
$ svn lock lock.txt -m 'Locking the File'
  'lock.txt' zablokowane przez użytkownika '244979'.
$ svn status -u
  K          45   lock.txt
  O          44   test.txt
```

## Zrywanie blokady
##### Removing lock
```console
$ svn unlock --force https://repo.cs.pwr.edu.pl/244979/lock.txt
  'https://repo.cs.pwr.edu.pl/244979/lock.txt' odblokowane.
```

## Kradnięcie blokady
##### Stealing lock
```console
$ svn lock https://repo.cs.pwr.edu.pl/244979/test.txt
  svn: warning: W160035: Path 'https://repo.cs.pwr.edu.pl/244979/test.txt' is already locked by user '244979' in filesystem '3f5e6ffb-f35a-4602-ad6e-407d98326e36'

$ svn lock --force https://repo.cs.pwr.edu.pl/244979/test.txt
  'https://repo.cs.pwr.edu.pl/244979/test.txt' zablokowane przez użytkownika '244979'.
```
