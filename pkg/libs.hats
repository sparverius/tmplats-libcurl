// For downstream staloading
local

  #define PKG_targetloc "./.."

in

  #staload CURL = "{$PKG}/SATS/io.sats"
  #staload _ = "{$PKG}/DATS/io.dats"

end
