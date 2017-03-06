Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 86E9D72F4D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 16:05:42 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o135so4663794qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 08:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XlzKiMXyXZo7oxo5JENQs+98XKGLwlIW3P4McFzgb2E=;
	b=TOsCcxJ31myI405wiubXtacXLvKN1Q+CgOHgX3yRqV+rBOFmmi1kW99MBcKJRXiskR
	ZmsEVhtoiq73rICOFZazAHzCt5earmd7ZN0pFclG8OcEZsP6x8lBwlpugQ85U9YC8+yC
	YuFAO5D/QaMYdtUAOeLcI2x0XPhGsquwZmrYUd89Wzut9Vyfor7HNJYP1UT4dXqydYe8
	uQwXSPAEMpCOkW1C3mXVy+ytNx7HXNNw5Mmtn3PPwbpOFHDNI5zya2eBpnZ+pw/i9Hp/
	/73m4lM37y9S7y3SX9YvVTHcQmyueDCN7ORXR+6zEe9cpzejYnq2LKu5f4y5XpyraSMt
	tX5Q==
X-Gm-Message-State: AMke39kZLG3lHqwmt8GyamHaFovZTcH6v7jPJU/hVF0EruRkBzrBsDV7F+f+NNSWoz0EkA==
X-Received: by 10.55.133.1 with SMTP id h1mr10121647qkd.266.1488816343070;
	Mon, 06 Mar 2017 08:05:43 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	a39sm13629107qka.43.2017.03.06.08.05.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 08:05:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 11:05:36 -0500
Message-Id: <1488816336-5081-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pbr: update to version 2.0.0
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
X-List-Received-Date: Mon, 06 Mar 2017 16:05:43 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pbr_1.10.0.bb => python-pbr_2.0.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_1.10.0.bb => python-pbr_2.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb b/meta-python/recipes-devtools/python/python-pbr_2.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
rename to meta-python/recipes-devtools/python/python-pbr_2.0.0.bb
index 7fddf7a..a044a9e 100644
--- a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_2.0.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "8e4968c587268f030e38329feb9c8f17"
-SRC_URI[sha256sum] = "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c"
+SRC_URI[md5sum] = "dfc1c3788eff06acfaade6f1655fa490"
+SRC_URI[sha256sum] = "0ccd2db529afd070df815b1521f01401d43de03941170f8a800e7531faba265d"
 
 inherit pypi setuptools
 
-- 
2.7.4


