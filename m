Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id ADBB2784EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:56:44 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id x58so11561584qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jDqtZEgaK69LUiS+vGjR9uDqNddVPVGBnBFHwMjiJO0=;
	b=jm4s29Ac/EekPOPl6TvTzzZcnTXX1NR7vV7wivuDDJ862aZltC/IpR9vUxxrthaZK5
	RMysaFQuj0Jmm/hoAPWPmABxHSCk21LamRJhuI6hv/VYtMrHGzURXiE6QDzEn7hjV1II
	x3XJNiWiAQc+SyQAjB4F6tKW1YYLq52pZGjmuMQYaJ62aDMAJ1wMZkrxqLdxrIPkiAjO
	YfjXy74TJf55rPH1dDKl2tTqMMPMd9C+4GZh8MmzSkaSzVxRP3nHgThktJ8JsJgTPd8u
	Cd1dw0CqrYG82Din4ccqrzhJDVKKWrqag9dE1cAK2TNWG9XWST2nLKwmRWDglhg04jjs
	ytRQ==
X-Gm-Message-State: AKS2vOzIddGk3XJzpHOudz4ge/aruXlswvRuhq6HdU1r/ufRLjEdJjNP
	UC8+hn7Ovc9oJIzTHRo=
X-Received: by 10.200.58.38 with SMTP id w35mr13302174qte.93.1497632205352;
	Fri, 16 Jun 2017 09:56:45 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-43556204.dyn.optonline.net.
	[67.85.98.4])
	by smtp.gmail.com with ESMTPSA id 7sm1752740qkm.60.2017.06.16.09.56.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 09:56:44 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 12:56:36 -0400
Message-Id: <1497632196-32292-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pbr: update to version 3.0.1
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
X-List-Received-Date: Fri, 16 Jun 2017 16:56:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pbr_3.0.0.bb => python-pbr_3.0.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_3.0.0.bb => python-pbr_3.0.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_3.0.0.bb b/meta-python/recipes-devtools/python/python-pbr_3.0.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pbr_3.0.0.bb
rename to meta-python/recipes-devtools/python/python-pbr_3.0.1.bb
index f1660ea..b84836a 100644
--- a/meta-python/recipes-devtools/python/python-pbr_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_3.0.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "b9ef99a98350a57bbe55b1142807f224"
-SRC_URI[sha256sum] = "568f988af109114fbfa0525dcb6836b069838360d11732736ecc82e4c15d5c12"
+SRC_URI[md5sum] = "c537dbb9756e319be25772b1fe1c05fa"
+SRC_URI[sha256sum] = "d7e8917458094002b9a2e0030ba60ba4c834c456071f2d0c1ccb5265992ada91"
 
 inherit pypi setuptools
 
-- 
2.7.4


