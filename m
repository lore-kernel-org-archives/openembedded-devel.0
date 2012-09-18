Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylu-0001l8-FM
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:30 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=BPzRK6iU7AabrMd9g6FZQUkoJB/lC4Egx9s5f50+oDw=;
	b=cjLlMJIUHPxuuM96Wui4DlSFTnP0azeFLe7txHqQt3XSorub+cSX5mrGR0T9qcCwWP
	kjCE5OsUdhx0X/eHblbifkCN4GUCUVV2EjRmuEtwW3obb+KfDkc2vT7ns15SxtndEaKK
	3e/b2+KqyDwllr2ZmCFrKS09TD73KmFCiEkQjOwNtXQddzKvNX3W0H/SM8ZVRVCaOrna
	fBQ+QZg+7KHZ9yuc04xpc6+6fWFbvr6fe6D9I1wQSlZ14aDP9jpINhXyh0fPwhIbSOzR
	bqadHgBvW38mKafZ01CVUV+rc1zzbqM58tpGwbFP3G/erkGp6UHTUM2kU0uFAlddL4/Q
	1rhw==
Received: by 10.204.150.85 with SMTP id x21mr3792bkv.40.1347977692761;
	Tue, 18 Sep 2012 07:14:52 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:07 +0200
Message-Id: <1347977601-28665-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 26/40] xfce4-netload-plugin: update to 1.2.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:33:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ugin_1.1.0.bb => xfce4-netload-plugin_1.2.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.1.0.bb => xfce4-netload-plugin_1.2.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
index 5dba77a..faf623d 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.2.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "19bee8171e7d681cb79539417f0b5917"
-SRC_URI[sha256sum] = "8a33dfed24a7bbd8eaf333524f94eb24e7d3a14ffccb181e5cab1d1b05ae3bf7"
+SRC_URI[md5sum] = "05180d60ed347029dc125368c1d4406e"
+SRC_URI[sha256sum] = "c824f09e2d3860011b44d8272d661c458237786828027f3d9ad6a1d4f0096845"
-- 
1.7.6.5



