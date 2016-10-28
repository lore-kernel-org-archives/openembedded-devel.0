Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 855C971AAD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 14:48:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 23so2122363qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 07:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ngCOGUhRBAilYvDRn4cT+DNpVs0r8KAUcTsJtdUXdPo=;
	b=CuZGkOlQqZELxXIur0GUHTN6UGksKDG+JnWXBi2b3zQUCdKmryZPftOw3eFHPaNE7D
	I4fRiVBsZE5hd/m7SELVa4eLdERxa73D1W6gGjPR4bDsqxDaORa0MnYW/RaTp2+hHkNz
	aULC6teOPKiIph5Y73HiKQCue0UF1jr5uH6x3B7Z/S6bMfIParWTSgwaj1NoMAIyN33w
	YykzSwPFbgt3rVvWPwbxQqY0en5tboH/Pecul8rUXkgCRJP/UrTXI8ohPj8fy+CYO/UH
	Fa+i727a+WmLNr4N/N70HRuNOjBxg0/7gNREt/xcZg1cJy/CsLDHWiJcvIT63xwBgN6X
	Eh2w==
X-Gm-Message-State: ABUngvcFZF1vBqVkd5jg3RRyNvjPVgpDc/eH9RFxIklGkA5/5rA13HzyLSi8fJ6x/RkIZg==
X-Received: by 10.200.36.154 with SMTP id s26mr12411611qts.0.1477666113780;
	Fri, 28 Oct 2016 07:48:33 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	y55sm6384089qty.23.2016.10.28.07.48.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 07:48:33 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Oct 2016 10:48:26 -0400
Message-Id: <1477666106-25770-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-msgpack: update to version 0.4.8
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
X-List-Received-Date: Fri, 28 Oct 2016 14:48:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-msgpack_0.4.7.bb => python-msgpack_0.4.8.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-msgpack_0.4.7.bb => python-msgpack_0.4.8.bb} (57%)

diff --git a/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb b/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
similarity index 57%
rename from meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
rename to meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
index a3f73fb..8a0ad8f 100644
--- a/meta-python/recipes-devtools/python/python-msgpack_0.4.7.bb
+++ b/meta-python/recipes-devtools/python/python-msgpack_0.4.8.bb
@@ -2,8 +2,8 @@ SUMMARY = "MessagePack (de)serializer"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 
-SRC_URI[md5sum] = "eb2aad1081534ef3a9f32a0ecd350b9b"
-SRC_URI[sha256sum] = "5e001229a54180a02dcdd59db23c9978351af55b1290c27bc549e381f43acd6b"
+SRC_URI[md5sum] = "dcd854fb41ee7584ebbf35e049e6be98"
+SRC_URI[sha256sum] = "1a2b19df0f03519ec7f19f826afb935b202d8979b0856c6fb3dc28955799f886"
 
 PYPI_PACKAGE = "msgpack-python"
 inherit pypi setuptools
-- 
2.7.4


