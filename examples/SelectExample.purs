module SelectExample where

import Prelude
import Enquirer (prompt, PromptOptions(..), select)
import Effect.Aff (Aff, launchAff_)
import Effect (Effect)
import Effect.Console (log)
import Effect.Class (liftEffect)
import ExampleCommons (parseResponse)

askFruit :: Aff { fruit :: String }
askFruit =
  parseResponse
    =<< prompt
        ( Select
            { name: "fruit"
            , message: "What is your favourite fruit?"
            , choices: [ "Banana", "Apple", "Oranges" ]
            }
        )

main :: Effect Unit
main =
  launchAff_ do
    fruit <- askFruit
    liftEffect $ log $ show fruit
    fruit2 <- select "And the second?" [ "Banana", "Apple", "Oranges" ]
    liftEffect $ log $ show fruit2
