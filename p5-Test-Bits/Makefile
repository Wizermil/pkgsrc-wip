# $NetBSD$

DISTNAME=	Test-Bits-0.02
PKGNAME=	p5-${DISTNAME}
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=	fred@statdns.com
HOMEPAGE=	https://metacpan.org/release/Test-Bits
COMMENT=	Provides a bits_is() subroutine for testing binary data
LICENSE=	artistic-2.0

DEPENDS+=	p5-List-AllUtils-[0-9]*:../../devel/p5-List-AllUtils
DEPENDS+=	p5-parent-[0-9]*:../../devel/p5-parent
TEST_DEPENDS+=	p5-Test-Fatal-[0-9]*:../../devel/p5-Test-Fatal

PERL5_PACKLIST=	auto/Test/Bits/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
