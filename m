Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAig9-0005Ww-LZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:33 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=M6uzEZB2aMdkmT9Xh2rNhD3X1DTrE/DDXubcdFNqKRc=;
	b=p46kKliG5cn++fNuvXB2EyOINaFvEKnkPn6aHXL3SHxZUMviIQK29jTptZySC/gMNO
	pGIYFS2Yqw+ycRNWPqXr7vIkkSaiHQFsHVPg0pgfHqoGDXOtVxbo0RuQ5eQ3PllzgCN/
	oCb1nCkoh+S7q+TJtUjmLNDVvXfQKcspl+zKc=
Received: by 10.204.129.10 with SMTP id m10mr3656571bks.210.1317648602021;
	Mon, 03 Oct 2011 06:30:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j16sm13236873bks.3.2011.10.03.06.29.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:18 +0200
Message-Id: <b7fe24f79991268e235f5aebd7734f3d8314d463.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 20/25] e-wm-theme-illume-efenniht, exquisite-theme-illume, elementary-theme-efenniht: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../e17/e-wm-theme-illume-efenniht/LICENSE         |   25 ++++++++++++++++++++
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    7 ++++-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    7 ++++-
 .../recipes-efl/e17/exquisite-theme-illume/LICENSE |   25 ++++++++++++++++++++
 .../efl/elementary-theme-efenniht/LICENSE          |   25 ++++++++++++++++++++
 .../efl/elementary-theme-efenniht_svn.bb           |    4 ++-
 6 files changed, 88 insertions(+), 5 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
 create mode 100644 meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
 create mode 100644 meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE

diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
new file mode 100644
index 0000000..61bb2f6
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht/LICENSE
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
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index aaa2e14..5dfc7c9 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
 DEPENDS = "edje-native"
 RDEPENDS_${PN} = "e-wm"
 RSUGGESTS_${PN} = "elementary-theme-efenniht"
-LICENSE = "MIT/BSD"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 SRCREV = "${EFL_SRCREV}"
 PV = "0.0+svnr${SRCPV}"
@@ -13,7 +14,9 @@ PR = "r1"
 inherit e-base allarch
 
 SRCNAME = "efenniht"
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http"
+SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http \
+           file://LICENSE \
+"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_compile() {
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index fa394f7..5dabea2 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -1,5 +1,6 @@
 DDESCRIPTION = "A theme for exquisite"
-LICENSE = "MIT/BSD"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 SECTION = "x11"
 DEPENDS = "edje-native"
 PV = "1.0+svnr${SRCPV}"
@@ -15,7 +16,9 @@ ALTERNATIVE_PRIORITY = "10"
 
 SRCNAME = "b_and_w"
 
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http"
+SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http \
+           file://LICENSE \
+"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_compile() {
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE b/meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
new file mode 100644
index 0000000..61bb2f6
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume/LICENSE
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
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE b/meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
new file mode 100644
index 0000000..61bb2f6
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht/LICENSE
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
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 1cf7bd5..5655490 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -3,7 +3,8 @@ SECTION = "e/utils"
 HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
 DEPENDS = "edje-native"
 RSUGGESTS_${PN} = "e-wm-theme-illume-efenniht"
-LICENSE = "MIT/BSD"
+LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
 SRCREV_THM_REV ?= "${EFL_SRCREV}"
 SRCREV_ELM_REV ?= "${EFL_SRCREV}"
@@ -17,6 +18,7 @@ inherit e-base allarch
 SRCNAME = "efenniht"
 SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};proto=http;name=THM_REV"
 SRC_URI += "${E_SVN}/trunk/elementary/data;module=themes;proto=http;name=ELM_REV"
+SRC_URI += "file://LICENSE"
 S = "${WORKDIR}/${SRCNAME}"
 
 do_compile() {
-- 
1.7.7



