# $NetBSD: buildlink3.mk,v 1.1.1.1 2005/10/17 18:38:10 jeremy-c-reed Exp $

BUILDLINK_DEPMETHOD.fontcacheproto?=	build

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
FONTCACHEPROTO_BUILDLINK3_MK:=	${FONTCACHEPROTO_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	fontcacheproto
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfontcacheproto}
BUILDLINK_PACKAGES+=	fontcacheproto

.if !empty(FONTCACHEPROTO_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.fontcacheproto+=	fontcacheproto>=0.1
BUILDLINK_PKGSRCDIR.fontcacheproto?=	../../new/fontcacheproto
.endif	# FONTCACHEPROTO_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
