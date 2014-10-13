module Paths_Exercism (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/adam/Library/Haskell/bin"
libdir     = "/Users/adam/Library/Haskell/ghc-7.8.3-x86_64/lib/Exercism-0.1"
datadir    = "/Users/adam/Library/Haskell/share/ghc-7.8.3-x86_64/Exercism-0.1"
libexecdir = "/Users/adam/Library/Haskell/libexec"
sysconfdir = "/Users/adam/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Exercism_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Exercism_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Exercism_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Exercism_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Exercism_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
