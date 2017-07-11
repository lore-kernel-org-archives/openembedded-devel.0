Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 13D6671AC3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:50:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 04:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="109943151"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2017 04:50:16 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 06F1A5804B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:50:15 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 14:50:48 +0300
Message-Id: <1499773848-8003-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
MIME-Version: 1.0
Subject: [PATCH] Intel: remove license file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jul 2017 11:50:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This license was added to fix warnings with acpitests.

acpitests recipe was moved to oe-core with this commit:
OE-Core rev: 020f7ea3aa5c1f311841d4fb16bc525ae1dd5f11

Remove this file as it is not used anymore.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-oe/licenses/Intel | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 meta-oe/licenses/Intel

diff --git a/meta-oe/licenses/Intel b/meta-oe/licenses/Intel
deleted file mode 100644
index eb81dd7..0000000
--- a/meta-oe/licenses/Intel
+++ /dev/null
@@ -1,21 +0,0 @@
-License for Contributions to ACPICA
-
-Copyright (c) 2000 – 2015 Intel Corp.
-All rights reserved.
-
-Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
-
-1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
-2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
-
-THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINES
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-POSSIBILITY OF SUCH DAMAGE.
-- 
2.4.0


