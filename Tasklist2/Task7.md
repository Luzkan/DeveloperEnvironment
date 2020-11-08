## Task #7
Przy pomocy polecenia ssh-keygen wygenerować parę kluczy:  klucz prywatny i klucz publiczny. lucz publiczny (ten z końcówką '.pub') należy skopiować do
pliku o nazwie `<numer-indeksu>.pub` i umieścić w katalogu głównym
własnego repozytorium svn na serverze

___

## Tworzenie Kluczy
##### Creating keys
```console
$ ssh-keygen
$ ls ~/.ssh      # They are in /home/luzkan/ 
```

## Wrzucenie kluczu publicznego do głównego katalogu repozytorium
##### Pushing public key to main directory of remote repository
```console
$ svn import ~/.ssh/id_rsa.pub https://repo.cs.pwr.edu.pl/244979/244979.pub
  'Public Key Commit'
  *CTRL + X*
  T
  Enter
$ '********'
```
