# $NetBSD: download.mk,v 1.25 2013/08/12 15:02:24 gregoire Exp $
#

#
# Helper file to access the bazaar repository, download extra stuff (such as
# translations), and generate the configure script with autogen.sh.
#

BUILD_DEPENDS+=		bzr>=1.0:../../devel/bzr
BUILD_DEPENDS+=		rsync>=3.0:../../net/rsync
BUILD_DEPENDS+=		autogen>=5.9:../../devel/autogen

BZR_REPOSITORY=		bzr://bzr.savannah.gnu.org/grub/trunk/grub
BZR_REVISION=		5091

pre-extract: do-bzr-extract

.PHONY: do-bzr-extract
do-bzr-extract:
	${RUN} set -e;								\
	cd ${WRKDIR};								\
	${STEP_MSG} "Exporting from bazaar repository "${BZR_REPOSITORY};	\
	bzr export -r ${BZR_REVISION} ${DISTNAME} ${BZR_REPOSITORY}

post-extract: do-extra-downloads

.PHONY: do-extra-downloads
do-extra-downloads:
	(${ECHO} "/^autogenerated=/d" && ${ECHO} "w") | ed -s ${WRKSRC}/linguas.sh
	cd ${WRKSRC} && ./linguas.sh

pre-configure: do-autogen

.PHONY: do-autogen
do-autogen:
	cd ${WRKSRC} && ./autogen.sh

# Python is used to generate the autogen makefile template.
.include "../../lang/python/tool.mk"
