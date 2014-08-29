# $NetBSD: buildlink3.mk,v 1.5 2014/08/29 14:10:07 szptvlfn Exp $

BUILDLINK_TREE+=	hs-base-unicode-symbols

.if !defined(HS_BASE_UNICODE_SYMBOLS_BUILDLINK3_MK)
HS_BASE_UNICODE_SYMBOLS_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.hs-base-unicode-symbols+=	hs-base-unicode-symbols>=0.2.2
BUILDLINK_ABI_DEPENDS.hs-base-unicode-symbols+=	hs-base-unicode-symbols>=0.2.2.4
BUILDLINK_PKGSRCDIR.hs-base-unicode-symbols?=	../../wip/hs-base-unicode-symbols
.endif	# HS_BASE_UNICODE_SYMBOLS_BUILDLINK3_MK

BUILDLINK_TREE+=	-hs-base-unicode-symbols
