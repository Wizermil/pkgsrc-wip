# $NetBSD$

DISTNAME=	setuptools-rust-0.10.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=PyO3/}
GITHUB_PROJECT=	setuptools-rust
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	minskim@NetBSD.org
HOMEPAGE=	https://github.com/PyO3/setuptools-rust
COMMENT=	Setuptools plugin for Rust support
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-semantic_version>=2.6.0:../../devel/py-semantic_version
DEPENDS+=	${PYPKGPREFIX}-toml>=0.9.0:../../textproc/py-toml

PYTHON_VERSIONS_INCOMPATIBLE=	34

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
