$NetBSD$

--- source/Plugins/Process/NetBSD/NativeRegisterContextNetBSD_x86_64.h.orig	2017-03-14 16:45:14.556385063 +0000
+++ source/Plugins/Process/NetBSD/NativeRegisterContextNetBSD_x86_64.h
@@ -0,0 +1,83 @@
+//===-- NativeRegisterContextNetBSD_x86_64.h ---------------------*- C++ -*-===//
+//
+//                     The LLVM Compiler Infrastructure
+//
+// This file is distributed under the University of Illinois Open Source
+// License. See LICENSE.TXT for details.
+//
+//===----------------------------------------------------------------------===//
+
+#if defined(__x86_64__)
+
+#ifndef lldb_NativeRegisterContextNetBSD_x86_64_h
+#define lldb_NativeRegisterContextNetBSD_x86_64_h
+
+#include <sys/param.h>
+#include <sys/types.h>
+#include <machine/reg.h>
+
+#include "Plugins/Process/NetBSD/NativeRegisterContextNetBSD.h"
+#include "Plugins/Process/Utility/RegisterContext_x86.h"
+#include "Plugins/Process/Utility/lldb-x86-register-enums.h"
+
+namespace lldb_private {
+namespace process_netbsd {
+
+class NativeProcessNetBSD;
+
+class NativeRegisterContextNetBSD_x86_64 : public NativeRegisterContextNetBSD {
+public:
+  NativeRegisterContextNetBSD_x86_64(const ArchSpec &target_arch,
+                                    NativeThreadProtocol &native_thread,
+                                    uint32_t concrete_frame_idx);
+
+  uint32_t GetRegisterSetCount() const override;
+
+  const RegisterSet *GetRegisterSet(uint32_t set_index) const override;
+
+  Error ReadRegister(const RegisterInfo *reg_info,
+                     RegisterValue &reg_value) override;
+
+  Error WriteRegister(const RegisterInfo *reg_info,
+                      const RegisterValue &reg_value) override;
+
+  Error ReadAllRegisterValues(lldb::DataBufferSP &data_sp) override;
+
+  Error WriteAllRegisterValues(const lldb::DataBufferSP &data_sp) override;
+
+protected:
+  void *GetGPRBuffer() override { return &m_gpr_x86_64; }
+
+  void *GetFPRBuffer() override { return &m_fpr_x86_64; }
+
+  void *GetDBRBuffer() override { return &m_dr_x86_64; }
+
+  size_t GetFPRSize() override { return 0; }
+
+  Error ReadFPR() override { return Error(); }
+
+  Error WriteFPR() override { return Error(); }
+
+private:
+  // Private member types.
+  enum class RegSet { gpr, fpu, avx, mpx };
+
+  // Private member variables.
+  struct reg m_gpr_x86_64;
+  struct fpreg m_fpr_x86_64;
+  struct dbreg m_dr_x86_64;
+
+  int GetSetForNativeRegNum(int reg_num) const;
+
+  enum { GPRegSet = 4, FPRegSet = 5, DBRegSet = 6 };
+
+  int ReadRegisterSet(uint32_t set, bool force);
+  int WriteRegisterSet(uint32_t set);
+};
+
+} // namespace process_netbsd
+} // namespace lldb_private
+
+#endif // #ifndef lldb_NativeRegisterContextNetBSD_x86_64_h
+
+#endif // defined(__x86_64__)