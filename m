Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 53500733FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:27 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so7582954wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uvpfAr6sBJZ4SXTBrlMhODuMVzEXyVTNA2z9KVakCes=;
	b=RW2NbGLLQDllwYA2WPE7D6nANyVKD79ffQBQf7HZr7zGPh6Gnrx0GsJ11m2QqdjJf5
	l4gWa5UzX+bSekvgCJH/8bMEY7Jq6CkOdT3AjrGJ9OTouobXeWRoWeGmEh6DTtzc/rNz
	k98JKsvD5Xo9vfqKOFWaJrgxRmoQYx2ppscqeX9X+a8ZNsxtWtP6eoD0L2GID2S4kG+T
	MbYvjhOAV3Pd2QgNT0IBI46M1DGyvzRbZ2G6BKdkXOsqo9hWLfw2nyETpRFoxhdbdsZR
	ptwzazCAEEDfjA66xsWF80qLzTRpN3rT3QTkEh3EIEcjT+VKpABBCtyZKve0x6/yjbNC
	oyhA==
X-Received: by 10.194.173.161 with SMTP id bl1mr12165631wjc.102.1423776142745; 
	Thu, 12 Feb 2015 13:22:22 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:47 +0100
Message-Id: <1423776119-14981-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/19] packagegroup-xfce-extended: add xfce4-kbdleds-plugin
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index af8977d..3df7440 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -42,6 +42,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-notes-plugin \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
+    xfce4-kbdleds-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
1.9.3


