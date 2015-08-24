Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3E676BA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:28 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0M2c1V-1Ye8b318Zp-00sQHJ;
	Mon, 24 Aug 2015 17:28:28 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:51 +0200
Message-Id: <1440430077-551-3-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:gRrPkoWxW5YSDb9wJ0eHL+fD4sevQOGErGYKwRtJi4Gmk5KCO+h
	/tOOG6oxHsrSBan0rfFkbl0rv4shJkNH5l0FsWUmLxW7+HdQgTYL74InruJzqZl1AMd/d/q
	ZXKnco54LcTLq2T9UmH+P8XKOF0ttDPGOdvAdeiMyC+JR1/r9Sl1roa5hBsdiGWvZJ5ko5I
	8K4CruVrVfMrcdjbSdxUw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:yrlB4FBxC0o=:ArTeofTvY5vIl6/D2u/t/C
	B8uxHu3vbL7h40wY+j/oS/2rh2wwce1mVZ6qsAD/Yzh2kDqYfcEOLX005HbIFokHYyqLmf50T
	yrzA/seaZUS0HpIF3cxGXWy3yLhD5qFpxuTJ3gRPNT9RVMkGzq7q3j8cl/X5d02vvS5yaiDSN
	CR60aDXioliieKzJJmH8I2eOBBCGGum2hRtXHPBOoBTATVf77R1lvmUGB7LrPOeYv0FVYSzYz
	ggbIaap2EMDDdH4bSvfvyQJx5KYEDK8MDMQD/8qlmQ2JGY73z8AbtHM6TSagHu9q5OmmPj6IC
	u4aS1iM18cE1PvBKBOqWDkt3ikbkalfvQkzv0lQ+cF9Pbk0eteoEFMIW/RL8mcwvqVpyUdFLi
	wq6gx2unJhvYpTcPXZjvUZcVi7zwaiEEgHZy1/+pNdVGpd9g1P1wpXXoYK9AVpLHSi+5D8Xam
	FbGFFeANMUK5q9FIVB/g086W4Bnmj+BdbU7IL51/lW+gxH9+PRoXpv21emfGmzwVATjP7Im1R
	SneRfJqCWNZ8/vVbQp67LumIBKh5W54L3biXRnzQq0CoUD7gMonwQaLYIVHzYqPCFtEdCvZwp
	Mu4HSV2r9mZ4HiJf8sLQxDOd3DVhLwMsWADIWPZQ8aW9e+ZGpKej8ckKEXnLIiyrrE/6hCLWT
	TGkme/nYUX4Y1Qc0tUm4IW4gaSHJVtVcUlHhZY1K/R0p7AIx/KrEu6c1rJ5T99yuG+MhTlZmQ
	PeW6x25hp7lkDAtHUjyQTrVIdKcsg36AF2IFHQ==
Subject: [meta-python][PATCH 2/8] python-decorator: Upgrade 3.4.2 -> 4.0.2
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
X-List-Received-Date: Mon, 24 Aug 2015 15:28:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Change LIC_FILES_CHKSUM to use LICENSE.txt which is now included in the
tarball. The license itself did not change.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../python/{python-decorator_3.4.2.bb => python-decorator_4.0.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_3.4.2.bb => python-decorator_4.0.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-decorator_3.4.2.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-decorator_3.4.2.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
index 7031857..bda0d71 100644
--- a/meta-python/recipes-devtools/python/python-decorator_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python-decorator_4.0.2.bb
@@ -9,7 +9,7 @@ decorator, just because you can."
 
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=104961fab4bc3ef8d0640bb37641b473"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
 
 SRCNAME = "decorator"
 
@@ -18,5 +18,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
-SRC_URI[md5sum] = "9e0536870d2b83ae27d58dbf22582f4d"
-SRC_URI[sha256sum] = "7320002ce61dea6aa24adc945d9d7831b3669553158905cdd12f5d0027b54b44"
+SRC_URI[md5sum] = "033c9563af492c4ce2680ee6ca481fa7"
+SRC_URI[sha256sum] = "1a089279d5de2471c47624d4463f2e5b3fc6a2cf65045c39bf714fc461a25206"
-- 
2.5.0


