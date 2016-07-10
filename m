Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3390D601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 11:39:15 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n132so13789893qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jul 2016 04:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=80+IwApo0VmAlTzaCtvTjwi5uowACnb4HehsBHvztmE=;
	b=Gife3m2pw/8iee36kVwL92Z2+OagDukw5k2FhJWRk3VxgKBGjh3WkayV7LsrbmD4Gi
	gzYyjvdNw5wuz7q0UcCg13HtdtsEEQ8HSRLNIuPO9pLpF6f1IsaUTWdliZxeaH1DCFat
	LJs/wvX0e5QVUmyafMP8GBGKaQ4Iwr+722tbQ3GBOXB0zcgbVlFsaq5iZyj1S1OO64vX
	qa771Xs01/aKJU4KzH7mFGStV0ARaRQDtMLuQ8mx0NvhlXbn6ICRWuYGZl7C8W6/CFyl
	ors7grytozk6A8mZ2Yp2GQVqcGhcKqsRuURQvtHvS1Q3mrKdjKbyUbJC9qCrLEremagm
	Dbpw==
X-Gm-Message-State: ALyK8tIL7tlog35y68P8mQ+dSAlwqzigYOKHiS5/zutBRMxCCFJc+gnC+BlwYC4J6W/5yg==
X-Received: by 10.233.239.87 with SMTP id d84mr19517894qkg.68.1468150756614;
	Sun, 10 Jul 2016 04:39:16 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id o2sm1597191qkd.0.2016.07.10.04.39.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Jul 2016 04:39:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jul 2016 07:39:06 -0400
Message-Id: <1468150747-14730-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-wtforms: update to version 2.1
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
X-List-Received-Date: Sun, 10 Jul 2016 11:39:16 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-wtforms_2.0.2.bb => python-wtforms_2.1.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-wtforms_2.0.2.bb => python-wtforms_2.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb b/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb
rename to meta-python/recipes-devtools/python/python-wtforms_2.1.bb
index ae605d5..a5ea283 100644
--- a/meta-python/recipes-devtools/python/python-wtforms_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-wtforms_2.1.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "A flexible forms validation and rendering library for python web
 HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e9377f5e4bfad82b40ed63f0fd4d1cce"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c459accc90c6ed6a94878c8fe0535be2"
 
-SRC_URI[md5sum] = "613cf723ab40537705bec02733c78d95"
-SRC_URI[sha256sum] = "10737758ceae03b53021f3aa7e81bfc8dd6f679c879ffeb5e64ac6570facb6c1"
+SRC_URI[md5sum] = "6938a541fafd1a1ae2f6b9b88588eef2"
+SRC_URI[sha256sum] = "ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f"
 
 PYPI_PACKAGE = "WTForms"
 PYPI_PACKAGE_EXT = "zip"
-- 
1.9.1


