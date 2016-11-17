Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 63F3671A8B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 02:20:43 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l20so13030602qta.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 18:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+CfIkqt4J7EXkPbyVdYB/AViYbKNqtZgkTG5TtYZl9M=;
	b=KnXQlPaSrp3YlDdRFWIOF989k8id9BkczFYarMeDwzw/v7Y0asCoRRqEub1dFVUS1O
	L6sAMZqR67CeZb2zV5XZ+CmFF+xJhxCvyai8qAP21f4ddMmdE48HZsqBdZSlpQwjR/rR
	vO/cT7wXOjE7e0lsYc1jhz72c7BFHBJ+FdH0YIGAC8Rf2s8la/ES1X94nBF0UiDL7SA0
	Eiy1HheJd10nSYLke4n6AgmFmoRK2r2dKsIL0J+Am2DRq/uLAZXnMx5TSQiY4v229lSD
	ledWqKqE93Ka6MJpDbYZ4fDfHz3Jcssq+ed9k5NT0xoCAvK+lTiam31+ITd8SXO4AM63
	e99g==
X-Gm-Message-State: AKaTC02XanU587+f377VjZcRI6fY/iVg5S0lVOPoX02SvkFSh5fW27MbiBYx0gBQ8k2qQA==
X-Received: by 10.237.36.17 with SMTP id r17mr409857qtc.216.1479349244979;
	Wed, 16 Nov 2016 18:20:44 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id 6sm409402qke.18.2016.11.16.18.20.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Nov 2016 18:20:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Nov 2016 21:20:36 -0500
Message-Id: <1479349236-23552-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-yappi: update to version 0.98
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
X-List-Received-Date: Thu, 17 Nov 2016 02:20:44 -0000

  * Verified license remains the MIT

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-yappi_0.94.bb => python-yappi_0.98.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-yappi_0.94.bb => python-yappi_0.98.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-yappi_0.94.bb b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-yappi_0.94.bb
rename to meta-python/recipes-devtools/python/python-yappi_0.98.bb
index 83f2bc9..02ec7d0 100644
--- a/meta-python/recipes-devtools/python/python-yappi_0.94.bb
+++ b/meta-python/recipes-devtools/python/python-yappi_0.98.bb
@@ -2,10 +2,10 @@ SUMMARY  = "Yet Another Python Profiler"
 HOMEPAGE = "http://yappi.googlecode.com/"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ad426a7287507a8db02778ff586d5370"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b131c3041637f6a5175a43112dde05c"
 
-SRC_URI[md5sum] = "a02c49efe783c4e31d6bbd805a37adec"
-SRC_URI[sha256sum] = "15cc17dba1252ecaae29ced1e96c216165d93fd3e9ea05dff1f5e5866f16bd59"
+SRC_URI[md5sum] = "dc56240575c99938a924eaeb7c0d8beb"
+SRC_URI[sha256sum] = "5f657129e1b9b952379ffbc009357d0dcdb58c50f3bfe88ffbb992e4b27b263c"
 
 PYPI_PACKAGE = "yappi"
 inherit pypi setuptools
-- 
2.7.4


