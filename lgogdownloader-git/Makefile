# $NetBSD: Makefile,v 1.18 2015/09/13 07:33:05 thomasklausner Exp $

DISTNAME=	lgogdownloader-3.4
CATEGORIES=	games
GIT_REPO=	git://github.com/Sude-/lgogdownloader.git

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/Sude-/lgogdownloader
COMMENT=	Download games from GOG
#LICENSE=	dwtfywtpl

BUILD_DEPENDS+=	help2man-[0-9]*:../../converters/help2man

USE_LANGUAGES=	c c++
USE_CMAKE=	yes
USE_TOOLS+=	pkg-config
CMAKE_ARGS+=	-DPC_JSONCPP_FOUND:BOOL=1
CMAKE_ARGS+=	-DPC_JSONCPP_INCLUDEDIRS:PATH=${BUILDLINK_PREFIX.jsoncpp}/include/json
CMAKE_ARGS+=	-DPC_JSONCPP_LIBRARY_DIRS:PATH=${BUILDLINK_PREFIX.jsoncpp}/lib
# for man page
CMAKE_ARGS+=	-DINSTALL_SHARE_DIR:PATH=${PREFIX}

# https://github.com/Sude-/lgogdownloader/issues/128
PKGSRC_USE_STACK_CHECK=	no

.include "../../devel/boost-libs/buildlink3.mk"
.include "../../security/liboauth/buildlink3.mk"
.include "../../textproc/tinyxml2/buildlink3.mk"
.include "../../www/htmlcxx/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../misc/rhash/buildlink3.mk"
.include "../../textproc/jsoncpp/buildlink3.mk"
.include "../../wip/mk/git-package.mk"
.include "../../mk/bsd.pkg.mk"
