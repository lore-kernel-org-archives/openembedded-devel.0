Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6748478847
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 18:47:29 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h42so7963505qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 10:47:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8hg3Q43eJyFtCyOu4PlyovxTR6Iayuyvn4oX79Czbh8=;
	b=PnMq1sp2cHm4uvSTJNvubwiEp5Ydf0EozEVoRpoeLYgP7t47Kqty5cnQ8ckawTL25q
	lOQh7nhTB/dGcJTCknjoe5/sW6IxMnr70/i6GhRMdh4Zwxvg92Y+6nSylcBzm6aO9NFM
	ECraPPI08uXNV+luixk39Zpc4TgxvROO41Tlg4MzQzAGYonqfBw7uER6E+rK3Hdj8MUq
	delH7axyi7HMng4n60/rVuaScCEyKQUGUR9VAXptIltQbe6Vjkhh4N92HxhhbMFaLylr
	DjNk4CbpaWN3wO1R30s591US65yD+AkyQnN9n26+rKeuhVVn0BqyWojjbDK1cDgefNsx
	EjcQ==
X-Gm-Message-State: AJaThX51OtqU8PJs4GSEQuV1eIQtYwrWg2SW2OXS2abgeUq3Tc9LXfgd
	siHcTQXhzzjDe/C6dXqcN2jPvzJV
X-Google-Smtp-Source: AGs4zMZPP9z8AF1dOqda1qFTx9UKjjsYH4oy7sIVwqvbSXMH3kvqNqcVBKEroLcKFZNmUoIz8/tyOQ==
X-Received: by 10.237.35.76 with SMTP id i12mr9659827qtc.276.1510944451002;
	Fri, 17 Nov 2017 10:47:31 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id k9sm2923688qkl.10.2017.11.17.10.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 10:47:30 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Nov 2017 13:47:23 -0500
Message-Id: <1510944443-28708-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pysmi: update to version 0.2.2
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
X-List-Received-Date: Fri, 17 Nov 2017 18:47:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pysmi_0.1.2.bb => python-pysmi_0.2.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysmi_0.1.2.bb => python-pysmi_0.2.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb b/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
rename to meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
index 33a387a..24759b5 100644
--- a/meta-python/recipes-devtools/python/python-pysmi_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python-pysmi_0.2.2.bb
@@ -8,8 +8,8 @@ SECTION = "devel/python"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d8b1bbadd635f187dee74d999a8c67b8"
 
-SRC_URI[md5sum] = "f8754e9ed75698cc16b40f125df85b12"
-SRC_URI[sha256sum] = "e0912180fc6faa9c264df78f97e7c451f77f84f5bd840098d2ce7b1bf70082bc"
+SRC_URI[md5sum] = "3b0f71e4e9f730d211f09d8ef5371140"
+SRC_URI[sha256sum] = "2a315cc3e556b3428372b69da663a24d2f0df9e9ab075b022cb133855f25aef7"
 
 inherit pypi setuptools
 
-- 
2.7.4


