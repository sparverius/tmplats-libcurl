//
// Some code for testing the API in ATS for libcurl
//
(* ****** ****** *)

#include "share/HATS/temptory_staload_bucs320.hats"

(* ****** ****** *)

#staload "./../SATS/curl.sats"
#include "./../DATS/curl.dats"


(* ****** ****** *)

extern fun{} get_URL (): string

(* ****** ****** *)

(*
CURL *curl = curl_easy_init();
if(curl) {
	CURLcode res;
  curl_easy_setopt(curl, CURLOPT_URL, "http://example.com");
  res = curl_easy_perform(curl);
  curl_easy_cleanup(curl);
}
*)

extern fun
response_body_outfile(curl: !CURLptr1, out: FILEref): void
implement
response_body_outfile(curl, out) = () where
{
  val () = curl_easy_setopt_exn(curl, CURLOPT_WRITEDATA, out)
}

extern fun
response_header_outfile(curl: !CURLptr1, out: FILEref) : void
implement
response_header_outfile(curl, out) = () where
{
  val () = curl_easy_setopt_exn(curl, CURLOPT_HEADERDATA, out)
}



extern
fun {} curl$global_init() : void
extern
fun {} curl$$init(): CURLptr1
extern
fun{} curl$cleanup(curl: CURLptr1) : void


implement
curl$global_init<>() = curl_global_init_exn(CURL_GLOBAL_SSL)

implement {}
curl$$init() = curl where
{
  val () = curl$global_init<>()
  val curl = curl_easy_init_exn()
}

implement
curl$cleanup<>(curl) = () where
{
  val () = curl_easy_cleanup(curl)
  val () = curl_global_cleanup ()
}


extern fun{}
curl$easy_setopt(curl: !CURLptr1) : void
implement
curl$easy_setopt<>(curl) = () where
{
  val () = curl_easy_setopt_exn(curl, CURLOPT_SSL_VERIFYPEER, 1L)
  val () = curl_easy_setopt_exn(curl, CURLOPT_SSL_VERIFYHOST, 2L)
  val () = response_body_outfile(curl, the_stdout())
}


extern
fun{}
curl$easy_getinfo(curl: !CURLptr1) : void
implement
curl$easy_getinfo<>(curl) = ()

extern
fn {}
curl$the_url() : string

extern
fun {}
curl$$url(curl: !CURLptr1) : void

implement {}
curl$$url(curl) = () where
{
  val url = curl$the_url<>()
  val () = curl_easy_setopt_exn(curl, CURLOPT_URL, url)
}

extern fun{} curl() : void
implement {}  curl() : void = () where
{
  val curl = curl$$init<>()

  val () = curl$$url<>(curl)

  val () = curl$easy_setopt<>(curl)
  val () = curl$easy_getinfo<>(curl)

  val () = curl_easy_perform_exn(curl)

  val () = curl$cleanup<>(curl)
}


extern fun{} http_get(url: string) : void
implement {} http_get(url) : void = (curl<>()) where
{
  implement curl$the_url<>() = url
}

implement main0() =
{
  val theURL = "https://www.github.com"
  val () = http_get<>(theURL)
}
