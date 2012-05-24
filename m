Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SXelS-0003E4-Lt
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 May 2012 22:36:06 +0200
Received: by wgbdr1 with SMTP id dr1so153280wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2012 13:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=2a6mCpWzGXdsyDnNFRhCipwXy8sfC1DPHwZXFWb2ZrU=;
	b=hK1lzJkiQMxaomP6D7OttjtR9sxDFZnrEqzZO3ml/o4o2G9X9utsYj3YD+Q/xpDruP
	0FSEcHQ4L/oG51qLgVk48/FkReHVbCiPo5Bacx6QyPSjARd8E5YGC31khmbNAJovdmkJ
	IVU8Xnzs4Afphp6peEqFRn66xVyBNffT/KnyEqlDjjGOEcgFDNXf81aBBlhq+v06mbtk
	aSkXAg7tDqw2XLqOIG+VfDEmNf94/RryhqeRQuzgjaSJFCD7dxGaW4OU81CA8zPWwvqz
	uQYA2TXCVHvFbMCtRrdha5vPLLATiYn4jY9fMa0vKQtCW+xqcOy5m81NWuwYzF54+PK0
	CjAw==
Received: by 10.216.203.201 with SMTP id f51mr392403weo.52.1337891155196;
	Thu, 24 May 2012 13:25:55 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1842.dip.t-dialin.net.
	[79.223.24.66])
	by mx.google.com with ESMTPS id fo7sm49741778wib.9.2012.05.24.13.25.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 13:25:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2012 22:29:54 +0200
Message-Id: <1337891394-4033-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1337891394-4033-1-git-send-email-schnitzeltony@googlemail.com>
References: <1337891394-4033-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce,V2 2/2] task-xfce-extended: add xfce4-xkb-plugin
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 20:36:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
index 2dbd9f0..700b68a 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
@@ -33,6 +33,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-diskperf-plugin \
     xfce4-netload-plugin \
     xfce4-genmon-plugin \
+    xfce4-xkb-plugin    \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
-- 
1.7.4.4



