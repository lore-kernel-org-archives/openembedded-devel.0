Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3480777D17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:04 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q125so8652783wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zKIg5a9Y0v/dwlO4rM+/UdlLgAx2m9sOvcoHKi0OAaA=;
	b=j4eDC2UK132unXnaRZbrXLIx+xKITddDKW+ciaFu5xOb6srLXspt+RrUOPjg43uDgE
	xrp+wB/A6ZgCQqrf9EoNdUyMH7eTawLEsKZpYhjZO59nPuIIuIOx3nrNBHSq5jNT+14I
	GRAEFN05hm6sR5sbjaDteaFW/2MTMrpy5jhta1k2gFY+NGtESfvQ3mm437s/5pMHynlt
	DENOCy1ltIGEeH4cdLmrGQ3eHpnpRkR1natDor+H7CHDMeQ/bpgz01IXnPpCw0Lrrs8U
	Y3EfyXG5PdmmsnWCmvRP8YIOwKlXSW3iH5G50Wjc8t9G3N/ql/y11ZLOjWk8LfTupC93
	2Xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zKIg5a9Y0v/dwlO4rM+/UdlLgAx2m9sOvcoHKi0OAaA=;
	b=axyobf+R/lLoaxAOMtrI/4ESYkBmfxPZGK63/TcWEG+S+EBgZgv1/tbdphORSjLRRg
	ewMzQ9w2yvkxIz8Wy6GJ3AQgfn1z3QmwjYWxEs++cx4y6mMpTF9SwCBLN2qQlNu3dhq/
	9WKN0SOciESnATrGANexxAxuuUhicXpHVjw0lcTZTV+TQq7ERsu0bF+8A+7MjS7ptJ7N
	XT4ET6GY3FqZjdE+ZIH37iQVMTe4fxRfTj6sxFQGr5Q83ogol07XmgoCyLQ68VKMoUZM
	PdOuvBiidoP2foRU+v979ETCOBnUaCs5C/RPicgDP2lfYFVthuD+xBLWNv72SuJdVglo
	ULOg==
X-Gm-Message-State: AN3rC/4Ow4NAH+SmJMQ/Ev8fQGAw1xpEx3YSnK1wjJNRQ1+CGjxZ6ZS7
	uCOWaEdEieMOzSSs
X-Received: by 10.28.166.143 with SMTP id p137mr17943070wme.113.1492027024923; 
	Wed, 12 Apr 2017 12:57:04 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:24 +0200
Message-Id: <20170412195638.3243-16-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/29] xfce4-genmon-plugin: update 3.4.0 -> 4.0.0
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

Patch was a backport and is now included in tarball

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-period-to-be-set-at-250ms-resolution.-Pa.patch | 36 ----------------------
 ...lugin_3.4.0.bb => xfce4-genmon-plugin_4.0.0.bb} |  8 ++---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.4.0.bb => xfce4-genmon-plugin_4.0.0.bb} (57%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch b/meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
deleted file mode 100644
index 28c0eb1..0000000
--- a/meta-xfce/recipes-panel-plugins/genmon/files/0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2d5fa307827a7b32af4f7b2ae0604f943e3a6e99 Mon Sep 17 00:00:00 2001
-From: John Lindgren <john.lindgren@aol.com>
-Date: Tue, 21 Aug 2012 19:33:45 -0400
-Subject: [PATCH] Allow timer period to be set at 250ms resolution.  Patch
- from Miguel Guedes.  Closes: #9102.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Applied [1]
-
-[1] http://git.xfce.org/panel-plugins/xfce4-genmon-plugin/commit/?id=2d5fa307827a7b32af4f7b2ae0604f943e3a6e99
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- panel-plugin/config_gui.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/panel-plugin/config_gui.c b/panel-plugin/config_gui.c
-index a4c891d..90e55c1 100644
---- a/panel-plugin/config_gui.c
-+++ b/panel-plugin/config_gui.c
-@@ -106,8 +106,8 @@ int genmon_CreateConfigGUI (GtkWidget *vbox1,
-     gtk_widget_show (alignment1);
-     gtk_container_add (GTK_CONTAINER (eventbox1), alignment1);
- 
--    wSc_Period_adj = gtk_adjustment_new (15, 1, 60*60*24, 1, 1, 0);
--    wSc_Period = gtk_spin_button_new (GTK_ADJUSTMENT (wSc_Period_adj), 1, 0);
-+    wSc_Period_adj = gtk_adjustment_new (15, .25, 60*60*24, .25, 1, 0);
-+    wSc_Period = gtk_spin_button_new (GTK_ADJUSTMENT (wSc_Period_adj), .25, 2);
-     gtk_widget_show (wSc_Period);
-     gtk_container_add (GTK_CONTAINER (alignment1), wSc_Period);
-     gtk_tooltips_set_tip (tooltips, wSc_Period,
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.0.bb
similarity index 57%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.0.bb
index a13db62..0624fe9 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_4.0.0.bb
@@ -5,9 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI += "file://0001-Allow-timer-period-to-be-set-at-250ms-resolution.-Pa.patch"
-
-SRC_URI[md5sum] = "24108b339bb040ed360266f53a245224"
-SRC_URI[sha256sum] = "b0a5337b49c85623dc89f3c9e47c7374b1d466af2418033d2d6dfc57a9790387"
-
-S = "${WORKDIR}/xfce4-genmon-plugin-3.4"
+SRC_URI[md5sum] = "f28cfbf9c82e758a236c1f5fcbcb8a35"
+SRC_URI[sha256sum] = "a7db4f786166643076323dcde99ad12e92383cc29b4b806862d5483ec468c3e3"
-- 
2.9.3


