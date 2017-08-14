Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B04A60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 14:18:55 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d136so9426576qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 07:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UgQSDx1nTtm+qTcnrW10gygP1fxl4Xyr+tMIm/NwsSU=;
	b=B0vW6WJcCRFJIa0ELg3kS7zCFxemkmS8s6EUUWd+ueVpAt8PIlnYFbeBESSoF8WAiK
	F8i4WyMTR1BKFBIMKSxgelMDuj6b+PUI1OjjPZqjp1qfsRYauK8j4nd8NnXpn+BLzR0v
	hrcvfejm9CLmzqlRPk/bIJ5IucUNXc45lsyR+6uM0z7wEUFAGw8aFzB+XRKE7HG/R7+b
	TRZMnuN8XMQfBSUXcQ0bH8z0zRhzRG/+N5wVxd+o8xkxMBbA519tQuYyGlSlM3tcRknk
	6wfkrt2gFxOe7rfXPmM72ktPStpQydIixbs6DHNbSDcqEJz3zxDabgQXk7/A7dH3PtwY
	KN+Q==
X-Gm-Message-State: AHYfb5i39n5ZlCfxBMjKGLtn1CTthlx2eX256T4srEcvJYUyE8nUh6Qp
	EYgatN72e8JIcBwEH6I=
X-Received: by 10.55.159.201 with SMTP id i192mr2288307qke.27.1502720336712;
	Mon, 14 Aug 2017 07:18:56 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	c39sm5506689qta.40.2017.08.14.07.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Aug 2017 07:18:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Aug 2017 10:18:47 -0400
Message-Id: <1502720327-21640-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyro4: update to version 4.61
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
X-List-Received-Date: Mon, 14 Aug 2017 14:18:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/{python-pyro4_4.59.bb => python-pyro4_4.61.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.59.bb => python-pyro4_4.61.bb} (70%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.59.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.61.bb
similarity index 70%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.59.bb
rename to meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.61.bb
index 834f7a1..bda2dc7 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.59.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.61.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
 
-SRC_URI[md5sum] = "a93a41038dba964011772e0d3e4651a0"
-SRC_URI[sha256sum] = "6a39dadbd2a83b6fd5ab7f5402f8a4befd467b5c0404b8610a8797f748b72a38"
+SRC_URI[md5sum] = "34b25f257db2318072d1683c4a4f1ba2"
+SRC_URI[sha256sum] = "c465cb2ea2a90b887988d4249de8c0566bdfb16101fdc570e07e598a92e94d1e"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.7.4


