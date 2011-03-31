Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5DzV-0006xx-AT
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:16:33 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1664438bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=gxiFHqQ4Kwn0LveKjFm0IO7bYf5rVoIhIpqmRXTE9M0=;
	b=dbrwmxl2Lyf4d/8UVyaMF+h/I9QX0heeSpdRt3CEOB5HrIWt2Cc+93O78QG+aSwnSV
	aw0VQT3wOieRhK2fHzK01IzAmrTwaAiMmJKkf0P9/KgUi9X0yufXrMPe6ZKCEqAho45+
	0mBmnZYgujkseAtngKHCieBU60xObcmMzT+nU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=V0K+jlbkd0YMx6/kBJ6DU1xqfD17S6MHCN2Loweg3WDGxT8U/twsxuKcizOdlAFelY
	HKrpfYuhzsYBkh6LFV/3OGZ9fzrZ5elIbVyNX1QESQlCGUI906stRWTpJV9OV9yULy9l
	hg7FjJYJVmQ9xNv3KulImbl2DzeGacAt1zLi8=
Received: by 10.204.75.26 with SMTP id w26mr401761bkj.154.1301562875460;
	Thu, 31 Mar 2011 02:14:35 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q24sm590065bks.9.2011.03.31.02.14.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 02:14:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 11:14:28 +0200
Message-Id: <dff2afec47fd746f45b9f630bf14755f40a8fdc5.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/8] illume-keyboards-shr: add LICENSE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2011 09:16:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-efl/e17/illume-keyboards-shr/LICENSE   |   25 ++++++++++++++++++++
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    |    7 +++--
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE

diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
new file mode 100644
index 0000000..61bb2f6
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr/LICENSE
@@ -0,0 +1,25 @@
+Copyright notice for Enlightenment:
+
+Copyright (C) 2000-2010 Carsten Haitzler and various contributors (see AUTHORS)
+
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are met:
+
+   1. Redistributions of source code must retain the above copyright
+      notice, this list of conditions and the following disclaimer.
+   2. Redistributions in binary form must reproduce the above copyright 
+      notice, this list of conditions and the following disclaimer in the
+      documentation and/or other materials provided with the distribution.
+
+THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
+COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
+OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
+EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
index fe34513..e3b182d 100644
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
+++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
@@ -1,15 +1,16 @@
 SECTION = "x11/data"
 
 SRC_URI = "git://git.shr-project.org/repo/illume-keyboards.git;protocol=http;branch=master \
-           file://0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch"
+           file://0001-Makefile-update-KEYBOARDS_DIR-for-new-illume2.patch \
+	   file://LICENSE"
 S = "${WORKDIR}/git"
 
 SRCREV = "4064489f359a1addf572089b582f317dff5f50e1"
 PV = "0.0+gitr${SRCPV}"
 PE = "1"
 PR = "r4"
-LICENSE = "unknown"
-
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 PACKAGES = "\
 illume-keyboard-alpha \
-- 
1.7.4.1



