(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2011-2013 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by the
** Free Software Foundation; either version 2.1, or (at your option)  any
** later version.
**
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
**
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)

(*
** Author: Hongwei Xi
** Authoremail: gmhwxiATgmailDOTcom
** Start time: September, 2013
*)

(* ****** ****** *)

typedef curl_infotype = $extype"curl_infotype"

fun curl_easy_init(): CURLptr0 = "mac#%"
fun curl_easy_init_exn(): CURLptr1 = "ext#%"

(* ****** ****** *)

fun{a:tflt}
curl_easy_setopt(curl: !CURLptr1, opt1: CURLOPT, x:a): CURLerror

fun
curl_easy_setopt_slist_exn {l:addr}
(curl: !CURLptr1, opt1: CURLOPT, x: !curl_slist(l)): void = "mac#%"

fun {a:tflt}
curl_easy_setopt_exn(curl: !CURLptr1, opt1: CURLOPT, x:a): void

fun
curl_easy_perform(curl: !CURLptr1): CURLerror = "mac#%"

fun
curl_easy_perform_exn(curl: !CURLptr1): void = "ext#%"

(* ****** ****** *)

fun
curl_easy_cleanup(curl: CURLptr1): void = "mac#%"
praxi
curl_easy_cleanup_null(curl: CURLptr(null)): void

(* ****** ****** *)

fun
curl_easy_getinfo(curl: !CURLptr1, info: CURLINFO, res: ptr) : void = "mac#%"

(* ****** ****** *)

fun
curl_easy_send {m:int}{n:nat | n <= m}
(
  curl: !CURLptr1,
  buf: &bytes(m),
  len: usize(m),
  n: &usize(n) >> usize(n2)
) : #[n2:int] CURLerror = "mac#%"

(* ****** ****** *)

fun
curl_easy_recv {m:int}{n:nat | n <= m}
(
  curl: !CURLptr1,
  buf: &bytes(m) >> _,
  len: usize(m),
  n: &usize(n) >> usize(n2)
) : #[n2:int] CURLerror = "mac#%"

(* ****** ****** *)

fun
curl_easy_duphandle(curl: CURLptr1): CURLptr0 = "mac#%"

(* ****** ****** *)

fun
curl_easy_reset(curl: CURLptr1): void = "mac#%"

(* ****** ****** *)

(*
fun
debug_callback
(CURLptr0, curl_infotype, ptr, size, ptr) : int = "mac#%"
*)

fun verbose_callback_exn(!CURLptr0) : void = "mac#%"

(* ****** ****** *)

(* end of [curl_easy.sats] *)
