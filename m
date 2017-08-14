Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A94357848E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:01:27 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id u19so9656276qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Spjz2Vc6qtQd0N9iJKGsBNAf3QBQ/oz2DwKUIyjWyec=;
	b=lslGizbjV7+iwh0hfasQsnXlxfCpdnX1jbCvJkpgGm7SIQm8kb69eoJeCAjFk7UEp2
	qs9NmHwYILmQWdrUj9xYRym35cf+UU95h05A3UKogvBwU1XT3YTFBgC8CHF9lAwGW+nl
	JNeYZe37MUlKxSRBQtiCLinH/6P3TtAcg09v2P7HOmwcL3uhcmMx7IN+/HGqRD2jR7sY
	S4itvdlBTE2ntnQYJYjLmE9ldkZ2x2iQYvzLrARd80nlt7mJW56xMtktJoxdB4q6AIXm
	h6AP/W/8/qK2OgG983cWhoTZFNmDjMxqBw/3XbePXTSZ+eybPaKOx0SnhbNHNdaw2g5T
	rQJA==
X-Gm-Message-State: AHYfb5jrcXDxu2Pi2/2j2ETP/Bm4UQXmSH19NiZDSxfRjm7K8rX1FHTP
	78qYWUMkdWDX4A+vgGA=
X-Received: by 10.237.49.132 with SMTP id 4mr35048337qth.105.1502719288255;
	Mon, 14 Aug 2017 07:01:28 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	y10sm5258740qtb.57.2017.08.14.07.01.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 07:01:27 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:01:14 -0400
Message-Id: <1502719274-13424-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-wrapt: update to version 1.10.11
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
X-List-Received-Date: Mon, 14 Aug 2017 14:01:27 -0000

Update license checksum for copyright year modification to 2017

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-wrapt.inc                | 6 +++---
 .../python/{python-wrapt_1.10.10.bb => python-wrapt_1.10.11.bb}     | 0
 .../python/{python3-wrapt_1.10.10.bb => python3-wrapt_1.10.11.bb}   | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wrapt_1.10.10.bb => python-wrapt_1.10.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.10.10.bb => python3-wrapt_1.10.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-wrapt.inc b/meta-python/recipes-devtools/python/python-wrapt.inc
index 19668c0..c85548f 100644
--- a/meta-python/recipes-devtools/python/python-wrapt.inc
+++ b/meta-python/recipes-devtools/python/python-wrapt.inc
@@ -2,10 +2,10 @@ SUMMARY = "A Python module for decorators, wrappers and monkey patching."
 HOMEPAGE = "http://wrapt.readthedocs.org/"
 LICENSE = "BSD"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=82704725592991ea88b042d150a66303"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=61c27930012e86b3dc7e36f92e83c4d8"
 
-SRC_URI[md5sum] = "97365e906afa8b431f266866ec4e2e18"
-SRC_URI[sha256sum] = "42160c91b77f1bc64a955890038e02f2f72986c01d462d53cb6cb039b995cdd9"
+SRC_URI[md5sum] = "e1346f31782d50401f81c2345b037076"
+SRC_URI[sha256sum] = "d4d560d479f2c21e1b5443bbd15fe7ec4b37fe7e53d335d3b9b0a7b1226fe3c6"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb b/meta-python/recipes-devtools/python/python-wrapt_1.10.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-wrapt_1.10.10.bb
rename to meta-python/recipes-devtools/python/python-wrapt_1.10.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.10.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.10.10.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.10.11.bb
-- 
2.7.4


