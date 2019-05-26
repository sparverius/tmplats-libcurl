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
** Start time: September, 2013
** Authoremail: gmhwxiATgmailDOTcom
*)

(* ****** ****** *)

%{#
#include "tmplats-libcurl/CATS/curl.cats"
%}

(* ****** ****** *)
//
#define
ATS_PACKNAME "TMPLATS.curl"
#define
ATS_EXTERN_PREFIX "tmplats_curl_" // prefix for external names
//
(* ****** ****** *)
//
fun
curl_version(): string = "mac#%"
//
(* ****** ****** *)

absvtbox CURLptr_vtype(l:addr) = ptr

(* ****** ****** *)
//
vtypedef
CURLptr(l:addr) = CURLptr_vtype(l)
vtypedef
CURLptr0 = [l:agez] CURLptr_vtype(l)
vtypedef
CURLptr1 = [l:addr | l > null] CURLptr_vtype(l)
//
(* ****** ****** *)
//

fun // macro
CURLptr_is_null{l:addr}(filp: !CURLptr(l)):<> bool(l == null) = "mac#%"
fun // macro
CURLptr_isnot_null{l:addr}(filp: !CURLptr(l)):<> bool(l != null) = "mac#%"
//
#symload iseqz with CURLptr_is_null
#symload isneqz with CURLptr_isnot_null




castfn
CURLptr2ptr
  {l:addr}(curl: !CURLptr(l)):<> ptr(l)
//
#symload ptrcast with CURLptr2ptr
//
(* ****** ****** *)
//
abstflt CURLcode = $extype"CURLcode"
abstflt CURLerror = $extype"CURLcode"
//
(* ****** ****** *)
//
castfn
CURLerror2code(err: CURLerror):<> CURLcode
//
(* ****** ****** *)
//
fun
eq_CURLcode_CURLcode
  (CURLcode, CURLcode):<> bool = "mac#%"
fun
neq_CURLcode_CURLcode
  (CURLcode, CURLcode):<> bool = "mac#%"
//
#symload = with eq_CURLcode_CURLcode
#symload != with neq_CURLcode_CURLcode
//
fun
eq_CURLerror_CURLcode
  (CURLerror, CURLcode):<> bool = "mac#%"
fun
neq_CURLerror_CURLcode
  (CURLerror, CURLcode):<> bool = "mac#%"
//
#symload = with eq_CURLerror_CURLcode
#symload != with neq_CURLerror_CURLcode
//
(* ****** ****** *)

#macdef
CURLE_OK = $extval(CURLcode, "CURLE_OK")

