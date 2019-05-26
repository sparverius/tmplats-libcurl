/***********************************************************************/
/*                                                                     */
/*                         Applied Type System                         */
/*                                                                     */
/***********************************************************************/

/* (*
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
*) */

/* ****** ****** */

/*
(* Author: Hongwei Xi *)
(* Authoremail: gmhwxiATgmailDOTcom *)
(* Start time: September, 2013 *)
*/

/* ****** ****** */

#ifndef LIBCURL_CURL_CATS
#define LIBCURL_CURL_CATS

/* ****** ****** */

#include <curl/curl.h>

/* ****** ****** */

#define \
tmplats_curl_curl_version curl_version

/* ****** ****** */

#define \
tmplats_curl_CURLptr_is_null(p) (p == 0)
#define \
tmplats_curl_CURLptr_isnot_null(p) (p != 0)


#define \
tmplats_curl_eq_CURLcode_CURLcode temptory_g0eq_sint_sint
#define \
tmplats_curl_eq_CURLerror_CURLcode temptory_g0eq_sint_sint

/* ****** ****** */

#define \
tmplats_curl_neq_CURLcode_CURLcode temptory_g0neq_sint_sint
#define \
tmplats_curl_neq_CURLerror_CURLcode temptory_g0neq_sint_sint

/* ****** ****** */

/*
CURLcode curl_global_init(long flags);
void curl_global_cleanup(void);
*/

#define \
tmplats_curl_curl_global_init curl_global_init
#define \
tmplats_curl_curl_global_cleanup curl_global_cleanup

/* ****** ****** */

/*
CURL *curl_easy_init();
CURLcode curl_easy_setopt(CURL *curl, CURLoption option, ...);
CURLcode curl_easy_perform(CURL *curl);
*/

#define \
tmplats_curl_curl_easy_init curl_easy_init
#define \
tmplats_curl_curl_easy_setopt curl_easy_setopt
#define \
tmplats_curl_curl_easy_perform curl_easy_perform
#define \
tmplats_curl_curl_easy_cleanup curl_easy_cleanup

/* ****** ****** */

/*
CURLcode
curl_easy_recv
(CURL *curl, void *buffer, usize buflen, usize *n);

CURLcode
curl_easy_send
(CURL *curl , const void * buffer , size_t buflen , size_t *n);
*/

#define \
tmplats_curl_curl_easy_recv curl_easy_recv
#define \
tmplats_curl_curl_easy_send curl_easy_send

/* ****** ****** */

/*
CURL* curl_easy_duphandle(CURL *curl);
*/

#define \
tmplats_curl_curl_easy_duphandle curl_easy_duphandle

/* ****** ****** */

/*
void curl_easy_reset(CURL *curl);
*/

#define \
tmplats_curl_curl_easy_reset curl_easy_reset

/* ****** ****** */

/*
CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ...);
*/

#define tmplats_curl_curl_easy_getinfo curl_easy_getinfo

/* ****** ****** */

/*
const char *curl_easy_strerror(CURLcode);
*/

#define \
tmplats_curl_curl_easy_strerror(err) ((char*)(curl_easy_strerror(err)))

/* ****** ****** */

#define ATSLIBfailexit(cmd)						\
	do {								\
		fprintf(stderr, "exit(ATSLIB): [%s] failed\n", cmd);	\
		exit(1);						\
	} while (0)

extern void exit(int status); // in [stdlib.h]


ATSinline()
CURL *tmplats_curl_curl_easy_init_exn()
{
	CURL * res;

	res = curl_easy_init();
	if (!res)
		ATSLIBfailexit("curl_easy_init");

	return res;
}

#include <stdarg.h>


static void show_curl_error(CURLcode err, const char *msg)
{
	const char * errmsg;
	errmsg = curl_easy_strerror(err);
	fprintf(stderr, "curl(ERROR): %s\n", errmsg);
	ATSLIBfailexit(msg);
}

