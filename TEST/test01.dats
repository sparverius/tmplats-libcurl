
#include "share/HATS/temptory_staload_bucs320.hats"

#staload "./../SATS/curl.sats"
#include "./../DATS/curl.dats"

(* ****** ****** *)

#macdef easy_setopt(a,b,c) = curl_easy_setopt_exn(,(a), ,(b), ,(c))

#symload .setopt with curl_easy_setopt_exn
#symload .setopt_slist with curl_easy_setopt_slist_exn

(* ****** ****** *)

extern
fun response_body_outfile(curl: !CURLptr1, out: FILEref): void

implement response_body_outfile(curl, out) = () where
{
  val () = curl.setopt(CURLOPT_WRITEDATA, out)
}

extern
fun response_header_outfile(curl: !CURLptr1, out: FILEref) : void

implement response_header_outfile(curl, out) = () where
{
  val () = curl.setopt(CURLOPT_HEADERDATA, out)
}

typedef str = string
extern
fun {} curl$add_headers1(!CURLptr1, str) : curl_slist1
extern
fun {} curl$add_headers2(!CURLptr1, str, str) : curl_slist1
extern
fun {} curl$add_headers3(!CURLptr1, str, str, str) : curl_slist1
extern
fun {} curl$add_headers4(!CURLptr1, str, str, str, str) : curl_slist1
extern
fun {} curl$add_headers5(!CURLptr1, str, str, str, str, str) : curl_slist1
extern
fun {} curl$add_headers6(!CURLptr1, str, str, str, str, str, str) : curl_slist1

implement {} curl$add_headers1(curl, s0) = slist where
{
  var slist : curl_slist0 //[l:addr] curl_slist(l)
  val () = (slist := curl_slist_append(slist, s0))
  val () = curl.setopt_slist(CURLOPT_HTTPHEADER, slist);
}

implement {} curl$add_headers2(curl, s0, s1) = slist where
{
  var slist : curl_slist0 //[l:addr] curl_slist(l)
  val () = (slist := curl_slist_append(slist, s0))
  val () = (slist := curl_slist_append1(slist, s1))
  val () = curl.setopt_slist(CURLOPT_HTTPHEADER, slist);
}

implement {} curl$add_headers3(curl, s0, s1, s2) = slist where
{
  var slist : curl_slist0 //[l:addr] curl_slist(l)
  val () = (slist := curl_slist_append(slist, s0))
  val () = (slist := curl_slist_append1(slist, s1))
  val () = (slist := curl_slist_append1(slist, s2))
  val () = curl.setopt_slist(CURLOPT_HTTPHEADER, slist);
}

implement {} curl$add_headers4(curl, s0, s1, s2, s3) = slist where
{
  var slist : curl_slist0 //[l:addr] curl_slist(l)
  val () = (slist := curl_slist_append(slist, s0))
  val () = (slist := curl_slist_append1(slist, s1))
  val () = (slist := curl_slist_append1(slist, s2))
  val () = (slist := curl_slist_append1(slist, s3))
  val () = curl.setopt_slist(CURLOPT_HTTPHEADER, slist);
}

implement {} curl$add_headers5(curl, s0, s1, s2, s3, s4) = slist where
{
  var slist : curl_slist0 //[l:addr] curl_slist(l)
  val () = (slist := curl_slist_append(slist, s0))
  val () = (slist := curl_slist_append1(slist, s1))
  val () = (slist := curl_slist_append1(slist, s2))
  val () = (slist := curl_slist_append1(slist, s3))
  val () = (slist := curl_slist_append1(slist, s4))
  val () = curl.setopt_slist(CURLOPT_HTTPHEADER, slist);
}

implement {} curl$add_headers6(curl, s0, s1, s2, s3, s4, s5) = slist where
{
  var slist : curl_slist0 //[l:addr] curl_slist(l)
  val () = (slist := curl_slist_append(slist, s0))
  val () = (slist := curl_slist_append1(slist, s1))
  val () = (slist := curl_slist_append1(slist, s2))
  val () = (slist := curl_slist_append1(slist, s3))
  val () = (slist := curl_slist_append1(slist, s4))
  val () = (slist := curl_slist_append1(slist, s5))
  val () = curl.setopt_slist(CURLOPT_HTTPHEADER, slist);
}

#symload curl$add_headers with curl$add_headers1
#symload curl$add_headers with curl$add_headers2
#symload curl$add_headers with curl$add_headers3
#symload curl$add_headers with curl$add_headers4
#symload curl$add_headers with curl$add_headers5
#symload curl$add_headers with curl$add_headers6


extern
fun {} curl$headers1(str) : curl_slist1
extern
fun {} curl$headers2(str, str) : curl_slist1
extern
fun {} curl$headers3(str, str, str) : curl_slist1
extern
fun {} curl$headers4(str, str, str, str) : curl_slist1
extern
fun {} curl$headers5(str, str, str, str, str) : curl_slist1
extern
fun {} curl$headers6(str, str, str, str, str, str) : curl_slist1


