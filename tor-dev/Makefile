# $NetBSD$

DISTNAME=	tor-0.4.0.2-alpha
PKGNAME=	${DISTNAME:S/tor/tordev/:S/-alpha//:S/-rc/rc0/}
CATEGORIES=	net security
MASTER_SITES=	http://www.torproject.org/dist/

MAINTAINER=	alnsn@NetBSD.org
HOMEPAGE=	http://www.torproject.org/
COMMENT=	Anonymizing overlay network for TCP
LICENSE=	modified-bsd

USE_LANGUAGES=		c99
USE_PKGLOCALEDIR=	yes
GNU_CONFIGURE=		yes

USE_TOOLS+=		pkg-config

CONFIGURE_ENV+=		CPP=${CPP:Q}
CONFIGURE_ENV+=		CONFDIR=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--program-suffix=-dev
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFBASEDIR}
CONFIGURE_ARGS+=	--docdir=${PREFIX}/share/doc/tordev

# one test failure in 0.3.5.3-alpha
# https://trac.torproject.org/projects/tor/ticket/27948
TEST_TARGET=		check

TOR_USER?=		tordev
TOR_GROUP?=		tor
PKG_GECOS.${TOR_USER}=	Torifier
PKG_HOME.${TOR_USER}=	${VARBASE}/chroot/tordev
BUILD_DEFS+=		VARBASE
PKG_SYSCONFSUBDIR=	tordev

PKG_GROUPS_VARS+=	TOR_GROUP
PKG_USERS_VARS=		TOR_USER

RCD_SCRIPTS=		tordev
RCD_SCRIPT_SRC.tordev=	${FILESDIR}/tordev.in
PKG_GROUPS=		${TOR_GROUP}
PKG_USERS=		${TOR_USER}:${TOR_GROUP}
USER_GROUP=		${TOR_USER} ${TOR_GROUP}

OWN_DIRS_PERMS+=	${PKG_HOME.${TOR_USER}} ${USER_GROUP} 0700

CONFIGURE_ARGS+=	--localstatedir=${VARBASE}

CONF_FILES+=		${PREFIX}/share/examples/tordev/torrc.sample	\
			${PKG_SYSCONFDIR}/torrc

PRINT_PLIST_AWK+=	/^man\/man/ { $$0 = "$${PLIST.doc}" $$0 }
PRINT_PLIST_AWK+=	/^share\/doc/ { $$0 = "$${PLIST.doc}" $$0 }

FILES_SUBST+=		PKG_HOME=${PKG_HOME.${TOR_USER}}
FILES_SUBST+=		TOR_USER=${TOR_USER} TOR_GROUP=${TOR_GROUP}

INSTALL_MAKE_FLAGS+=	sysconfdir=${PREFIX}/share/examples

CHECK_PORTABILITY_SKIP+=	contrib/*

.include "../../mk/bsd.prefs.mk"

.if !empty(PKGSRC_COMPILER:Mmipspro)
CFLAGS+=		-c99
.endif

BUILDLINK_API_DEPENDS.libevent+= libevent>=2.0
.include "../../devel/libevent/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"

## We include this after other b3.mk files since we use PTHREAD_TYPE.
##
.include "options.mk"

.include "../../mk/bsd.pkg.mk"