static void show_curl_error_free(CURL *curl, CURLcode err, const char *msg)
{
	show_curl_error(err, msg);
	curl_easy_cleanup(curl);
	ATSLIBfailexit(msg);
}

static void show_curl_error_free_slist(CURL *curl, CURLcode err
				       , struct curl_slist *lst
				       , const char *msg)
{
	show_curl_error(err, msg);
	curl_easy_cleanup(curl);
        curl_slist_free_all(lst);
	ATSLIBfailexit(msg);
}


ATSinline()
atstype_void
tmplats_curl_curl_easy_setopt_C_exn(CURL *curl, CURLoption opt1, ...)
{
	va_list arg;
	void *paramp;
	CURLcode res;

	va_start(arg, opt1);
	paramp = va_arg(arg, void *);

	res = curl_easy_setopt(curl, opt1, paramp);
	va_end(arg);

	if (res != CURLE_OK)
		show_curl_error_free(curl, res, "curl_easy_setopt_C_exn");

	return ;
}


ATSinline()
atstype_void
tmplats_curl_curl_easy_perform_exn(CURL *curl)
{
	CURLcode res;

	res = curl_easy_perform(curl);

	if (res != CURLE_OK)
		show_curl_error_free(curl, res, "curl_easy_perform_exn");

	return ;
}

ATSinline()
atstype_void
tmplats_curl_curl_global_init_exn(long flags)
{
	CURLcode res;

	res = curl_global_init(flags);

	if (res != CURLE_OK)
		show_curl_error(res, "curl_global_init_exn");

	return ;
}


#define curl_easy_setopt_fileptr(curl, opt, fileptr)			  \
	do {(CURLcode)							  \
	curl_easy_setopt((CURL *)curl, (CURLoption)opt, (FILE *)fileptr); \
	} while(0)

#define curl_easy_setopt_off_t(curl, opt, offt)				\
	do {(CURLcode)							\
	curl_easy_setopt((CURL *)curl, (CURLoption)opt, (off_t)offt);   \
	} while(0)

#define curl_easy_setopt_long(curl, opt, lint)				\
	do {(CURLcode)							\
	curl_easy_setopt((CURL *)curl, (CURLoption)opt, (long)lint);    \
	} while(0)

#define curl_easy_setopt_string(curl, opt, str)				\
	do {(CURLcode)							\
	curl_easy_setopt((CURL *)curl, (CURLoption)opt, (char *)str);   \
	} while(0)


/*
static size_t
write_callbak(void *contents, size_t size, size_t nmemb, void *userp);
static size_t
read_callback(void *dest, size_t size, size_t nmemb, void *userp);
*/

//void(*)(*fun)
/* typedef void (*printer_t)(int); */

typedef size_t (*callback)(void *, size_t, size_t, void *);

#define curl_easy_setopt_callback(curl, opt, fn)			\
  do {									\
    curl_easy_setopt((CURL *)curl, (CURLoption)opt, (callback)fn);	\
  } while(0);


/*
(*
#include <stdio.h>
CURL_EXTERN void curl_slist_free_all(struct curl_slist * );


CURL_EXTERN struct curl_slist *curl_slist_append(struct curl_slist *,
                                                 const char * );
*)
*/

typedef struct curl_slist tmplats_curl_struct_curl_slist;

ATSinline()
atstype_bool
tmplats_curl_curl_slist_isneqz(struct curl_slist *lst)
{
  return (lst != (void*)0);
}

#define \
tmplats_curl_curl_slist_append curl_slist_append
#define \
tmplats_curl_curl_slist_free_all curl_slist_free_all


ATSinline()
atstype_void
tmplats_curl_curl_slist_free_typehack(CURL *curl)
{
	if (curl != (void*)0)
		curl_slist_free_all(curl);
	return;
}





ATSinline()
atstype_void
tmplats_curl_curl_easy_setopt_slist_exn(CURL *curl, CURLoption opt,
  struct curl_slist *lst)
{
	CURLcode res;

