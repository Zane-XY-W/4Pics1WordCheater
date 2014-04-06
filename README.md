# 4Pics1Word Cheater

4Pics1Word commandline cheater

## Build and Installation
clone and run


```
cabal install 
```

## Usage

```
$ 4pics1word -?
4pics1word Cheater v0.1, (C) Zane W

args [OPTIONS]

Common flags:
  -n --length=DIGIT      the length of the word (2-8)
  -l --letters=ALPHABET  the letters used to guess (a-z) case-insensitive
  -? --help              Display help message
  -V --version           Print version information
```
## Example

Given the following pic:

![image](https://raw.githubusercontent.com/Zane-XY-W/4Pics1WordCheater/master/test/example.png)

You can generate a list of possible words like:

```
$ 4pics1word -n 5 -l eryptcqkmnzp
["crept","crepy","crypt","empty","entry","enzym","kempt","mercy","nertz","pecky","perky"]
```