extern
fun {} curl$global_init() : void
extern
fun curl$$init(): CURLptr1
extern
fun {} curl$cleanup(curl: CURLptr1) : void
extern
fun{} curl$easy_getinfo(curl: !CURLptr1) : void
extern
fun{} curl$the_url() : string
extern
fun{} curl$url(curl: !CURLptr1) : void
extern
fun{} curl$easy_setopt(curl: !CURLptr1) : void
extern
fun {} curl$user_agent() : string
extern
fun {} curl$opt_user_agent(curl: !CURLptr1) : void


implement curl$global_init<>() = curl_global_init_exn(CURL_GLOBAL_SSL)

implement curl$$init() = curl where
{
  val () = curl$global_init<>()
  val curl = curl_easy_init_exn()
}

implement curl$cleanup<>(curl) = () where
{
  val () = curl_easy_cleanup(curl)
  val () = curl_global_cleanup ()
}

implement curl$easy_setopt<>(curl) = () where
{
  val () = curl.setopt(CURLOPT_SSL_VERIFYPEER, 1L)
  val () = curl.setopt(CURLOPT_SSL_VERIFYHOST, 2L)
  (* val () = response_body_outfile(curl, the_stdout()) *)
  (* val () = response_header_outfile(curl, the_stdout()) *)
}

implement curl$easy_getinfo<>(curl) = ()

// default
implement curl$the_url<>() = "http://www.ats-lang.org"

implement {} curl$url(curl) = () where
{
  val url = curl$the_url<>()
  val () = curl.setopt(CURLOPT_URL, url)
}

implement curl$user_agent<>() = "myclient"

implement {} curl$opt_user_agent(curl) = () where
{
  val user_agent = curl$user_agent<>()
  val () = curl.setopt(CURLOPT_USERAGENT, user_agent)
}

extern
fun {} curl$verbose() : bool

implement curl$verbose<>() = true


implement {} curl$opt_user_agent(curl) = () where
{
  val user_agent = curl$user_agent<>()
  val () = curl.setopt(CURLOPT_USERAGENT, user_agent)
}

extern
fun {} curl$verbose() : bool

implement curl$verbose<>() = true


extern fun {} curl$work(!CURLptr1) : curl_slist0

extern fun {} curl$setup(!CURLptr1) : void

// default
implement curl$setup<>(curl) = ()

extern
fun {} curl$slist() : curl_slist0

extern
fun {} curl() : void
implement {} curl() = () where
{

  val curl = curl$$init()

  val () = curl$opt_user_agent<>(curl)

  val () = curl$url<>(curl)

  val () = curl$easy_setopt<>(curl)

  val () = curl$easy_getinfo<>(curl)

  val () = verbose_callback_exn(curl)

  val () = curl$setup<>(curl)

  val err = curl_easy_perform(curl)
  val () = check_curlcode(err)

  val () = curl$cleanup<>(curl)
}


extern
fun {} curl_with_headers() : void
implement {} curl_with_headers() = () where
{

  val curl = curl$$init()

  val () = curl$opt_user_agent<>(curl)

  val () = curl$url<>(curl)

  val () = curl$easy_setopt<>(curl)

  val () = curl$easy_getinfo<>(curl)

  val () = verbose_callback_exn(curl)

  val slist = curl$work<>(curl)

  val err = curl_easy_perform(curl)
  val () = check_curlcode(err)

  val () = curl$cleanup<>(curl)

  val () = assertloc(curl_slist_isneqz(slist))

  val () = curl_slist_free_all(slist)
}


extern
fun {} http$user_agent() : string

extern
fun {} http_get(url: string) : void

extern
fun {} http_post(url: string) : void


implement {} http$user_agent() = "myclient"


implement {} http_get(url) : void = (curl<>()) where
{
  implement curl$user_agent<>() = http$user_agent<>()
  implement curl$the_url<>() = url
}


implement {} http_post(url) : void = (curl_with_headers<>()) where
{
  implement curl$user_agent<>() = http$user_agent<>()
  implement curl$the_url<>() = url
}

#define query "{\"query\": \"{ \
search(first: 100, query: \\\"language:ATS\\\", type: REPOSITORY) { \
repositoryCount nodes { ... on Repository { nameWithOwner } } } }\"}"


implement main0() =
{
  val graphQL = "https://api.github.com/graphql"

  #define TOKE "HEY"
  implement curl$work<>(curl) = slist where
  {
    val content = "Content-Type: application/json"


    val () = assertloc(false)

    // INSERT HERE and remove above assertion

    val auth0 = "Authorization: bearer *PUT GITHUB PERSONAL ACCESS TOKEN HERE*"

    val slist = curl$add_headers(curl, content, auth0)

    val data = query

    val () = curl.setopt(CURLOPT_POSTFIELDS, data)

    val () = curl.setopt(CURLOPT_POST, 1L)
  }

  val () = http_post<>(graphQL)
  val () = println!()
}