	res = curl_easy_setopt(curl, opt, lst);

	if (res != CURLE_OK)
		show_curl_error_free_slist(curl, res, lst
					   , "curl_easy_setopt_slist_exn");
	return ;
}

/*
 * https://curl.haxx.se/libcurl/c/CURLOPT_DEBUGFUNCTION.html
 */
static
void dump(const char *text, FILE *stream, unsigned char *ptr, size_t size)
{
  size_t i;
  size_t c;
  unsigned int width=0x10;

  fprintf(stream, "%s, %10.10ld bytes (0x%8.8lx)\n",
          text, (long)size, (long)size);

  for(i=0; i<size; i+= width) {
    fprintf(stream, "%4.4lx: ", (long)i);

    /* show hex to the left */
    for(c = 0; c < width; c++) {
      if(i+c < size)
        fprintf(stream, "%02x ", ptr[i+c]);
      else
        fputs("   ", stream);
    }

    /* show data on the right */
    for(c = 0; (c < width) && (i+c < size); c++) {
      char x = (ptr[i+c] >= 0x20 && ptr[i+c] < 0x80) ? ptr[i+c] : '.';
      fputc(x, stream);
    }

    fputc('\n', stream); /* newline */
  }
}

static
int my_trace(CURL *handle, curl_infotype type,
             char *data, size_t size,
             void *userp)
{
  const char *text;
  (void)handle; /* prevent compiler warning */
  (void)userp;

  switch (type) {
  case CURLINFO_TEXT:
    fprintf(stderr, "== Info: %s", data);
  default: /* in case a new one is introduced to shock us */
    return 0;

  case CURLINFO_HEADER_OUT:
    text = "=> Send header";
    fprintf(stderr, "%s : %s\n", text, data);
    break;
  case CURLINFO_DATA_OUT:
    text = "=> Send data";
    fprintf(stderr, "%s : %s\n", text, data);
    break;
  case CURLINFO_SSL_DATA_OUT:
    text = "=> Send SSL data";
    // fprintf(stderr, "%s : \n%s\n", text, data);
    break;
  case CURLINFO_HEADER_IN:
    text = "<= Recv header";
    fprintf(stderr, "%s : %s", text, data);
    break;
  case CURLINFO_DATA_IN:
    text = "<= Recv data";
    fprintf(stderr, "\n%s : %s\n", text, data);
    break;
  case CURLINFO_SSL_DATA_IN:
    text = "<= Recv SSL data";
    // fprintf(stderr, "%s : \n%s\n", text, data);
    break;
  }
  //dump(text, stderr, (unsigned char *)data, size);
  return 0;
}



ATSinline()
atstype_void
tmplats_curl_verbose_callback_exn(CURL *curl)
{
	CURLcode res;

	res = curl_easy_setopt(curl, CURLOPT_DEBUGFUNCTION, my_trace);

	if (res != CURLE_OK)
		show_curl_error_free(curl, res, "verbose_callback");
	return ;
}


/*
int main(void)
{
CURL *curl;
CURLcode res;

curl = curl_easy_init();
if(curl) {
curl_easy_setopt(curl, CURLOPT_DEBUGFUNCTION, my_trace);

/\* the DEBUGFUNCTION has no effect until we enable VERBOSE *\/
curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);

/\* example.com is redirected, so we tell libcurl to follow redirection *\/
curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);

curl_easy_setopt(curl, CURLOPT_URL, "http://example.com/");
res = curl_easy_perform(curl);
/\* Check for errors *\/
if(res != CURLE_OK)
fprintf(stderr, "curl_easy_perform() failed: %s\n",
curl_easy_strerror(res));

/\* always cleanup *\/
curl_easy_cleanup(curl);
}
return 0;
}
*/

#endif

/* ****** ****** */

/* end of [curl.cats] */
