Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5441B7883F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:39:43 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d125so484903qkc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 10:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mIAG3oQR32BedguBm0vjtOJvQ+E5NjDVQH2sH1K+XKE=;
	b=PS1H+zOHDY7MGDtFXZaE6y8EmW+evzrECCvg6nxZyHuxRxbnA2rZcoEy6BzAtohArG
	CpEcBQENVVb6zbYRXn2IDLBiPCRoEYhLJdZeCzVO43p/ogK5Mt6ACe2PtWBMEfg2CdLo
	d7LAATMEC9EmQMZ3i5C5ALvkSKNAZ0JKdQmOqFGVbBACXq6/c6zG+gxpGL/uXwW6EGp0
	d+zsjWqOl0s2xACQDtQkcZGsah+0CSzicbUDWSLif94cevqkYtGs2i8CIruX9QVi0aZ5
	7Yja2WZxVXQgibfcY+glggPavTOo+6BQ88Znd3FUKfeZgkPy2PckMHGuzXS9DGcQvACb
	9CUQ==
X-Gm-Message-State: AJaThX6xpdlzPDtmGLTJxWliiyQG/ZuwO0t+gOVlrCSMfYS5J2+mjAGq
	3lJihB2UmwZy2++7szogFfvem+WR
X-Google-Smtp-Source: AGs4zMaNKM9TFO1rzNQvKydFUksQFkgCYg1IkwelhntQYG0JRrosvsQc8hTAMVoBPZhdx774UdXB8g==
X-Received: by 10.55.34.135 with SMTP id i129mr9140906qki.86.1510943985030;
	Fri, 17 Nov 2017 10:39:45 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id d5sm3023373qkf.44.2017.11.17.10.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 10:39:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 13:39:38 -0500
Message-Id: <1510943978-27168-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyro4: update to version 4.63
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
X-List-Received-Date: Fri, 17 Nov 2017 18:39:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-pyro4/{python-pyro4_4.62.bb => python-pyro4_4.63.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python-pyro4_4.62.bb => python-pyro4_4.63.bb} (70%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.62.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.63.bb
similarity index 70%
rename from meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.62.bb
rename to meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.63.bb
index 041c4ff..6f683e3 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.62.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.63.bb
@@ -2,8 +2,8 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=378acef375e17a3bff03bd0f78c53220"
 
-SRC_URI[md5sum] = "6e2fef3dc8b29773a87abbaa8e9abe15"
-SRC_URI[sha256sum] = "e301edfb2bc47768b7222a68cae8de8be796d1d9f61cdbd1af9039985ed5009c"
+SRC_URI[md5sum] = "e1d772b67bf7c6f75fa3174bc95c8839"
+SRC_URI[sha256sum] = "67d2b34156619ba37e92100af95aade8129dd2b7327eb05821d43887451f7d7b"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.7.4


