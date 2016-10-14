Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8BF6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 12:30:48 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id y38so3670584qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 05:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1U6N6KO1e12lavo77xtQVxxp7Q+ZVCQW4pzTf/8qRUE=;
	b=OTEnemBnaPj5/mqXqrpNhRUxRl2CgaNop4uO7kf7aWENrTVJpdRV1jEFEqAXCQKvKp
	eIR83Uyp5MFx2KBU5BgUenad+P5M9IhlLO9l4PbuU1UuoRVZeFE3FjmyvZHmgGkMagmN
	sintlXV7hyiqMQC9miW0zPjv7ZLtiOtySMawZ+FLxsUGhV5RHHYsbFEMgCeM/GTjWYok
	JrsWIHqiLRnEvZ0pMhwjX4zBk0xna2TmP2snfWJBLjHU8SR9sj8MUC4LnBvVllbvqxfS
	fmcUEySNbz77hxC3Nx+7NCfFvljJUdisv00O3hqvHLEoIcqdXezwtFNmJyqLxekUZ8eV
	m3Qg==
X-Gm-Message-State: AA6/9RnhzTX5hWRaHqS4PIBMhjKqfjJv31QFzaEO3rwyKgqnN73r76iE368Ea8MU14JckA==
X-Received: by 10.200.45.170 with SMTP id p39mr12275872qta.32.1476448249777;
	Fri, 14 Oct 2016 05:30:49 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	z188sm7443888qkb.8.2016.10.14.05.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 05:30:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2016 08:30:33 -0400
Message-Id: <1476448233-29420-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dbusmock: update to version 0.16.7
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
X-List-Received-Date: Fri, 14 Oct 2016 12:30:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-dbusmock_0.16.6.bb => python-dbusmock_0.16.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-dbusmock_0.16.6.bb => python-dbusmock_0.16.7.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-dbusmock_0.16.6.bb b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-dbusmock_0.16.6.bb
rename to meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
index 4b3d201..fb8c0aa 100644
--- a/meta-python/recipes-devtools/python/python-dbusmock_0.16.6.bb
+++ b/meta-python/recipes-devtools/python/python-dbusmock_0.16.7.bb
@@ -6,8 +6,8 @@ AUTHOR = "Martin Pitt <martin.pitt@ubuntu.com>"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[md5sum] = "6af369964653098f2cd5e7c4e060a533"
-SRC_URI[sha256sum] = "87c551030369005a6c818d9f27e931090bff837e70af060b65281e9ea77108cf"
+SRC_URI[md5sum] = "80f8caa838fad96483a8751e11d384f9"
+SRC_URI[sha256sum] = "2d2ea892fa4633c3ec6ac1e912120ec493047a5c6522849b7d1c95ad755bce75"
 
 SRC_URI += " \
     file://0001-Add-functionality-to-add-own-objects-to-internal-obj.patch \
-- 
2.7.4


