# $NetBSD$

BUILDLINK_TREE+=	go-pty

.if !defined(GO_PTY_BUILDLINK3_MK)
GO_KR_TEXT_BUILDLINK3_MK=

BUILDLINK_CONTENTS_FILTER.go-pty=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-pty?=		build

BUILDLINK_API_DEPENDS.go-pty+=		go-pty>=0.0
BUILDLINK_PKGSRCDIR.go-pty?=		../../wip/go-pty
.endif  # GO_PTY_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-pty
