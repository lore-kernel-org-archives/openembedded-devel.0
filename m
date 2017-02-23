Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAF172FE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:16:24 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id x35so2528231qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=njTQUylFhElItRYdr8JpXcGnHl61Nq+Jd1aStL9kyUg=;
	b=apQzULxTsRhQehHLkEv9xybkyP4GrMkPoY/iNv1nPDfBvtj8Zwcbl5Js3u9/k84LKj
	TBgonIyUj25XZmUj6PiAt63H/K2FPxMHQQdjcaqWIKkmCBiBenO17wQ/IE1HoSXk5uqy
	GdgUEQsAOJX9LS+mUT6lbzFiCmJxm7Gx2/wPDbNLVYIiBC1cUOTXfsnfZ4NGJtSh8G3S
	3KVMrRAQMrgqgq/QZlymVm04Tt5Bne+aOHmmJgqqMmeMd2E90scZZcLNewCU5sioTwM+
	EOrXpjXtEw9JAbXpCUVfjcocMXPKKOCGRfyT2P5C4ERF8WEZH8mUhnbxloz6h1i7yHe/
	816A==
X-Gm-Message-State: AMke39mmtNxVpnizkmfjA6naWtsVH9pSDvyLodXbGq2JYMKkfBHoi5OAEubJ1d3enWHbaQ==
X-Received: by 10.237.60.3 with SMTP id t3mr2510122qte.86.1487808986322;
	Wed, 22 Feb 2017 16:16:26 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	j95sm1697457qte.52.2017.02.22.16.16.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:16:25 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:16:19 -0500
Message-Id: <1487808979-26292-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-pylint: update to version 1.6.5
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
X-List-Received-Date: Thu, 23 Feb 2017 00:16:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pylint_1.6.4.bb => python-pylint_1.6.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pylint_1.6.4.bb => python-pylint_1.6.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb b/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
rename to meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
index 2e34451..f5b4ad0 100644
--- a/meta-python/recipes-devtools/python/python-pylint_1.6.4.bb
+++ b/meta-python/recipes-devtools/python/python-pylint_1.6.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
-SRC_URI[md5sum] = "66ba9c27e067568bdabcdd7c21303903"
-SRC_URI[sha256sum] = "ef901a34b62ed7a734370ba5b162d890231ba8822abe88c6dda1268e2575f5f1"
+SRC_URI[md5sum] = "31da2185bf59142479e4fa16d8a9e347"
+SRC_URI[sha256sum] = "a673984a8dd78e4a8b8cfdee5359a1309d833cf38405008f4a249994a8456719"
 
 RDEPENDS_${PN} += "python-codecs \
                    python-contextlib \
-- 
2.7.4


