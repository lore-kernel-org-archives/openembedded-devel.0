Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 13DAF60034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:36 +0000 (UTC)
Received: by wixw10 with SMTP id w10so21273769wix.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=AtMl/BJRenHhCBlaKA3qqJ2LPKDITMvRFnrYfV4uYiQ=;
	b=vjhxxlTwq8KemxzG1f4vWf/DsBKyFdKjvTlgGP9SbLOMt2SXJkQe4EYj+VMG9j9j8p
	f4CyHFF1xAZqb/ymPkCk3pY4A5/7ehf5tLufDiTsVdohCHgc2hqrCYmOUNZaHZ/YwUVo
	Aub5l8DLK1f/bg68DFL3HKx0iz524eMejR2NQTHtOnwgj8fZ3A5tdd/sBnsmIw3VvXCF
	SlxohbR/0YEJld9WvTO1LmMmHCIT1ehK85VyeVllmWh2sbHRCZahJgdvHWVpqMrabDcC
	lUFEeNxhWqBKwc3y9Yo4eugrCqds2oB/jlu2YiMwX6Fpaemc+OoMWo5zgfBQZRhKZOPL
	dhyw==
X-Received: by 10.194.85.129 with SMTP id h1mr118611473wjz.147.1426462477813; 
	Sun, 15 Mar 2015 16:34:37 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:39 +0100
Message-Id: <1426462419-10173-31-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 30/30] xfce4-eyes-plugin_ update to 4.4.4
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../eyes/{xfce4-eyes-plugin_4.4.3.bb => xfce4-eyes-plugin_4.4.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.3.bb => xfce4-eyes-plugin_4.4.4.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.4.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.4.bb
index 2ac63f9..ee32219 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.3.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "86ae8bce96e028921fcc0ee8424ff565"
-SRC_URI[sha256sum] = "4b9a335bcfdb8e4e2f6aedb3556575e5331f181912565f4289e354126230817c"
+SRC_URI[md5sum] = "136f52a256fad8cfd29fb2976e08ebc8"
+SRC_URI[sha256sum] = "240ce85b68d3d161f276ebbea97072dd6ee3df77062fd073bf6eeb4d3d1400ca"
 
 FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
1.9.3


