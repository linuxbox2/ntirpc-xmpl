
struct fchan_msg {
    unsigned int seqnum;
    string msg1<1024>;
    string msg2<1024>;
};

struct fchan_res {
    unsigned int result;
    string msg1<512>;
};

struct read_args {
       unsigned int seqnum;
       unsigned int fileno; /* degenerate fh */
       unsigned int off;
       unsigned int len;
       unsigned int flags;
       unsigned int flags2;
       unsigned int flags3;
       unsigned int flags4;
};

struct read_res {
       unsigned int eof;
       unsigned int flags;
       unsigned int flags2;
       unsigned int flags3;
       unsigned int flags4;
       opaque data<>;
};

struct write_args {
       unsigned int seqnum;
       unsigned int fileno; /* degenerate fh */
       unsigned int off;
       unsigned int len;
       unsigned int flags;
       unsigned int flags2;
       unsigned int flags3;
       unsigned int flags4;
       opaque data<>;
};

struct write_res {
       unsigned int eof;
       unsigned int flags;
       unsigned int flags2;
       unsigned int flags3;
       unsigned int flags4;
};

program FCHAN_PROG {
	version FCHANV {
            fchan_res SENDMSG1(fchan_msg) = 1;
	    int BIND_CONN_TO_SESSION1(void) = 2;
	    /* read and write simulation */
	    read_res READ(read_args) = 3;
	    write_res WRITE(write_args) = 4;	    
	} = 1;
} = 0x20005001;
