module Main where
import           FourPicsOneWord
import           Options.Applicative

data Args = Args{length :: String, letters :: String}

argP :: Parser Args
argP = Args
  <$> strOption (long "length" <> short 'n' <> help "the length of the word")
  <*> strOption (long "letters" <> short 'l' <> help "the letters used to guess")

printResults :: Args -> IO ()
printResults (Args n l) = print =<< filteredResults n l

main :: IO ()
main = execParser opts >>= printResults
  where opts = info (helper <*> argP)(fullDesc
                    <> progDesc "Guess 4pics1word from dictionary"
                    <> header "4pics1word cheater")
