Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAFF774EF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 00:47:28 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id x35so961016qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 16:47:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Kd2N/SsCEfKmguLvq+javePp7qHsn4BD1ZOidSQAofY=;
	b=ZRvDDTdFFhph2TpnlC0Iadmh0IAKOqmm7AhZqkhqk5//fw+T2lvGSBiTnu0TtzCkLV
	EbnkqCbCV/BMV4xQh6COjGEnvlGKci4HcImA6jYJpkYCuZA8Bci6PkX8iThlLPI1XMkl
	kyzbtz7HVi8vPwLmZVDs45RDqqzU/fpthqyQbV98KFoBb2OVkO8BhPK/NNldepz3hLnC
	+pbIPEW2fDjXATJicHThfMqnG0VaIarn8Zi7QtS5q6HzX7QA05CXfmJBWRg5I0Qo/qTi
	3Xv6awBSGhDRBdAuiDO+GAK8aqnUkZ9IFFo3QxS9jRbu3D6xYAnw29qaYt3e5m15q43b
	ViiA==
X-Gm-Message-State: AMke39kdGyd2fJ2kb4xewKkKpfEpnGyhCdcNpzVuu5pOycJq9/qNM2h6aovljVPFX2P6bQ==
X-Received: by 10.200.56.48 with SMTP id q45mr4012101qtb.220.1487897249788;
	Thu, 23 Feb 2017 16:47:29 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id v2sm3770761qte.61.2017.02.23.16.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Feb 2017 16:47:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 19:47:19 -0500
Message-Id: <1487897239-27247-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-django: update to version 1.10.5
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
X-List-Received-Date: Fri, 24 Feb 2017 00:47:29 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-django_1.9.7.bb => python-django_1.10.5.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.9.7.bb => python-django_1.10.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python-django_1.9.7.bb b/meta-python/recipes-devtools/python/python-django_1.10.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python-django_1.9.7.bb
rename to meta-python/recipes-devtools/python/python-django_1.10.5.bb
index 8693da8..11242df 100644
--- a/meta-python/recipes-devtools/python/python-django_1.9.7.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.10.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.djangoproject.com/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
-SRC_URI[md5sum] = "7de9ba83bfe01f4b7d45645c1b259c83"
-SRC_URI[sha256sum] = "2b29e81c8c32b3c0d9a0119217416887c480d927ae2630bada2da83078c93bf6"
+SRC_URI[md5sum] = "3fce02f1e6461fec21f1f15ea7489924"
+SRC_URI[sha256sum] = "0db89374b691b9c8b057632a6cd64b18d08db2f4d63b4d4af6024267ab965f8b"
 
 PYPI_PACKAGE = "Django"
 inherit pypi setuptools
-- 
2.7.4


