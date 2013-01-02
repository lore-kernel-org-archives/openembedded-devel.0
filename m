Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKD-0006n5-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:46 +0100
Received: by mail-ee0-f46.google.com with SMTP id e53so6816709eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=gP+DlVlIIkaarxFWb7MK4dUWOBkUloQVb4B2Jz6P7wA=;
	b=JC2oDOGR1By1RrABrUwPTo/6fFDEf/vfovn7Qc9mg/OKzQY4YnPdtCTRgPybpGOsVL
	qgN0aTaq/rk43L78B7KemjFpNA/+UEMGDqGYI3gGENDlIemO9x0nxPpGpGTj+Xt4NPMh
	6yNS1kH+o9fNwNFdt+PEw+HCJic5TpBJEROG38oEKZvfEaSbVKY2/7kdQZik6NyP30tk
	xk9aryBzuSBw4s2o+j2NazOeGK+NEDVm3jyG/yC+thUH1Pr3TvuZaDfcevnBQWE5F95I
	7XKM9tC0kZePTGQWlxue7Z78J6Ec8jUZWJ/Vh/uQ2TzkM0hwIxSu7wJZypRWuGA9knwk
	DiRg==
X-Received: by 10.14.207.6 with SMTP id m6mr125440180eeo.10.1357136083729;
	Wed, 02 Jan 2013 06:14:43 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm97795403eep.12.2013.01.02.06.14.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:44 +0100
Message-Id: <0618ebdbecbe443ef35c7cf943b979625497fd8e.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/6] python-pyqt: upgrade to 4.9.6
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{python-pyqt-4.9.5 => python-pyqt-4.9.6}/pyqt-generated.patch     | 0
 .../{python-pyqt-4.9.5 => python-pyqt-4.9.6}/qreal_float_support.diff | 0
 .../python/{python-pyqt_4.9.5.bb => python-pyqt_4.9.6.bb}             | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-pyqt-4.9.5 => python-pyqt-4.9.6}/pyqt-generated.patch (100%)
 rename meta-oe/recipes-devtools/python/{python-pyqt-4.9.5 => python-pyqt-4.9.6}/qreal_float_support.diff (100%)
 rename meta-oe/recipes-devtools/python/{python-pyqt_4.9.5.bb => python-pyqt_4.9.6.bb} (96%)

diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.5/pyqt-generated.patch b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyqt-4.9.5/pyqt-generated.patch
rename to meta-oe/recipes-devtools/python/python-pyqt-4.9.6/pyqt-generated.patch
diff --git a/meta-oe/recipes-devtools/python/python-pyqt-4.9.5/qreal_float_support.diff b/meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
similarity index 100%
rename from meta-oe/recipes-devtools/python/python-pyqt-4.9.5/qreal_float_support.diff
rename to meta-oe/recipes-devtools/python/python-pyqt-4.9.6/qreal_float_support.diff
diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
similarity index 96%
rename from meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
rename to meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
index e248fbb..340796a 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.9.6.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
   file://pyqt-generated.patch;apply=no \
 "
-SRC_URI[md5sum] = "e4cdd6619c63655f7510efb4df8462fb"
-SRC_URI[sha256sum] = "75ff0a3a088ae22c4d6e8adb242f7e593104af93933cbdd9900bc7b06f46191e"
+SRC_URI[md5sum] = "514e1f9597771dc732ba75ba9fa5c6b6"
+SRC_URI[sha256sum] = "a350f9e5c6d8062671c0f29bf1a70824719b18175ce8372c29bf7c1eda44b18d"
 S = "${WORKDIR}/PyQt-x11-gpl-${PV}"
 
 # arm and mips machines need some extra patches
-- 
1.8.0.2



