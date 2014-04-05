# 4Pics1Word Cheater

4Pics1Word commandline cheater

## Build and Installation
clone and run


```

cabal-dev configure --enable-split-objs

cabal-dev install 
```

## Usage

```
$ 4pics1word -h
4pics1word cheater

Usage: 4pics1word (-n|--length ARG) (-l|--letters ARG)
  Guess 4pics1word from dictionary

Available options:
  -h,--help                Show this help text
  -n,--length ARG          the length of the word
  -l,--letters ARG         the letters used to guess

```
## Example

Given the following pic:

![image](https://raw.githubusercontent.com/Zane-XY-W/4Pics1WordCheater/master/test/example.png)

You can generate a list of possible words like:

```
$ 4pics1word -n 5 -l eryptcqkmnzp
["creek","creep","creme","crepe","crept","crepy","crypt","emcee","emeer","emery","emmer","emmet","empty","enemy","enter","entry","enzym","erect","kempt","kente","kerne","kerry","kreep","mercy","merer","merry","meter","metre","nertz","netty","pecky","peery","pence","penne","penny","peppy","perky","perry","peter","petty","preen","pryer","recce","reeky","rekey","remet","rente","retem","retry","teeny","tempt","tenet","tenty","tepee","terce","terne","terry","treen","typey","yente"]
```

## Contributing

TODO: Write contribution instructions here
