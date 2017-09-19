Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id A1E517806E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:57:36 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id t46so2473960qtj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 07:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2GRuF5Zyj1HY17Vo38CJiJKi0EC+V6JY3VWFdfTK+vw=;
	b=ZViOuS5nQ5OBYDGsrQ9x+RpkVR0TVZQIg/VDU72zLmyNItR0LE1sRWtgeCO5FPV2SR
	J/OAewzl5yMoWVMBCSO9loSvKupz/y9NZ3EWX+tJSUW42NKwNFHEpNW9zfpdvby6j0Cm
	YsQiAFt5McItTuc7MnY+jp9gYy1nNRXLrYxeJSI2FKKtG+RgUT1/w16qkGZlRY73FdZS
	UELuDj+6hBwvGH39HY3UsKtfRJmEhy15VI35lls+iMMytlqD6MNDli0S8dECXt+Nbgby
	SVicMv+c7InFljF6eNaZKu4U9ihPb7BGXTtTjW3z0orStF7ErXhV/aWLj734Y4N6aH9Y
	n0YQ==
X-Gm-Message-State: AHPjjUi9TsVGSyLSdgF2PArlKJsVjYLXblHiDiuNA7dacyLH+tebnKdb
	IVkYXPot5jZHWPeTcaZTX1+kcsvD
X-Google-Smtp-Source: AOwi7QDily6qMl4eXXfz/9e3KXb31y/tCtxwnFpQrdqGzuDHbBdjagXjjB3PGuw/7YgEVBJsOVogqg==
X-Received: by 10.200.55.40 with SMTP id o37mr2400580qtb.248.1505833057413;
	Tue, 19 Sep 2017 07:57:37 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id q5sm7414055qkh.43.2017.09.19.07.57.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 07:57:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 10:57:28 -0400
Message-Id: <1505833048-19814-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-multidict: update to version 3.2.0
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
X-List-Received-Date: Tue, 19 Sep 2017 14:57:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-multidict_2.1.6.bb => python3-multidict_3.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_2.1.6.bb => python3-multidict_3.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb b/meta-python/recipes-devtools/python/python3-multidict_3.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb
rename to meta-python/recipes-devtools/python/python3-multidict_3.2.0.bb
index 646cb77..c6556b3 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_2.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_3.2.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7837353cf71008484e99737ccf55a4ea"
-SRC_URI[sha256sum] = "9ec33a1da4d2096949e29ddd66a352aae57fad6b5483087d54566a2f6345ae10"
+SRC_URI[md5sum] = "a01da31ca1855557a1b2e053c933af2f"
+SRC_URI[sha256sum] = "e27a7a95317371c15ecda7206f6e8c144f10a337bb2c3e61b5176deafbb88cb2"
-- 
2.7.4


