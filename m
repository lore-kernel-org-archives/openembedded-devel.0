Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id D5B1376BA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:28 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MGj8j-1ZXyHN1zHd-00DVOv;
	Mon, 24 Aug 2015 17:28:28 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:52 +0200
Message-Id: <1440430077-551-4-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:Gl9GMA+aw0pkKIo8FBDrlxqtmUgb1IVteIoTkYGXfDOx36wuPn5
	sxdswl1+XabkMFiRLCx5eB/Uqzd09k1gasUzhqOZLpfCmGK1D0YhnvBZEjZpvcD/BhHWkkO
	6tbc3+7HJtIaz+54WdeXMTQ8PIqRP1uGWkwLEt9pebOsHiWf315qHMIwIpvj6mRNrNyqtIE
	2aZvcdpuI4BMlwvyGhjgQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lYtmDadD6pc=:uFKEkvCLLFp4cK5Ui4TYc2
	+gCrtBcwr1LhTFZM0RmKArS06osteYHUGIzPGxPse2gwYN0AIUfRiMPe+N/wh+ehuvwFcD4bM
	91icmV+OBMOT9dO2lm2M2HVYFhgM2UxXEAb+ntcRxK+dgPll+e9D9ba2Nqt8O4ut0P/EbSfyP
	Kcxf8JqdpmOwyAeVrA2YImhTJMVick4GF6i7mgmg+ljZcSnV3lhKpXReUK8yERtGo6y3VIhCI
	7UWdQdDPZOQfaI7QfD/looTV9VhCT7iLzPFtY6RYjeIQ4JJKKAgVE8QAhlp/sI8J1bDfE4Zjb
	37/VURhLz/fkEAWttnWhX1/WQZl47QcfZhWmzFZRst5fc65x0q1NbyZMb3QCSqtnol19RBYUU
	m33oKy0C5HkRI/3v536KehWIuN8IFUOYKIqKFFvEvUPdPgXOkiWZ/XCnymmvRzDLpS+Zj61Yi
	dCj7Svp8SicR9R6usC2O7Hb4CHAp0LbvE/tZd9GtMOMQheUuiU88hfD4VTTybhpfQgWiaw4KV
	LmKFRkXEa6XcB9eJac0bDMlpPQeJWq8NhuU8rI+TYs+l5XrYvAUel+gxzLSge8RevZc8QCfm8
	VUsZXbJULrRAOhShcpyNUuauoBypiy36XL7INNgjM5n8HaVBaBkZcWBbg+Tvu7EA2IzovncrA
	D3Q2opWyV4haVmvYcfDWCoEI0kqRd+haX0P48O96nknxpY6KlMd+RhQ/8IvbeRlpEpHdWgD7r
	KdV4Yc1FmIHuz5Mem8Hyfub8p19nnbWsu4SyLw==
Subject: [meta-python][PATCH 3/8] python-pyserial: Upgrade 2.4 -> 2.7
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
X-List-Received-Date: Mon, 24 Aug 2015 15:28:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The md5 checksum of LICENSE.txt changed due to updated copyright dates.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../python/{python-pyserial_2.4.bb => python-pyserial_2.7.bb}      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyserial_2.4.bb => python-pyserial_2.7.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python-pyserial_2.4.bb b/meta-python/recipes-devtools/python/python-pyserial_2.7.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python-pyserial_2.4.bb
rename to meta-python/recipes-devtools/python/python-pyserial_2.7.bb
index 2263b2c..276db34 100644
--- a/meta-python/recipes-devtools/python/python-pyserial_2.4.bb
+++ b/meta-python/recipes-devtools/python/python-pyserial_2.7.bb
@@ -1,9 +1,8 @@
 SUMMARY = "Serial Port Support for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7424386ffe323e815ee62ee9ad591dd8"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c557c64905dac5b725980b9505bf8d7b"
 SRCNAME = "pyserial"
-PR = "ml4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
@@ -18,5 +17,5 @@ RDEPENDS_${PN} = "\
     python-stringold \
 "
 
-SRC_URI[md5sum] = "eec19df59fd75ba5a136992897f8e468"
-SRC_URI[sha256sum] = "6b6a9e3d2fd5978c92c843e0109918a4bcac481eecae316254481c0e0f7e73c8"
+SRC_URI[md5sum] = "794506184df83ef2290de0d18803dd11"
+SRC_URI[sha256sum] = "3542ec0838793e61d6224e27ff05e8ce4ba5a5c5cc4ec5c6a3e8d49247985477"
-- 
2.5.0


