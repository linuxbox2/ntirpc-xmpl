/*
 * Please do not edit this file.
 * It was generated using rpcgen.
 */

#include "fchan.h"

bool_t
xdr_fchan_msg (XDR *xdrs, fchan_msg *objp)
{
	register int32_t *buf;

	 if (!xdr_u_int (xdrs, &objp->seqnum))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->msg1, 1024))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->msg2, 1024))
		 return FALSE;
	return TRUE;
}

bool_t
xdr_fchan_res (XDR *xdrs, fchan_res *objp)
{
	register int32_t *buf;

	 if (!xdr_u_int (xdrs, &objp->result))
		 return FALSE;
	 if (!xdr_string (xdrs, &objp->msg1, 512))
		 return FALSE;
	return TRUE;
}
