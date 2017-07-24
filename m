Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 09B64782A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:36:52 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id d136so10687222qkg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=odguxw2R2P56+iN5mujVKqb6uz88LzerxOCNgMJLuhM=;
	b=PLQtYYFI4WLAX4gYLk5JG8SO0rjjtCaA43rU+CFOwq2rG32+2S1/8aUsLzZy7bYmbA
	m8wHKsutzGGmaV4PY9Abw42I7B/uTvOftS4zedX57vWt++Ja8JwnfVus2UqDdLkCLzus
	LWHCj87EOfLrDDe7gxhYFOwJUSZA3hkPmBleIbLpMuhnCA2CbpGXeOwlK95Dy3bM3clJ
	LYXbgsajjphVMjzXEh8VMlMBii66xeZC6Uc/zwtr7Cnj/Oam3cMgDnFDu3Q966tQsvOT
	/LWC7uIBJQRo74fPPjNWMlBOPr8aFqXUyGw0Sdqi1zyUleuYWBqqp6yUbG8xB/hVGVEw
	M0/Q==
X-Gm-Message-State: AIVw1106RYhyR2jHs9Qh50sKb+LzgukyOVAKXlyu7flDr0bslOPFVufF
	KqyliTSAQmdhBB94AWs=
X-Received: by 10.55.145.6 with SMTP id t6mr22751735qkd.101.1500921413220;
	Mon, 24 Jul 2017 11:36:53 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.81.71])
	by smtp.gmail.com with ESMTPSA id
	m123sm8387922qke.12.2017.07.24.11.36.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 11:36:52 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 14:36:46 -0400
Message-Id: <1500921406-15581-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pbr: update to version 3.1.1
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
X-List-Received-Date: Mon, 24 Jul 2017 18:36:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pbr_3.0.1.bb => python-pbr_3.1.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pbr_3.0.1.bb => python-pbr_3.1.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python-pbr_3.0.1.bb b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python-pbr_3.0.1.bb
rename to meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
index b84836a..bdff867 100644
--- a/meta-python/recipes-devtools/python/python-pbr_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "c537dbb9756e319be25772b1fe1c05fa"
-SRC_URI[sha256sum] = "d7e8917458094002b9a2e0030ba60ba4c834c456071f2d0c1ccb5265992ada91"
+SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
+SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
 
 inherit pypi setuptools
 
-- 
2.7.4


