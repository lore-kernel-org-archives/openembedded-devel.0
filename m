Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id EC3C0733FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:30 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so12865024wes.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=j5hsNX64xyzq1sZ9ne5twU4UH8iOaAGYMGiUj+cCgGk=;
	b=Yiru6hpbYN7mCHAu0wUlw4oR9gFrXm2lyG4UsnY9NUXalfhYc+2RFJ0owBVcVdjKEi
	U+Lx3Bh9PvqIHip59Jja1JNtUqVXj/Y8ggbd1RGUw4qUw3QaWaY1rRT3ey9tbGR6wT94
	lmHgiT7pVOHEBGTL/48swMbmpBJ61cvXqwL0TCwHCHXw8vC6O4om3pNU1rhFo5lixV1q
	TjF3Wx+Zlt2C0V4BqiVpSpC7bvqTxczi+g02r3PVMqGDXTSYyA6UB4U5pFOIxpEmw/vN
	WoK3SAj8F8jVFwZGn35sVMsrBIeIkebctwqhD2aGQ08iAzaMnnalqNAVekAw2YfvIeRj
	wbNg==
X-Received: by 10.180.207.237 with SMTP id lz13mr706718wic.15.1423776151532;
	Thu, 12 Feb 2015 13:22:31 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:53 +0100
Message-Id: <1423776119-14981-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/19] xfce4-eyes-plugin: update to 4.4.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Feb 2015 21:22:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../eyes/{xfce4-eyes-plugin_4.4.2.bb => xfce4-eyes-plugin_4.4.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.2.bb => xfce4-eyes-plugin_4.4.3.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
index f1ed6c7..2ac63f9 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "1ef352c68dd8929c9e8743200b758b3c"
-SRC_URI[sha256sum] = "dad102fedd0d9e6df45338a018387b2aacaf24b05eb798275be0dfc05ffa3021"
+SRC_URI[md5sum] = "86ae8bce96e028921fcc0ee8424ff565"
+SRC_URI[sha256sum] = "4b9a335bcfdb8e4e2f6aedb3556575e5331f181912565f4289e354126230817c"
 
 FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
1.9.3


