(* ****** ****** *)


absvtflt
curl_slist_vtype(l:addr) = ptr(l)
vtypedef
curl_slist(l:addr) = curl_slist_vtype(l)


vtypedef
curl_slist0 = [l:agez] curl_slist(l)
vtypedef
curl_slist1 = [l:addr | l > null] curl_slist(l)


(* ****** ****** *)


castfn ptrof_slist{l:addr}(curl_slist(l)) : ptr(l)


fun
curl_slist_isneqz {l:addr}
(!curl_slist(l)) : bool(l > null) = "mac#%"


fun
curl_slist_app {l:addr}
(curl_slist(l)?!, string) : curl_slist(l) = "mac#%"


fun
curl_slist_append(curl_slist0?, string) : curl_slist1 = "mac#%"
fun
curl_slist_append1(curl_slist1, string) : curl_slist1 = "mac#curl_slist_append"


fun
curl_slist_free_all{l:addr}(curl_slist(l)) : void = "mac#%"
