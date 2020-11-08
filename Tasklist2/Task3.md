## Task #3
Sprawdzić i zademonstrować jaki ma wpływ ustawienie i skasowanie własności   `svn:executable` na skryptach. (Mogą być to skrypty z poprzedniej listy zadań.)

___

## Klonowanie repozytorium
##### Cloning repository
```console
$ svn checkout https://repo.cs.pwr.edu.pl/244979
```

## Próba uruchomienia skryptu
##### Attempt to launc the script
```console
$ cd 244979/Tasklist1
$ ./task1.sh
  bash: ./task1.sh : Brak dostępu
```

## svn:executable
```console
$ svn propset svn:executable on *.sh
  atrybut 'svn:executable' ustawiony dla 'task1.sh'
  atrybut 'svn:executable' ustawiony dla 'task2.sh'
  atrybut 'svn:executable' ustawiony dla 'task3.sh'
  atrybut 'svn:executable' ustawiony dla 'task4.sh'
  atrybut 'svn:executable' ustawiony dla 'task5.sh'
  atrybut 'svn:executable' ustawiony dla 'task6.sh'
$ ./task1.sh
  ...           #output
```
