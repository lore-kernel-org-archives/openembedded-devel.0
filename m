Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLV-00028Z-QQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:17 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2502442wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=PksP5xXxf1o9V7+7lrQI0qHAqrJdBDsu9FbRADDwlxo=;
	b=j9apUBFewWuhRo0Y44fcMUUs6vYxnNZO5R0K410KbNan+76anxothyxSEyPHvx9xoA
	EU0D6k5uOjVcp91f0cVT6Fd3LN+jpTwY+Mds/09V67y01SnT9RS4IwlHAH0zQnWJf0iW
	0hOIb8kDJKsDT130BrRktg0pJctww43PCDvQbb/6s0XbuHmH6ks2BEqtKLyT23NybHSi
	KQMY5qzghcUOgTvt6YfanPQzwqcQgzk8HbJxdDLzyg9xk9RGQwqpLtPuaR+/xG0D0RbX
	lAgPtP8KnIGG1kcvydlqpZ/jIgk6PAr5Tp34snWjazAWeC6I/Myf9fng6Be6iJ7iz2po
	kpdw==
Received: by 10.216.213.79 with SMTP id z57mr5029281weo.27.1338639117859;
	Sat, 02 Jun 2012 05:11:57 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:54 +0200
Message-Id: <1338639361-23775-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 08/15] xfce4-clipman-plugin: update to 1.2.3
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ugin_1.2.2.bb => xfce4-clipman-plugin_1.2.3.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.2.bb => xfce4-clipman-plugin_1.2.3.bb} (69%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
similarity index 69%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
index c830229..d3c7138 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
@@ -8,5 +8,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xproto libxtst"
 
-SRC_URI[md5sum] = "60df7769a8271d7fcab177210f4291e8"
-SRC_URI[sha256sum] = "fcac10bc150eb2f73955f28184ac2b8324c9aabc3d773242eadcec137e1096a1"
+SRC_URI[md5sum] = "61f3be97efa379cb358980c94e14692a"
+SRC_URI[sha256sum] = "4424447067cb2c3972c375330d2e1d19f12e59c41bd03e111c2e6e9e174a5067"
-- 
1.7.4.4



