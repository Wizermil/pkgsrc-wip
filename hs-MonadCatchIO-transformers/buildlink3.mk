# $NetBSD: buildlink3.mk,v 1.8 2014/08/29 14:10:01 szptvlfn Exp $

BUILDLINK_TREE+=	hs-MonadCatchIO-transformers

.if !defined(HS_MONADCATCHIO_TRANSFORMERS_BUILDLINK3_MK)
HS_MONADCATCHIO_TRANSFORMERS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-MonadCatchIO-transformers+=	hs-MonadCatchIO-transformers>=0.3.1
BUILDLINK_ABI_DEPENDS.hs-MonadCatchIO-transformers+=	hs-MonadCatchIO-transformers>=0.3.1.0
BUILDLINK_PKGSRCDIR.hs-MonadCatchIO-transformers?=	../../wip/hs-MonadCatchIO-transformers

.include "../../devel/hs-extensible-exceptions/buildlink3.mk"
.include "../../wip/hs-monads-tf/buildlink3.mk"
.include "../../devel/hs-transformers/buildlink3.mk"
.endif	# HS_MONADCATCHIO_TRANSFORMERS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-MonadCatchIO-transformers