(* ****** ****** *)
//
typedef CURL = lint
//
#macdef
CURL_GLOBAL_ALL = $extval(CURL, "CURL_GLOBAL_ALL")
#macdef
CURL_GLOBAL_SSL = $extval(CURL, "CURL_GLOBAL_SSL")
#macdef
CURL_GLOBAL_WIN32 = $extval(CURL, "CURL_GLOBAL_WIN32")
//
(* ****** ****** *)
//
abstflt CURLOPT = int//$extype"CURLOPT"
abstflt CURLINFO = $extype"CURLINFO"
//
(* ****** ****** *)
//
(*
(*
BEHAVIOR OPTIONS
*)
CURLOPT_VERBOSE

//include the header in the body output.
CURLOPT_HEADER

//Shut off the progress meter.
CURLOPT_NOPROGRESS

//Do not install signal handlers.
CURLOPT_NOSIGNAL

//Transfer multiple files according to a file name pattern
CURLOPT_WILDCARDMATCH

(*
CALLBACK OPTIONS
*)

//Callback for writing data.
CURLOPT_WRITEFUNCTION

// Data pointer to pass to the write callback.
CURLOPT_WRITEDATA

// Callback for reading data.
CURLOPT_READFUNCTION

// Data pointer to pass to the read callback.
CURLOPT_READDATA

// Callback for I/O operations.
CURLOPT_IOCTLFUNCTION

// Data pointer to pass to the I/O callback.
CURLOPT_IOCTLDATA

// Callback for seek operations.
CURLOPT_SEEKFUNCTION

// Data pointer to pass to the seek callback.
CURLOPT_SEEKDATA

// Callback for sockopt operations.
CURLOPT_SOCKOPTFUNCTION

// Data pointer to pass to the sockopt callback.
CURLOPT_SOCKOPTDATA

// Callback for socket creation.
CURLOPT_OPENSOCKETFUNCTION

// Data pointer to pass to the open socket callback.
CURLOPT_OPENSOCKETDATA

// Callback for closing socket.
CURLOPT_CLOSESOCKETFUNCTION

// Data pointer to pass to the close socket callback.
CURLOPT_CLOSESOCKETDATA

// OBSOLETE callback for progress meter.
CURLOPT_PROGRESSFUNCTION

// Data pointer to pass to the progress meter callback.
CURLOPT_PROGRESSDATA

// Callback for progress meter.
CURLOPT_XFERINFOFUNCTION

// Data pointer to pass to the progress meter callback.
CURLOPT_XFERINFODATA

// Callback for writing received headers.
CURLOPT_HEADERFUNCTION

// Data pointer to pass to the header callback.
CURLOPT_HEADERDATA

// Callback for debug information.
CURLOPT_DEBUGFUNCTION

// Data pointer to pass to the debug callback.
CURLOPT_DEBUGDATA

// Callback for SSL context logic.
CURLOPT_SSL_CTX_FUNCTION

// Data pointer to pass to the SSL context callback.
CURLOPT_SSL_CTX_DATA

// Callback for code base conversion.
CURLOPT_CONV_TO_NETWORK_FUNCTION

// Callback for code base conversion.
CURLOPT_CONV_FROM_NETWORK_FUNCTION

// Callback for code base conversion.
CURLOPT_CONV_FROM_UTF8_FUNCTION

// Callback for RTSP interleaved data.
CURLOPT_INTERLEAVEFUNCTION

// Data pointer to pass to the RTSP interleave callback.
CURLOPT_INTERLEAVEDATA

// Callback for wildcard download start of chunk.
CURLOPT_CHUNK_BGN_FUNCTION

// Callback for wildcard download end of chunk.
CURLOPT_CHUNK_END_FUNCTION

// Data pointer to pass to the chunk callbacks.
CURLOPT_CHUNK_DATA

// Callback for wildcard matching.
CURLOPT_FNMATCH_FUNCTION

// Data pointer to pass to the wildcard matching callback.
CURLOPT_FNMATCH_DATA

// Suppress proxy CONNECT response headers from user callbacks.
CURLOPT_SUPPRESS_CONNECT_HEADERS

// Callback to be called before a new resolve request is started.
CURLOPT_RESOLVER_START_FUNCTION

// Data pointer to pass to resolver start callback.
CURLOPT_RESOLVER_START_DATA

ERROR OPTIONS
// Error message buffer.
CURLOPT_ERRORBUFFER

// stderr replacement stream.
CURLOPT_STDERR

// Fail on HTTP 4xx errors.
CURLOPT_FAILONERROR

// Keep sending on HTTP >= 300 errors.
CURLOPT_KEEP_SENDING_ON_ERROR


(*
NETWORK OPTIONS
*)


// URL to work on.
CURLOPT_URL

// Disable squashing /../ and /./ sequences in the path.
CURLOPT_PATH_AS_IS

// Allowed protocols.
CURLOPT_PROTOCOLS

// Protocols to allow redirects to.
CURLOPT_REDIR_PROTOCOLS

// Default protocol.
CURLOPT_DEFAULT_PROTOCOL

// Proxy to use.
CURLOPT_PROXY

// Socks proxy to use.
CURLOPT_PRE_PROXY

// Proxy port to use.
CURLOPT_PROXYPORT

// Proxy type.
CURLOPT_PROXYTYPE

// Filter out hosts from proxy use.
CURLOPT_NOPROXY

// Tunnel through the HTTP proxy.
CURLOPT_HTTPPROXYTUNNEL

// Connect to a specific host and port.
CURLOPT_CONNECT_TO

// Socks5 authentication methods.
CURLOPT_SOCKS5_AUTH

// Socks5 GSSAPI service name.
CURLOPT_SOCKS5_GSSAPI_SERVICE

// Socks5 GSSAPI NEC mode.
CURLOPT_SOCKS5_GSSAPI_NEC

// Proxy authentication service name.
CURLOPT_PROXY_SERVICE_NAME

// Send an HAProxy PROXY protocol v1 header.
CURLOPT_HAPROXYPROTOCOL

// Authentication service name.
CURLOPT_SERVICE_NAME

// Bind connection locally to this.
CURLOPT_INTERFACE

// Bind connection locally to this port.
CURLOPT_LOCALPORT

// Bind connection locally to port range.
CURLOPT_LOCALPORTRANGE

// Timeout for DNS cache.
CURLOPT_DNS_CACHE_TIMEOUT

// OBSOLETE Enable global DNS cache.
CURLOPT_DNS_USE_GLOBAL_CACHE

// Use this DOH server for name resolves.
CURLOPT_DOH_URL

// Ask for alternate buffer size.
CURLOPT_BUFFERSIZE

// Port number to connect to.
CURLOPT_PORT

// Enable TFO, TCP Fast Open.
CURLOPT_TCP_FASTOPEN

// Disable the Nagle algorithm.
CURLOPT_TCP_NODELAY

// IPv6 scope for local addresses.
CURLOPT_ADDRESS_SCOPE

// Enable TCP keep-alive.
CURLOPT_TCP_KEEPALIVE

// Idle time before sending keep-alive.
CURLOPT_TCP_KEEPIDLE

// Interval between keep-alive probes.
CURLOPT_TCP_KEEPINTVL

// Path to a Unix domain socket.
CURLOPT_UNIX_SOCKET_PATH

// Path to an abstract Unix domain socket.
CURLOPT_ABSTRACT_UNIX_SOCKET

(*
NAMES and PASSWORDS OPTIONS (Authentication)
*)

// Enable .netrc parsing.
CURLOPT_NETRC

// .netrc file name.
CURLOPT_NETRC_FILE

// User name and password.
CURLOPT_USERPWD

// Proxy user name and password.
CURLOPT_PROXYUSERPWD

// User name.
CURLOPT_USERNAME

// Password.
CURLOPT_PASSWORD

// Login options.
CURLOPT_LOGIN_OPTIONS

// Proxy user name.
CURLOPT_PROXYUSERNAME

// Proxy password.
CURLOPT_PROXYPASSWORD

// HTTP server authentication methods.
CURLOPT_HTTPAUTH

// TLS authentication user name.
CURLOPT_TLSAUTH_USERNAME

// Proxy TLS authentication user name.
CURLOPT_PROXY_TLSAUTH_USERNAME

// TLS authentication password.
CURLOPT_TLSAUTH_PASSWORD

// Proxy TLS authentication password.
CURLOPT_PROXY_TLSAUTH_PASSWORD

// TLS authentication methods.
CURLOPT_TLSAUTH_TYPE

// Proxy TLS authentication methods.
CURLOPT_PROXY_TLSAUTH_TYPE

// HTTP proxy authentication methods.
CURLOPT_PROXYAUTH

// Enable SASL initial response.
CURLOPT_SASL_IR

// OAuth2 bearer token.
CURLOPT_XOAUTH2_BEARER

// Don't allow username in URL.
CURLOPT_DISALLOW_USERNAME_IN_URL

(*
HTTP OPTIONS
*)

// Automatically set Referer: header.
CURLOPT_AUTOREFERER

// Accept-Encoding and automatic decompressing data.
CURLOPT_ACCEPT_ENCODING

// Request Transfer-Encoding.
CURLOPT_TRANSFER_ENCODING

// Follow HTTP redirects.
CURLOPT_FOLLOWLOCATION

// Do not restrict authentication to original host.
CURLOPT_UNRESTRICTED_AUTH

// Maximum number of redirects to follow.
CURLOPT_MAXREDIRS

// How to act on redirects after POST.
CURLOPT_POSTREDIR

// Issue an HTTP PUT request.
CURLOPT_PUT

// Issue an HTTP POST request.
CURLOPT_POST

// Send a POST with this data.
CURLOPT_POSTFIELDS

// The POST data is this big.
CURLOPT_POSTFIELDSIZE

// The POST data is this big.
CURLOPT_POSTFIELDSIZE_LARGE

// Send a POST with this data - and copy it.
CURLOPT_COPYPOSTFIELDS

// Multipart formpost HTTP POST.
CURLOPT_HTTPPOST

// Referer: header.
CURLOPT_REFERER

// User-Agent: header.
CURLOPT_USERAGENT

// Custom HTTP headers.
CURLOPT_HTTPHEADER

// Control custom headers.
CURLOPT_HEADEROPT

// Custom HTTP headers sent to proxy.
CURLOPT_PROXYHEADER

// Alternative versions of 200 OK.
CURLOPT_HTTP200ALIASES

// Cookie(s) to send.
CURLOPT_COOKIE

// File to read cookies from.
CURLOPT_COOKIEFILE

// File to write cookies to.
CURLOPT_COOKIEJAR

// Start a new cookie session.
CURLOPT_COOKIESESSION

// Add or control cookies.
CURLOPT_COOKIELIST

// Specify the Alt-Svc: cache file name.
CURLOPT_ALTSVC

// Enable and configure Alt-Svc: treatment.
CURLOPT_ALTSVC_CTRL

// Do an HTTP GET request.
CURLOPT_HTTPGET

// Set the request target.
CURLOPT_REQUEST_TARGET

// HTTP version to use.
CURLOPT_HTTP_VERSION

// Allow HTTP/0.
CURLOPT_HTTP09_ALLOWED

// Ignore Content-Length.
CURLOPT_IGNORE_CONTENT_LENGTH

// Disable Content decoding.
CURLOPT_HTTP_CONTENT_DECODING

// Disable Transfer decoding.
CURLOPT_HTTP_TRANSFER_DECODING

// 100-continue timeout.
CURLOPT_EXPECT_100_TIMEOUT_MS

// Set callback for sending trailing headers.
CURLOPT_TRAILERFUNCTION

// Custom pointer passed to the trailing headers callback.
CURLOPT_TRAILERDATA

// Wait on connection to pipeline on it.
CURLOPT_PIPEWAIT

// This HTTP/2 stream depends on another.
CURLOPT_STREAM_DEPENDS

// This HTTP/2 stream depends on another exclusively.
CURLOPT_STREAM_DEPENDS_E

// Set this HTTP/2 stream's weight.
CURLOPT_STREAM_WEIGHT

(*
SMTP OPTIONS
*)

// Address of the sender.
CURLOPT_MAIL_FROM

// Address of the recipients.
CURLOPT_MAIL_RCPT

// Authentication address.
CURLOPT_MAIL_AUTH

(*
TFTP OPTIONS
*)

// TFTP block size.
CURLOPT_TFTP_BLKSIZE

// Do not send TFTP options requests.
CURLOPT_TFTP_NO_OPTIONS

FTP OPTIONS
// Use active FTP.
CURLOPT_FTPPORT

// Commands to run before transfer.
CURLOPT_QUOTE

// Commands to run after transfer.
CURLOPT_POSTQUOTE

// Commands to run just before transfer.
CURLOPT_PREQUOTE

// Append to remote file.
CURLOPT_APPEND

// Use EPTR.
CURLOPT_FTP_USE_EPRT

// Use EPSV.
CURLOPT_FTP_USE_EPSV

// Use PRET.
CURLOPT_FTP_USE_PRET

// Create missing directories on the remote server.
CURLOPT_FTP_CREATE_MISSING_DIRS

// Timeout for FTP responses.
CURLOPT_FTP_RESPONSE_TIMEOUT

// Alternative to USER.
CURLOPT_FTP_ALTERNATIVE_TO_USER

// Ignore the IP address in the PASV response.
CURLOPT_FTP_SKIP_PASV_IP

// Control how to do TLS.
CURLOPT_FTPSSLAUTH

// Back to non-TLS again after authentication.
CURLOPT_FTP_SSL_CCC

// Send ACCT command.
CURLOPT_FTP_ACCOUNT

// Specify how to reach files.
CURLOPT_FTP_FILEMETHOD

(*
RTSP OPTIONS
*)

// RTSP request.
CURLOPT_RTSP_REQUEST

// RTSP session-id.
CURLOPT_RTSP_SESSION_ID

// RTSP stream URI.
CURLOPT_RTSP_STREAM_URI

// RTSP Transport: header.
CURLOPT_RTSP_TRANSPORT

// Client CSEQ number.
CURLOPT_RTSP_CLIENT_CSEQ

// CSEQ number for RTSP Server->Client request.
CURLOPT_RTSP_SERVER_CSEQ


(*
PROTOCOL OPTIONS
*)

// Use text transfer.
CURLOPT_TRANSFERTEXT

// Add transfer mode to URL over proxy.
CURLOPT_PROXY_TRANSFER_MODE

// Convert newlines.
CURLOPT_CRLF

// Range requests.
CURLOPT_RANGE

// Resume a transfer.
CURLOPT_RESUME_FROM

// Resume a transfer.
CURLOPT_RESUME_FROM_LARGE

// Set URL to work on with CURLU *.
CURLOPT_CURLU

// Custom request/method.
CURLOPT_CUSTOMREQUEST

// Request file modification date and time.
CURLOPT_FILETIME

// List only.
CURLOPT_DIRLISTONLY

// Do not get the body contents.
CURLOPT_NOBODY

// Size of file to send.
CURLOPT_INFILESIZE

// Size of file to send.
CURLOPT_INFILESIZE_LARGE

// Upload data.
CURLOPT_UPLOAD

// Set upload buffer size.
CURLOPT_UPLOAD_BUFFERSIZE

// Post/send MIME data.
CURLOPT_MIMEPOST

// Maximum file size to get.
CURLOPT_MAXFILESIZE

// Maximum file size to get.
CURLOPT_MAXFILESIZE_LARGE

// Make a time conditional request.
CURLOPT_TIMECONDITION

// Time value for the time conditional request.
CURLOPT_TIMEVALUE

// Time value for the time conditional request.
CURLOPT_TIMEVALUE_LARGE


(*
CONNECTION OPTIONS
*)


// Timeout for the entire request.
CURLOPT_TIMEOUT

// Millisecond timeout for the entire request.
CURLOPT_TIMEOUT_MS

// Low speed limit to abort transfer.
CURLOPT_LOW_SPEED_LIMIT

// Time to be below the speed to trigger low speed abort.
CURLOPT_LOW_SPEED_TIME

// Cap the upload speed to this.
CURLOPT_MAX_SEND_SPEED_LARGE

// Cap the download speed to this.
CURLOPT_MAX_RECV_SPEED_LARGE

// Maximum number of connections in the connection pool.
CURLOPT_MAXCONNECTS

// Use a new connection.
CURLOPT_FRESH_CONNECT

// Prevent subsequent connections from re-using this.
CURLOPT_FORBID_REUSE

// Limit the age of connections for reuse.
CURLOPT_MAXAGE_CONN

// Timeout for the connection phase.
CURLOPT_CONNECTTIMEOUT

// Millisecond timeout for the connection phase.
CURLOPT_CONNECTTIMEOUT_MS

// IP version to resolve to.
CURLOPT_IPRESOLVE

// Only connect, nothing else.
CURLOPT_CONNECT_ONLY

// Use TLS/SSL.
CURLOPT_USE_SSL

// Provide fixed/fake name resolves.
CURLOPT_RESOLVE

// Bind name resolves to this interface.
CURLOPT_DNS_INTERFACE

// Bind name resolves to this IP4 address.
CURLOPT_DNS_LOCAL_IP4

// Bind name resolves to this IP6 address.
CURLOPT_DNS_LOCAL_IP6

// Preferred DNS servers.
CURLOPT_DNS_SERVERS

// Shuffle addresses before use.
CURLOPT_DNS_SHUFFLE_ADDRESSES

// Timeout for waiting for the server's connect back to be accepted.
CURLOPT_ACCEPTTIMEOUT_MS

// Timeout for happy eyeballs.
CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS

// Sets the interval at which connection upkeep are performed.
CURLOPT_UPKEEP_INTERVAL_MS

(*
SSL and SECURITY OPTIONS
*)

// Client cert.
CURLOPT_SSLCERT

// Proxy client cert.
CURLOPT_PROXY_SSLCERT

// Client cert type.
CURLOPT_SSLCERTTYPE

// Proxy client cert type.
CURLOPT_PROXY_SSLCERTTYPE

// Client key.
CURLOPT_SSLKEY

// Proxy client key.
CURLOPT_PROXY_SSLKEY

// Client key type.
CURLOPT_SSLKEYTYPE

// Proxy client key type.
CURLOPT_PROXY_SSLKEYTYPE

// Client key password.
CURLOPT_KEYPASSWD

// Proxy client key password.
CURLOPT_PROXY_KEYPASSWD

// Enable use of ALPN.
CURLOPT_SSL_ENABLE_ALPN

// Enable use of NPN.
CURLOPT_SSL_ENABLE_NPN

// Use identifier with SSL engine.
CURLOPT_SSLENGINE

// Default SSL engine.
CURLOPT_SSLENGINE_DEFAULT

// Enable TLS False Start.
CURLOPT_SSL_FALSESTART

// SSL version to use.
CURLOPT_SSLVERSION

// Proxy SSL version to use.
CURLOPT_PROXY_SSLVERSION

// Verify the host name in the SSL certificate.
CURLOPT_SSL_VERIFYHOST

// Verify the host name in the proxy SSL certificate.
CURLOPT_PROXY_SSL_VERIFYHOST

// Verify the SSL certificate.
CURLOPT_SSL_VERIFYPEER

// Verify the proxy SSL certificate.
CURLOPT_PROXY_SSL_VERIFYPEER

// Verify the SSL certificate's status.
CURLOPT_SSL_VERIFYSTATUS

// CA cert bundle.
CURLOPT_CAINFO

// Proxy CA cert bundle.
CURLOPT_PROXY_CAINFO

// Issuer certificate.
CURLOPT_ISSUERCERT

// Path to CA cert bundle.
CURLOPT_CAPATH

// Path to proxy CA cert bundle.
CURLOPT_PROXY_CAPATH

// Certificate Revocation List.
CURLOPT_CRLFILE

// Proxy Certificate Revocation List.
CURLOPT_PROXY_CRLFILE

// Extract certificate info.
CURLOPT_CERTINFO

// Set pinned SSL public key .
CURLOPT_PINNEDPUBLICKEY

// Set the proxy's pinned SSL public key.
CURLOPT_PROXY_PINNEDPUBLICKEY

// Provide source for entropy random data.
CURLOPT_RANDOM_FILE

// Identify EGD socket for entropy.
CURLOPT_EGDSOCKET

// Ciphers to use.
CURLOPT_SSL_CIPHER_LIST

// Proxy ciphers to use.
CURLOPT_PROXY_SSL_CIPHER_LIST

// TLS 1.3 cipher suites to use.
CURLOPT_TLS13_CIPHERS

// Proxy TLS 1.3 cipher suites to use.
CURLOPT_PROXY_TLS13_CIPHERS

// Disable SSL session-id cache.
CURLOPT_SSL_SESSIONID_CACHE

// Control SSL behavior.
CURLOPT_SSL_OPTIONS

// Control proxy SSL behavior.
CURLOPT_PROXY_SSL_OPTIONS

// Kerberos security level.
CURLOPT_KRBLEVEL

// Disable GSS-API delegation.
CURLOPT_GSSAPI_DELEGATION

(*
SSH OPTIONS
*)

// SSH authentication types.
CURLOPT_SSH_AUTH_TYPES

// Enable SSH compression.
CURLOPT_SSH_COMPRESSION

// MD5 of host's public key.
CURLOPT_SSH_HOST_PUBLIC_KEY_MD5

// File name of public key.
CURLOPT_SSH_PUBLIC_KEYFILE

// File name of private key.
CURLOPT_SSH_PRIVATE_KEYFILE

// File name with known hosts.
CURLOPT_SSH_KNOWNHOSTS

// Callback for known hosts handling.
CURLOPT_SSH_KEYFUNCTION

// Custom pointer to pass to ssh key callback.
CURLOPT_SSH_KEYDATA

(*
OTHER OPTIONS
*)

// Private pointer to store.
CURLOPT_PRIVATE

// Share object to use.
CURLOPT_SHARE

// Mode for creating new remote files.
CURLOPT_NEW_FILE_PERMS

// Mode for creating new remote directories.
CURLOPT_NEW_DIRECTORY_PERMS
*)



