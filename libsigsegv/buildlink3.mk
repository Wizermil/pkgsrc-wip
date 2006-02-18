# $NetBSD: buildlink3.mk,v 1.1 2006/02/18 08:15:35 martijnb Exp $
BUILDLINK_DEPMETHOD/libsigsegv?=	build
BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBSIGSEGV_BUILDLINK3_MK:=	${LIBSIGSEGV_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libsigsegv
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibsigsegv}
BUILDLINK_PACKAGES+=	libsigsegv

.if !empty(LIBSIGSEGV_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libsigsegv+=	libsigsegv>=2.2
BUILDLINK_PKGSRCDIR.libsigsegv?=	../../wip/libsigsegv
.endif	# LIBSIGSEGV_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
