Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 89BB86CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 14:01:02 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 15:00:54 +0100
Message-Id: <1381500055-11483-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1381500055-11483-1-git-send-email-ml@communistcode.co.uk>
References: <1381500055-11483-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCHv2 2/3] libestr: add 0.1.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 14:01:03 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-support/libestr/libestr_0.1.6.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/libestr/libestr_0.1.6.bb

diff --git a/meta-oe/recipes-support/libestr/libestr_0.1.6.bb b/meta-oe/recipes-support/libestr/libestr_0.1.6.bb
new file mode 100644
index 0000000..ae29856
--- /dev/null
+++ b/meta-oe/recipes-support/libestr/libestr_0.1.6.bb
@@ -0,0 +1,11 @@
+SUMMARY = "some essentials for string handling (and a bit more)"
+HOMEPAGE = "http://libestr.adiscon.com/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9d6c993486c18262afba4ca5bcb894d0"
+
+SRC_URI = "http://libestr.adiscon.com/files/download/${P}.tar.gz"
+
+SRC_URI[md5sum] = "f48a7098080eebfe7842673c23dcd064"
+SRC_URI[sha256sum] = "b9c819d30397845fdf85bb1f37c52e81de23aa3b061ec6cc4386f1b942960153"
+
+inherit autotools
-- 
1.8.4


