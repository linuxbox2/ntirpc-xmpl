/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include "bchan.h"
#include <rpc/xdr_inline.h>

bool_t
xdr_bchan_msg (XDR *xdrs, bchan_msg *objp)
{
	register int32_t *buf;

	 if (!inline_xdr_u_int (xdrs, &objp->seqnum))
		 return FALSE;
	 if (!inline_xdr_string (xdrs, &objp->msg1, 1024))
		 return FALSE;
	 if (!inline_xdr_string (xdrs, &objp->msg2, 1024))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_bchan_res (XDR *xdrs, bchan_res *objp)
{
	register int32_t *buf;

	 if (!inline_xdr_u_int (xdrs, &objp->result))
		 return FALSE;
	 if (!inline_xdr_string (xdrs, &objp->msg1, 512))
		 return FALSE;
	return TRUE;
}
