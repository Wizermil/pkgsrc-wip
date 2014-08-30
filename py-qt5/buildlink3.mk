# $NetBSD: buildlink3.mk,v 1.1 2014/08/30 12:42:30 thomasklausner Exp $

BUILDLINK_TREE+=	py-qt5

.if !defined(PY_QT5_BUILDLINK3_MK)
PY_QT5_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.py-qt5+=	${PYPKGPREFIX}-qt5>=5.2.1
BUILDLINK_PKGSRCDIR.py-qt5?=	../../wip/py-qt5

.endif	# PY_QT5_BUILDLINK3_MK

BUILDLINK_TREE+=	-py-qt5
