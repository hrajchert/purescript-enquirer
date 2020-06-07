module Enquirer
  ( prompt
  , promptMultiple
  , PromptOptions(..)
  ) where

import Prelude
import Effect.Uncurried as FU
import Control.Promise (Promise, toAffE)
import Effect.Aff (Aff)
import Foreign (Foreign)

data PromptOptions
  = SinglePrompt { name :: String, message :: String }
  | Select { name :: String, message :: String, choices :: Array String }

foreign import _prompt :: FU.EffectFn1 PromptOptions (Promise Foreign)

prompt :: PromptOptions -> Aff Foreign
prompt = toAffE <<< FU.runEffectFn1 _prompt

foreign import _promptMultiple :: FU.EffectFn1 (Array PromptOptions) (Promise Foreign)

promptMultiple :: Array PromptOptions -> Aff Foreign
promptMultiple = toAffE <<< FU.runEffectFn1 _promptMultiple