#macdef
CURLOPT_URL	       = $extval(CURLOPT, "CURLOPT_URL")	// 2
#macdef
CURLOPT_FILE	       = $extval(CURLOPT, "CURLOPT_FILE")	// 1
#macdef
CURLOPT_PORT	       = $extval(CURLOPT, "CURLOPT_PORT")	// 3
#macdef
CURLOPT_PROXY	       = $extval(CURLOPT, "CURLOPT_PROXY")	// 4
#macdef
CURLOPT_USERPWD	       = $extval(CURLOPT, "CURLOPT_USERPWD")	// 5
#macdef
CURLOPT_PROXYUSERPWD   = $extval(CURLOPT, "CURLOPT_PROXYUSERPWD")	// 6
#macdef
CURLOPT_RANGE	       = $extval(CURLOPT, "CURLOPT_RANGE")	// 7
// HX: [8] is not used
#macdef
CURLOPT_INFILE	       = $extval(CURLOPT, "CURLOPT_INFILE")	// 9
#macdef
CURLOPT_ERRORBUFFER    = $extval(CURLOPT, "CURLOPT_ERRORBUFFER")	// 10
#macdef
CURLOPT_WRITEFUNCTION  = $extval(CURLOPT, "CURLOPT_WRITEFUNCTION")	// 11
#macdef
CURLOPT_READFUNCTION   = $extval(CURLOPT, "CURLOPT_READFUNCTION")	// 12
#macdef
CURLOPT_TIMEOUT	       = $extval(CURLOPT, "CURLOPT_TIMEOUT")	// 13
#macdef
CURLOPT_INFILESIZE     = $extval(CURLOPT, "CURLOPT_INFILESIZE")	// 14
#macdef
CURLOPT_POSTFIELDS     = $extval(CURLOPT, "CURLOPT_POSTFIELDS")	// 15
#macdef
CURLOPT_REFERER	       = $extval(CURLOPT, "CURLOPT_REFERER")	// 16
#macdef
CURLOPT_FTPPORT	       = $extval(CURLOPT, "CURLOPT_FTPPORT")	// 17
#macdef
CURLOPT_USERAGENT      = $extval(CURLOPT, "CURLOPT_USERAGENT")	// 18
//
#macdef
CURLOPT_READDATA       = $extval(CURLOPT, "CURLOPT_READDATA")	// = CURLOPT_INFILE
#macdef
CURLOPT_WRITEDATA      = $extval(CURLOPT, "CURLOPT_WRITEDATA")	// = CURLOPT_FILE
//
#macdef
CURLOPT_SSL_VERIFYPEER = $extval(CURLOPT, "CURLOPT_SSL_VERIFYPEER")
#macdef
CURLOPT_SSL_VERIFYHOST = $extval(CURLOPT, "CURLOPT_SSL_VERIFYHOST")
//
#macdef
CURLOPT_HEADERDATA     = $extval(CURLOPT, "CURLOPT_HEADERDATA")	// = CURLOPT_INFILE

