Return-Path: <marc.ferland@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9553177E3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:10:34 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id v193so3330437itc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O0fPfAmMy4MUPMtfUAbe9GfT88Yw/04QAcdNpoyfrgs=;
	b=KUMOzZojtvmCCK0GQtrcjuG6vam6G7IZgQR/tWvZls7x9Bj3TYdHhCweqVZN87sBzr
	4o3a/gq7IrRlnb2HP5Ah1r0iIHbhkZQflas2bjPK3DfG+escVKGtwcuGid7Gvm/CD7yk
	rrut2yYDVAiCNVPxbCUT1IbsttUkctGLnTmI0Xhx3S04LCOomT9aV5wEVb3HIOCemg8p
	uLPzlUkS+ugr/znkB+/NKBCjwBXyErU6ehH/0rHx2u1oLR+FoWpYO+Kg4FLAp8d47uRX
	9Nt8u9m16iJkvaHOO5Q20LG3187TmcuSp/zo6om42ShzG4JZ9r/RtSusK++qETlFsZPJ
	Vg8A==
X-Gm-Message-State: AIVw111zn6/cbxvzG/0XviYbsA9ToonZpA6U4BomGuyS0KpuJL0mcGpu
	x1vR1kGW0rL8rHYI
X-Received: by 10.36.54.205 with SMTP id l196mr17047948itl.94.1499782236063;
	Tue, 11 Jul 2017 07:10:36 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	i139sm5303190iti.17.2017.07.11.07.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 07:10:35 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jul 2017 10:10:05 -0400
Message-Id: <1499782205-6894-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] proj: update to 4.9.3
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
X-List-Received-Date: Tue, 11 Jul 2017 14:10:35 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta-oe/recipes-navigation/proj/{proj_4.8.0.bb => proj_4.9.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-navigation/proj/{proj_4.8.0.bb => proj_4.9.3.bb} (70%)

diff --git a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb b/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
similarity index 70%
rename from meta-oe/recipes-navigation/proj/proj_4.8.0.bb
rename to meta-oe/recipes-navigation/proj/proj_4.9.3.bb
index b4bfaf4..f45f894 100644
--- a/meta-oe/recipes-navigation/proj/proj_4.8.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_4.9.3.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
-SRC_URI[md5sum] = "d815838c92a29179298c126effbb1537"
-SRC_URI[sha256sum] = "2db2dbf0fece8d9880679154e0d6d1ce7c694dd8e08b4d091028093d87a9d1b5"
+SRC_URI[md5sum] = "d598336ca834742735137c5674b214a1"
+SRC_URI[sha256sum] = "6984542fea333488de5c82eea58d699e4aff4b359200a9971537cd7e047185f7"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.7.4


