
# This is a template Makefile generated by rpcgen

# Parameters

CLIENT = fchan_client
SERVER = fchan_server
DUPLEX_UNIT = duplex_unit

SOURCES_UNIT.c = duplex_unit.c fchan_xdr.c fchan_clnt.c bchan_xdr.c bchan_svc.c
SOURCES_CLNT.c = fchan_client.c bchan_server.c
SOURCES_CLNT.h = 
SOURCES_SVC.c = fchan_server.c
SOURCES_SVC.h = 
SOURCES.x = fchan.x
SOURCES2.x = bchan.x
SOURCES_MISC.c = unit_misc.c

TARGETS_SVC.c = fchan_svc.c fchan_xdr.c bchan_xdr.c bchan_clnt.c
TARGETS_CLNT.c = fchan_clnt.c fchan_xdr.c bchan_svc.c bchan_xdr.c
TARGETS = fchan.h fchan_xdr.c fchan_clnt.c fchan_svc.c

OBJECTS_CLNT = $(SOURCES_CLNT.c:%.c=%.o) $(TARGETS_CLNT.c:%.c=%.o)
OBJECTS_SVC = $(SOURCES_SVC.c:%.c=%.o) $(TARGETS_SVC.c:%.c=%.o)
OBJECTS_UNIT = $(SOURCES_UNIT.c:%.c=%.o) $(TARGETS_UNIT.c:%.c=%.o)
OBJECTS_MISC = $(SOURCES_MISC.c:%.c=%.o) $(TARGETS_MISC.c:%.c=%.o)

# Compiler flags 
CUNIT=/opt/CUnit
TIRPC = /home/matt/nfs-ganesha/src/libtirpc

CPPFLAGS += -D_REENTRANT
CFLAGS += -g3 -O0 -fPIC -DPIC -I$(TIRPC)/tirpc/ -I$(CUNIT)/include \
	-D_REENTRANT -DRPC_DUPLEX
LDFLAGS += -L$(CUNIT)/lib $(TIRPC)/src/.libs/libntirpc.a \
	-lnsl -lcunit -lpthread
RPCGENFLAGS = -C -M 

# Targets 

all : $(CLIENT) $(SERVER) $(DUPLEX_UNIT)

$(TARGETS) : $(SOURCES.x) $(SOURCES2.x)

rpcstubs: $(SOURCES.x) $(SOURCES2.x)
	# not clean, don't automate
	rpcgen $(RPCGENFLAGS) $(SOURCES.x)
	rpcgen $(RPCGENFLAGS) $(SOURCES2.x)

$(OBJECTS_CLNT) : $(SOURCES_CLNT.c) $(SOURCES_CLNT.h) $(TARGETS_CLNT.c)

$(OBJECTS_SVC) : $(SOURCES_SVC.c) $(SOURCES_SVC.h) $(TARGETS_SVC.c)

$(OBJECTS_UNIT) : $(SOURCES_UNIT.c) $(SOURCES_UNIT.h) $(TARGETS_UNIT.c)

$(OBJECTS_MISC) : $(SOURCES_MISC.c) $(SOURCES_MISC.h) $(TARGETS_MISC.c)

$(CLIENT) : $(OBJECTS_CLNT) $(OBJECTS_MISC)
	$(LINK.c) -o $(CLIENT) $(OBJECTS_CLNT) $(OBJECTS_MISC) $(LDFLAGS) 

$(SERVER) : $(OBJECTS_SVC) $(OBJECTS_MISC)
	$(LINK.c) -o $(SERVER) $(OBJECTS_SVC) $(OBJECTS_MISC) $(LDFLAGS)

$(DUPLEX_UNIT) : $(OBJECTS_UNIT) $(OBJECTS_MISC)
	$(LINK.c) -o $(DUPLEX_UNIT) $(OBJECTS_UNIT) $(OBJECTS_MISC) $(LDFLAGS)

 clean:
	 $(RM) core Makefile.fchan Makefile.bchan \
	$(OBJECTS_CLNT) $(OBJECTS_SVC) $(OBJECTS_UNIT) \
	$(CLIENT) $(SERVER) $(DUPLEX_UNIT)