#macdef
CURLOPT_XOAUTH2_BEARER = $extval(CURLOPT, "CURLOPT_XOAUTH2_BEARER")


#macdef
CURLOPT_HTTPHEADER = $extval(CURLOPT, "CURLOPT_HTTPHEADER")

#macdef
CURLOPT_POSTFIELDS = $extval(CURLOPT, "CURLOPT_POSTFIELDS")

#macdef
CURLOPT_VERBOSE = $extval(CURLOPT, "CURLOPT_VERBOSE")

#macdef
CURLOPT_POST = $extval(CURLOPT, "CURLOPT_POST")


(* ****** ****** *)
//
#macdef
CURLINFO_TEXT	       = $extval(CURLINFO, "CURLINFO_TEXT")
#macdef
CURLINFO_HEADER_IN     = $extval(CURLINFO, "CURLINFO_HEADER_IN")
#macdef
CURLINFO_HEADER_OUT    = $extval(CURLINFO, "CURLINFO_HEADER_OUT")
#macdef
CURLINFO_DATA_IN       = $extval(CURLINFO, "CURLINFO_DATA_IN")
#macdef
CURLINFO_DATA_OUT      = $extval(CURLINFO, "CURLINFO_DATA_OUT")
//
(* ****** ****** *)
//
#macdef
CURLINFO_SSL_DATA_IN   = $extval(CURLINFO, "CURLINFO_SSL_DATA_IN")
#macdef
CURLINFO_SSL_DATA_OUT  = $extval(CURLINFO, "CURLINFO_SSL_DATA_OUT")
//
(* ****** ****** *)

