Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E227777D04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x75so8664282wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NY/eDhVxmNQCBMwQX4LdkUqoVjY440f2HEGu85M+sDc=;
	b=b4GAGcZ5pJuUU9BjUhNMdo2hzoybcBhUMGD9j9zNXDLQ+RjuR/KNbtbI2tzU6g6pdE
	4D2xhhm+Bxcxz93aeHeGQIB1uAmKDoR9y+n1thyDFizw+SzTZIIg4gE0RWUXhGcHJ+jG
	4GFNV94YfvWZV3NE8wYWWlEPp5bBz732SSOP+HUF1XtJrZcAxYVAXuN5+l2TazQ7BCiV
	A7oK3zcskgAAW73hdbeJf2e1YHa8my4Zr2wJlUhQThYnxVT68pNffRG8TUwlx/rR24Fr
	kLLlefGxrc/joWIGsDHjXZ4BmNyJhwu6CpjGGemJAuisW4Pwx6vJiPw+9vqbeYrROSOV
	Y9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NY/eDhVxmNQCBMwQX4LdkUqoVjY440f2HEGu85M+sDc=;
	b=fRvGP2uauDH0yYmI+4FbOZg/5cWW9EV81+F2nMDyoD5X0F1aSnI3D8PIkn+skuaB6R
	AqT2+VU7iPlNgV6k5h0/ZUkRbsFuaqC4ppIeRMjORftasQ7+XZn2xKqF93NS4sA1choL
	nN5zVEM/G2U/0LusrHzX58XPnI461cjFMc0f83E5OLGwHQvM037zoGolknSEnQiGhjQZ
	TyqnncR2IdJW+IQHXpvzIy9MoUhcOevHC+VTxX6AWoMETNQLNK9/XCeAHHFUvpMCvFPv
	utc+Oa+BSFCf9tZWyFLxRdsyVaKiI+FF6H+Lmz83niwGn9a9OSjYhp3TLQndS9C+dWTi
	3EyQ==
X-Gm-Message-State: AN3rC/4JdjHyTuaIDwxuMTtHtkE4d1eVON2hb63DWCkDcglWLSMOHlPP
	pfv3EgcnVAvV0V/8
X-Received: by 10.28.148.143 with SMTP id w137mr21085727wmd.72.1492027024007; 
	Wed, 12 Apr 2017 12:57:04 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:23 +0200
Message-Id: <20170412195638.3243-15-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/29] xfce4-equake-plugin: update 1.3.8 -> 1.3.8.1
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-equake-plugin_1.3.8.bb => xfce4-equake-plugin_1.3.8.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.8.bb => xfce4-equake-plugin_1.3.8.1.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.bb
rename to meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb
index 76d25f8..8b24e98 100644
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.bb
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.8.1.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "c8f6cb2aec62513c343281eacc4fc395"
-SRC_URI[sha256sum] = "431575da3d49fea3afa60f02e83c8d74e20e9a229c9c4ec82c21d45e2c986925"
+DEPENDS += "curl"
+
+SRC_URI[md5sum] = "07d42b8a3d440d6f1861048a6cc3a15a"
+SRC_URI[sha256sum] = "eff9cfd604d1bd998c5208176fbe2c6da705c250dce572f5e30b2c77f4ec741c"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
2.9.3


