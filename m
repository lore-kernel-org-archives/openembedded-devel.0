Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 052FA770CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Apr 2016 05:39:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i204so1222167wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 22:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zLBjEyR4yYLxJIHXvSgu8vw5VJd0FJLsLcoYrsZ0Fhw=;
	b=hipxOgwWnVyInDDhv+vgoEsgKu0opNqdZCIyvLWiHGTiQhJraxKxAYJVnNaNGa9dI6
	KggFlW1oujDQnpPjOQA5ZawWBD/F4aSzHFv7m2BhXO/M5YB76zxH+P4koyi2pIMFamXK
	q+v9CmIWygd54HT3o7QcLfOK2c9stH0dlpwe8bKntgDHcwjOAY0SjwrQVwFjVC52+IfJ
	ARoGwzlrbP+Lc/9HVD0QKlOk9cokTmRI/Xyi+nPwnB4rqJYtp6/4blXdl7FGCZ/qXg0d
	UuhGCBdY4R4qf6PHwo3ItmeXRT2Enn3NcuuJVxSI/ekPVeY/AC8xjbKxqXzO9ffa2wlw
	NMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zLBjEyR4yYLxJIHXvSgu8vw5VJd0FJLsLcoYrsZ0Fhw=;
	b=ZIWehOJwSM0l9EhIUap+NPvAnnO5w6YQlDYc5sEOKAQD1cUbRLx7E645awynVYQHD9
	AyIU+jSvokWRtDIiMpGFUeUKq8/lxh7FcUF/SpQHFYcPz+ctBi98kLQ79sS1HCYMu3jD
	rHajI3VNFx3CJyVTb06z6LqUVV20MSn3aEmkRZv2b9U/mhFegcHNaIiVLk5VjoIgHvMs
	ue7XrweaHVznJQcMT4EEGSQl9qS0q96dJ5XqAtG0Xgdba0mqyEUYaIFDW69S5WDXLro4
	ncihTVBYPCbmGaaCHhImN2tcyhpzSGSw9epoS8qQmIcdhxnjqhxl6m91yg6/yMkoq5Lz
	Sc4w==
X-Gm-Message-State: AD7BkJLf1fvttY6uRtVTzjcDf74FeKI+E4QEuQMrCsHeKC35deKuR5TRCUImduX4eJIUTQ==
X-Received: by 10.194.216.40 with SMTP id on8mr23043843wjc.40.1459834759638;
	Mon, 04 Apr 2016 22:39:19 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0B5A.dip0.t-ipconnect.de.
	[79.223.11.90]) by smtp.googlemail.com with ESMTPSA id
	gt7sm32641516wjc.1.2016.04.04.22.39.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 22:39:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2016 07:38:38 +0200
Message-Id: <1459834720-17165-30-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
References: <1459834720-17165-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 29/31] qtquick1: update sources to 5.6.0
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
X-List-Received-Date: Tue, 05 Apr 2016 05:39:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LICENSE.LGPLv3: I checked git repository. To be honest: I have no idea what
caused checksum change.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qtquick1_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e0a264d..ac13c77 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -7,7 +7,7 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
+    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "87f2415adf34da08e6cd58f5da6f6a7d0d9cf141"
+SRCREV = "bf4efac4ed2f3b1ff11fd1361506dec3c2a8726c"
-- 
2.5.5