#macdef
CURLINFO_EFFECTIVE_URL       = $extval(CURLINFO, "CURLINFO_EFFECTIVE_URL")
#macdef
CURLINFO_RESPONSE_CODE		   = $extval(CURLINFO, "CURLINFO_RESPONSE_CODE")
#macdef
CURLINFO_HTTP_CONNECTCODE	   = $extval(CURLINFO, "CURLINFO_HTTP_CONNECTCODE")
#macdef
CURLINFO_HTTP_VERSION        = $extval(CURLINFO, "CURLINFO_HTTP_VERSION")
#macdef
CURLINFO_FILETIME		         = $extval(CURLINFO, "CURLINFO_FILETIME")
#macdef
CURLINFO_FILETIME_T          = $extval(CURLINFO, "CURLINFO_FILETIME_T")
#macdef
CURLINFO_TOTAL_TIME		   = $extval(CURLINFO, "CURLINFO_TOTAL_TIME")
#macdef
CURLINFO_TOTAL_TIME_T		   = $extval(CURLINFO, "CURLINFO_TOTAL_TIME_T")
#macdef
CURLINFO_NAMELOOKUP_TIME	   = $extval(CURLINFO, "CURLINFO_NAMELOOKUP_TIME")
#macdef
CURLINFO_NAMELOOKUP_TIME_T	   = $extval(CURLINFO, "CURLINFO_NAMELOOKUP_TIME_T")
#macdef
CURLINFO_CONNECT_TIME		   = $extval(CURLINFO, "CURLINFO_CONNECT_TIME")
#macdef
CURLINFO_CONNECT_TIME_T		   = $extval(CURLINFO, "CURLINFO_CONNECT_TIME_T")
#macdef
CURLINFO_APPCONNECT_TIME	   = $extval(CURLINFO, "CURLINFO_APPCONNECT_TIME")
#macdef
CURLINFO_APPCONNECT_TIME_T	   = $extval(CURLINFO, "CURLINFO_APPCONNECT_TIME_T")
#macdef
CURLINFO_PRETRANSFER_TIME	   = $extval(CURLINFO, "CURLINFO_PRETRANSFER_TIME")
#macdef
CURLINFO_PRETRANSFER_TIME_T	   = $extval(CURLINFO, "CURLINFO_PRETRANSFER_TIME_T")
#macdef
CURLINFO_STARTTRANSFER_TIME	   = $extval(CURLINFO, "CURLINFO_STARTTRANSFER_TIME")
#macdef
CURLINFO_STARTTRANSFER_TIME_T	   = $extval(CURLINFO, "CURLINFO_STARTTRANSFER_TIME_T")
#macdef
CURLINFO_REDIRECT_TIME		   = $extval(CURLINFO, "CURLINFO_REDIRECT_TIME")
#macdef
CURLINFO_REDIRECT_TIME_T	   = $extval(CURLINFO, "CURLINFO_REDIRECT_TIME_T")
#macdef
CURLINFO_REDIRECT_COUNT		   = $extval(CURLINFO, "CURLINFO_REDIRECT_COUNT")
#macdef
CURLINFO_REDIRECT_URL		   = $extval(CURLINFO, "CURLINFO_REDIRECT_URL")
#macdef
CURLINFO_SIZE_UPLOAD		   = $extval(CURLINFO, "CURLINFO_SIZE_UPLOAD")
#macdef
CURLINFO_SIZE_UPLOAD_T		   = $extval(CURLINFO, "CURLINFO_SIZE_UPLOAD_T")
#macdef
CURLINFO_SIZE_DOWNLOAD		   = $extval(CURLINFO, "CURLINFO_SIZE_DOWNLOAD")
#macdef
CURLINFO_SIZE_DOWNLOAD_T	   = $extval(CURLINFO, "CURLINFO_SIZE_DOWNLOAD_T")
#macdef
CURLINFO_SPEED_DOWNLOAD		   = $extval(CURLINFO, "CURLINFO_SPEED_DOWNLOAD")
#macdef
CURLINFO_SPEED_DOWNLOAD_T	   = $extval(CURLINFO, "CURLINFO_SPEED_DOWNLOAD_T")
#macdef
CURLINFO_SPEED_UPLOAD		   = $extval(CURLINFO, "CURLINFO_SPEED_UPLOAD")
#macdef
CURLINFO_SPEED_UPLOAD_T		   = $extval(CURLINFO, "CURLINFO_SPEED_UPLOAD_T")
#macdef
CURLINFO_HEADER_SIZE		   = $extval(CURLINFO, "CURLINFO_HEADER_SIZE")
#macdef
CURLINFO_REQUEST_SIZE		   = $extval(CURLINFO, "CURLINFO_REQUEST_SIZE")
#macdef
CURLINFO_SSL_VERIFYRESULT	   = $extval(CURLINFO, "CURLINFO_SSL_VERIFYRESULT")
#macdef
CURLINFO_PROXY_SSL_VERIFYRESULT	   = $extval(CURLINFO, "CURLINFO_PROXY_SSL_VERIFYRESULT")
#macdef
CURLINFO_SSL_ENGINES		   = $extval(CURLINFO, "CURLINFO_SSL_ENGINES")
#macdef
CURLINFO_CONTENT_LENGTH_DOWNLOAD   = $extval(CURLINFO, "CURLINFO_CONTENT_LENGTH_DOWNLOAD")
#macdef
CURLINFO_CONTENT_LENGTH_DOWNLOAD_T = $extval(CURLINFO, "CURLINFO_CONTENT_LENGTH_DOWNLOAD_T")
#macdef
CURLINFO_CONTENT_LENGTH_UPLOAD	   = $extval(CURLINFO, "CURLINFO_CONTENT_LENGTH_UPLOAD")
#macdef
CURLINFO_CONTENT_LENGTH_UPLOAD_T   = $extval(CURLINFO, "CURLINFO_CONTENT_LENGTH_UPLOAD_T")
#macdef
CURLINFO_CONTENT_TYPE		   = $extval(CURLINFO, "CURLINFO_CONTENT_TYPE")
#macdef
CURLINFO_PRIVATE		   = $extval(CURLINFO, "CURLINFO_PRIVATE")
#macdef
CURLINFO_HTTPAUTH_AVAIL		   = $extval(CURLINFO, "CURLINFO_HTTPAUTH_AVAIL")
#macdef
CURLINFO_PROXYAUTH_AVAIL	   = $extval(CURLINFO, "CURLINFO_PROXYAUTH_AVAIL")
#macdef
CURLINFO_OS_ERRNO		   = $extval(CURLINFO, "CURLINFO_OS_ERRNO")
#macdef
CURLINFO_NUM_CONNECTS		   = $extval(CURLINFO, "CURLINFO_NUM_CONNECTS")
#macdef
CURLINFO_PRIMARY_IP		   = $extval(CURLINFO, "CURLINFO_PRIMARY_IP")
#macdef
CURLINFO_PRIMARY_PORT		   = $extval(CURLINFO, "CURLINFO_PRIMARY_PORT")
#macdef
CURLINFO_LOCAL_IP		   = $extval(CURLINFO, "CURLINFO_LOCAL_IP")
#macdef
CURLINFO_LOCAL_PORT		   = $extval(CURLINFO, "CURLINFO_LOCAL_PORT")
#macdef
CURLINFO_COOKIELIST		   = $extval(CURLINFO, "CURLINFO_COOKIELIST")
#macdef
CURLINFO_LASTSOCKET		   = $extval(CURLINFO, "CURLINFO_LASTSOCKET")
#macdef
CURLINFO_ACTIVESOCKET		   = $extval(CURLINFO, "CURLINFO_ACTIVESOCKET")
#macdef
CURLINFO_FTP_ENTRY_PATH		   = $extval(CURLINFO, "CURLINFO_FTP_ENTRY_PATH")
#macdef
CURLINFO_CERTINFO		   = $extval(CURLINFO, "CURLINFO_CERTINFO")
#macdef
CURLINFO_TLS_SSL_PTR		   = $extval(CURLINFO, "CURLINFO_TLS_SSL_PTR")
#macdef
CURLINFO_TLS_SESSION		   = $extval(CURLINFO, "CURLINFO_TLS_SESSION")
#macdef
CURLINFO_CONDITION_UNMET	   = $extval(CURLINFO, "CURLINFO_CONDITION_UNMET")
#macdef
CURLINFO_RTSP_SESSION_ID	   = $extval(CURLINFO, "CURLINFO_RTSP_SESSION_ID")
#macdef
CURLINFO_RTSP_CLIENT_CSEQ	   = $extval(CURLINFO, "CURLINFO_RTSP_CLIENT_CSEQ")
#macdef
CURLINFO_RTSP_SERVER_CSEQ	   = $extval(CURLINFO, "CURLINFO_RTSP_SERVER_CSEQ")
#macdef
CURLINFO_RTSP_CSEQ_RECV		   = $extval(CURLINFO, "CURLINFO_RTSP_CSEQ_RECV")
#macdef
CURLINFO_PROTOCOL		   = $extval(CURLINFO, "CURLINFO_PROTOCOL")
#macdef
CURLINFO_SCHEME			   = $extval(CURLINFO, "CURLINFO_SCHEME")
(* TIMES *)
(* An overview of the six time values available from curl_easy_getinfo() *)

