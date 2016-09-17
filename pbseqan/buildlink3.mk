# $NetBSD$

BUILDLINK_TREE+=	pbseqan

.if !defined(PBSEQAN_BUILDLINK3_MK)
PBSEQAN_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.pbseqan?=	build

BUILDLINK_API_DEPENDS.pbseqan+=	pbseqan>=2016.09.13
BUILDLINK_PKGSRCDIR.pbseqan?=	../../wip/pbseqan
.endif	# PBSEQAN_BUILDLINK3_MK

BUILDLINK_TREE+=	-pbseqan