/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include <memory.h> /* for memset */
#include "bchan.h"

/* Default timeout can be changed using clnt_control() */
static struct timeval TIMEOUT = { 25, 0 };

enum clnt_stat 
callback1_1(bchan_msg *argp, bchan_res *clnt_res, CLIENT *clnt)
{
	return (clnt_call(clnt, CALLBACK1,
		(xdrproc_t) xdr_bchan_msg, (caddr_t) argp,
		(xdrproc_t) xdr_bchan_res, (caddr_t) clnt_res,
		TIMEOUT));
}