(* curl_easy_perform() *)
(*     | *)
(*     |--NAMELOOKUP *)
(*     |--|--CONNECT *)
(*     |--|--|--APPCONNECT *)
(*     |--|--|--|--PRETRANSFER *)
(*     |--|--|--|--|--STARTTRANSFER *)
(*     |--|--|--|--|--|--TOTAL *)
(*     |--|--|--|--|--|--REDIRECT *)
(* NAMELOOKUP *)

(* CURLINFO_NAMELOOKUP_TIME and CURLINFO_NAMELOOKUP_TIME_T. The time it took from the start until the name resolving was completed. *)

(* CONNECT *)

(* CURLINFO_CONNECT_TIME and CURLINFO_CONNECT_TIME_T. The time it took from the start until the connect to the remote host (or proxy) was completed. *)

(* APPCONNECT *)

(* CURLINFO_APPCONNECT_TIME and CURLINFO_APPCONNECT_TIME_T. The time it took from the start until the SSL connect/handshake with the remote host was completed. (Added in 7.19.0) The latter is the integer version (measuring microseconds). (Added in 7.60.0) *)

(* PRETRANSFER *)

(* CURLINFO_PRETRANSFER_TIME and CURLINFO_PRETRANSFER_TIME_T. The time it took from the start until the file transfer is just about to begin. This includes all pre-transfer commands and negotiations that are specific to the particular protocol(s) involved. *)

(* STARTTRANSFER *)

(* CURLINFO_STARTTRANSFER_TIME and CURLINFO_STARTTRANSFER_TIME_T. The time it took from the start until the first byte is received by libcurl. *)

(* TOTAL *)

(* CURLINFO_TOTAL_TIME and CURLINFO_TOTAL_TIME_T. Total time of the previous request. *)

(* REDIRECT *)

(* CURLINFO_REDIRECT_TIME and CURLINFO_REDIRECT_TIME_T. The time it took for all redirection steps include name lookup, connect, pretransfer and transfer before final transaction was started. So, this is zero if no redirection took place. *)


#include "./curl_slist.sats"
#include "./curl_curl.sats"
#include "./curl_easy.sats"


(* ****** ****** *)

(* end of [curl.sats] *)
