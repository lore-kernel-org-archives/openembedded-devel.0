Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 678F47FA15
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:43 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p17so5642744wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xJudloTSMZNVfjxW6pII5kvNsVvmYUpVuz4L5c9eqRE=;
	b=fjaAXNOpbC2s9drAWJqign6GQqyOlgMDscvQQ+/lV+DGSMnX3P/CqOjmib7bi57opL
	QQDAElXM4pqhZjUnmu8V8fnZKFOTINzkDGQAE4aSX5dTLUCSkIwB9YG3GcmQZKIkGV39
	8UAhnZU+M32eASXoz61qRf7DYa5wree/0Bl0vgcjj+b2vzRUIFA8asuEf7p5gh8g93eV
	0zudbywQnPChIsonvngktpJNxZCQGsikyb9m8u/k/nIBHMBo9BtRDFz6jsXIfrmnYr8/
	W529xbmdsTow8ZeCwRuo994nLlqxDRUfupAeL4QvLsnKsSVGwJ/rlb8adxNnctCABYBq
	w6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xJudloTSMZNVfjxW6pII5kvNsVvmYUpVuz4L5c9eqRE=;
	b=XngRZkKagnUl5bc8u4Fuftaq0gGE9hvT351LQ591UBv1O5VUr7KhxYJ+yilMnV84qu
	ThQMN27z+zHg6apctAgfGR+p4Ulhs8jTzEyJ0yVwpWOFOM97QrWOUyPraqZlugMx0Q4E
	QcoE9pANQAoP57sUUk5qKAIaqSn/qlS5DqBpc4Kv5PykF72BHheHfGZtO/jJTJiYVLXn
	RR5gXtYluaM803NqRSBWEFS8qux9GTXcbSBES9y1Vy4bDbSRsjx7DRGSOpd8XYSz9QCy
	PtCihwLJM3ml8Oq3zeiu8gCUioKfoIoNjAdnBaO7migGyHscvawSMsPyKdcZveErftp/
	OxEQ==
X-Gm-Message-State: APjAAAUh3QycJAAtlbQykbt/kknvsKtjXygpyP1l8Hz/BjNewxFVQVbg
	UB2HL7oEOFZ7YUEmlYY+tJvoL0hl
X-Google-Smtp-Source: APXvYqw7gfreJ8PiTFqr6zVLKiOrmvmngxcpl0WMy/5BcJXaiZZTRIsHaY6wYV9Gh7qET91pwc6R8g==
X-Received: by 2002:a05:600c:282:: with SMTP id 2mr7180746wmk.73.1575590984008;
	Thu, 05 Dec 2019 16:09:44 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:10 +0100
Message-Id: <20191206000912.19841-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/21] gnome-panel: (re)add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is required for gnome-flashback

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 +++++++++++++++++++
 .../gnome-panel/gnome-panel_3.34.1.bb         | 28 ++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
new file mode 100644
index 000000000..6ab4daf02
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
@@ -0,0 +1,37 @@
+From d4b2f0922dfdd6040e5e9f62a2565452cf855c42 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 21 Oct 2019 22:10:56 +0200
+Subject: [PATCH] Do not try to find ZONEINFO - it tries to run compiled code
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Missing configutation does not cause issues: The fallback in modules/clock/system-timezone.c
+matches our default.
+
+Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c75a9fa..0c9d945 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -249,11 +249,6 @@ dnl yelp-tools stuff
+ 
+ YELP_HELP_INIT
+ 
+-dnl **************************************************************************
+-dnl Find zoneinfo directory
+-dnl **************************************************************************
+-
+-AX_ZONEINFO
+ 
+ dnl **************************************************************************
+ dnl Process .in files
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
new file mode 100644
index 000000000..4c30ff85a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
@@ -0,0 +1,28 @@
+SUMMARY = "GNOME flashback panel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc gettext upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
+
+DEPENDS += " \
+    yelp-tools-native \
+    libwnck3 \
+    polkit \
+    dconf \
+    libgweather \
+    gnome-menus3 \
+    gnome-desktop3 \
+    gdm \
+"
+
+SRC_URI[archive.md5sum] = "cfd5d3fd548a2afdd8bd3bbdf9646bbd"
+SRC_URI[archive.sha256sum] = "a6bc0255252eeb4b964bcbe55fd7908b69f914c062c5ec8dff5ac0262d29b90d"
+SRC_URI += " \
+    file://0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch \
+"
+
+PACKAGECONFIG[eds] = "--enable-eds,--disable-eds,evolution-data-server"
+
+RDEPENDS_${PN} += "gdm-base"
-- 
2.21.0


