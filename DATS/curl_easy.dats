(* ****** ****** *)
//
// API in ATS for libcurl
//
(* ****** ****** *)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2017 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** Permission to use, copy, modify, and distribute this software for any
** purpose with or without fee is hereby granted, provided that the above
** copyright notice and this permission notice appear in all copies.
**
** THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
** WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
** MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
** ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
** WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
** ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
** OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*)

(* ****** ****** *)
//
(*
// Author: Hongwei Xi
// Start time: 2017-01
// Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)

#staload "libats/SATS/stdio.sats"
#staload "libats/SATS/print.sats"
#staload "libats/SATS/gptr.sats"
#staload "libats/SATS/gref.sats"
#staload "libats/SATS/optn.sats"
#staload "libats/DATS/stdio.dats"

#staload "./../SATS/curl.sats"


extern
fun
check_curlcode(err: CURLerror): void

implement check_curlcode(err) = () where
{
  val err = CURLerror2code(err)
  val errmsg = curl_easy_strerror(err) : string
  val ((*void*)) =
  (if (err != CURLE_OK)
   then println!($mylocation, "\ncurl(ERROR): ", errmsg))
}


implement {a}
curl_easy_setopt(pcurl, opt1, x): CURLerror =
$extfcall(CURLerror, "curl_easy_setopt",
          CURLptr2ptr(pcurl), opt1, x)


implement {a}
curl_easy_setopt_exn(pcurl, opt1, x) = () where
{
val () =
$extfcall(void, "tmplats_curl_curl_easy_setopt_C_exn",
          CURLptr2ptr(pcurl), opt1, x)
}


extern
fun {a:tflt}
curl_easy_getinfo_ptr(x: !CURLptr1, i: CURLINFO) : a

implement {a}
curl_easy_getinfo_ptr(curl, opt1) = res where
{
  extern castfn ptr2a(x: ptr):<> a
  var url : ptr
  val () = curl_easy_getinfo(curl, opt1, addr@url)
  val res = ptr2a(url)
}


extern
fun
curl_easy_getinfo_charptr(x: !CURLptr1, i: CURLINFO) : string

implement
curl_easy_getinfo_charptr(curl, opt1) = res where
{
  extern castfn ptr2string(x: ptr):<> string
  var url : ptr
  val () = curl_easy_getinfo(curl, opt1, addr@url)
  val res = ptr2string(url)
}
