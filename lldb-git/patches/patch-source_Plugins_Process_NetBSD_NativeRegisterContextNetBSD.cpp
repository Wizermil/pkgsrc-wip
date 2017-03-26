$NetBSD$

--- source/Plugins/Process/NetBSD/NativeRegisterContextNetBSD.cpp.orig	2017-03-21 17:54:57.000000000 +0000
+++ source/Plugins/Process/NetBSD/NativeRegisterContextNetBSD.cpp
@@ -9,11 +9,56 @@
 
 #include "NativeRegisterContextNetBSD.h"
 
+#include "lldb/Host/common/NativeProcessProtocol.h"
+
 using namespace lldb_private;
 using namespace lldb_private::process_netbsd;
 
+#include <sys/types.h>
+#include <sys/ptrace.h>
+
 NativeRegisterContextNetBSD::NativeRegisterContextNetBSD(
     NativeThreadProtocol &native_thread, uint32_t concrete_frame_idx,
     RegisterInfoInterface *reg_info_interface_p)
     : NativeRegisterContextRegisterInfo(native_thread, concrete_frame_idx,
                                         reg_info_interface_p) {}
+
+Error NativeRegisterContextNetBSD::ReadGPR() {
+  void *buf = GetGPRBuffer();
+  if (!buf)
+    return Error("GPR buffer is NULL");
+
+  return DoReadGPR(buf);
+}
+
+Error NativeRegisterContextNetBSD::WriteGPR() {
+  void *buf = GetGPRBuffer();
+  if (!buf)
+    return Error("GPR buffer is NULL");
+
+  return DoWriteGPR(buf);
+}
+
+Error NativeRegisterContextNetBSD::DoReadGPR(void *buf) {
+  return NativeProcessNetBSD::PtraceWrapper(PT_GETREGS, GetProcessPid(), buf,
+                                            m_thread.GetID());
+}
+
+Error NativeRegisterContextNetBSD::DoWriteGPR(void *buf) {
+  return NativeProcessNetBSD::PtraceWrapper(PT_SETREGS, GetProcessPid(), buf,
+                                            m_thread.GetID());
+}
+
+NativeProcessNetBSD &NativeRegisterContextNetBSD::GetProcess() {
+  auto process_sp =
+      std::static_pointer_cast<NativeProcessNetBSD>(m_thread.GetProcess());
+  assert(process_sp);
+  return *process_sp;
+}
+
+pid_t NativeRegisterContextNetBSD::GetProcessPid() {
+  NativeProcessNetBSD &process = GetProcess();
+  lldb::pid_t pid = process.GetID();
+
+  return pid;
+}