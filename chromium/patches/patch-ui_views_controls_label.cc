$NetBSD$

--- ui/views/controls/label.cc.orig	2017-02-02 02:03:13.000000000 +0000
+++ ui/views/controls/label.cc
@@ -523,7 +523,7 @@ bool Label::OnMousePressed(const ui::Mou
     GetFocusManager()->SetFocusedView(this);
   }
 
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && !defined(OS_CHROMEOS)
   if (event.IsOnlyMiddleMouseButton() && GetFocusManager())
     GetFocusManager()->SetFocusedView(this);
 #endif
@@ -687,7 +687,7 @@ bool Label::PasteSelectionClipboard() {
 }
 
 void Label::UpdateSelectionClipboard() {
-#if defined(OS_LINUX) && !defined(OS_CHROMEOS)
+#if (defined(OS_LINUX) || defined(OS_BSD)) && !defined(OS_CHROMEOS)
   if (!obscured()) {
     ui::ScopedClipboardWriter(ui::CLIPBOARD_TYPE_SELECTION)
         .WriteText(GetSelectedText());
