Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D164A71B09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:16:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so23503320wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 02:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QbSaLqqfdS3bHRk5JdhNGnECSHuNV4yZlN45xUL1WTs=;
	b=vf3cWIRbimAB8Ys1qSqWqHtouE5PhE2QCpHVV6KdrtUWpyMjexs2tUfWLH0NWuCzhY
	GN6bl300kfR0qk37ypdW0MaWJ7YIqUPpnGvXLVJh1PLSD1zS2ibfOUabX09rx/9Vkwe4
	W2DnKGVBOHqyIEmf75AyW3CCbY7Yst7c5k0beXdbzGLl8hfZn/x2ZDVuLKyv/7pUDykD
	L6PL4Du6bOSGIpmzG80IFEyp+yd0RIsWIAXb3Z16unlZhG25HJEB0bEEM00NXKlCdJpD
	pwRkZ79or5WG7XMe7RdapFQUP15+qPGfxbLiIRtZK23YdibJkyK8cD0r1EpT7wydcnZC
	T0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QbSaLqqfdS3bHRk5JdhNGnECSHuNV4yZlN45xUL1WTs=;
	b=c7tJejg96lkQg4CzMceQE+KmXokVjeCvXaowbvxU/8JgRG7hqFKigU+ZoGYVSc9+oj
	AyNNypArGFHkaN4ugX6bYpmfSnrN2S6TaDO3ozRrow9I5kHmTpuezZu18LFcSSYtnj5b
	UhmcP0TEHv56Zk9E/E2BWqDM3EwG4sRzsZz9NSkTXJGYDigbwIIyJax611q3aPKKmoLu
	+OCmrHenH/f8PGH/q60hCCv40vl+ElwCjVA22rwHJar3EL7Tf8PuUVtIGOgFX3jGgndB
	ue38kh3C2yY7N70FP8eNgxkvYnsayhBDrLKwS2clbO72Buw0dAZnOr1ujYgR4QyxnViu
	sQdA==
X-Gm-Message-State: AKaTC01Xuu+rEv8BLF/7Kgxx0LLYq8wML2dSSZcCN43lAtxYofXme0OTtfgZ/vHxzD41mQ==
X-Received: by 10.28.6.203 with SMTP id 194mr22380700wmg.16.1480414609682;
	Tue, 29 Nov 2016 02:16:49 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id l6sm2006469wmd.5.2016.11.29.02.16.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 02:16:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Nov 2016 11:16:40 +0100
Message-Id: <20161129101640.13459-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] libxml++: fix LICENSE
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
X-List-Received-Date: Tue, 29 Nov 2016 10:16:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.38.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
index 20313fe..70965f3 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.38.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "C++ wrapper for libxml library"
 HOMEPAGE = "http://libxmlplusplus.sourceforge.net"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml%2B%2B"
 SECTION = "libs"
-LICENSE = "GPLv2"
+LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
 
 SHRT_VER = "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True).split('.')[1]}"
-- 
2.10.2


