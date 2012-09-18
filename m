Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDyly-0001l8-R0
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:35 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KccIK/nkyTtv+xWuInsJIWE76fO3Qxa46EmQUwspalc=;
	b=GzyG16IeKP4Mj02oDis+37VKQr5xKXvU7VRuaViTh1XduBQlUPKEZE0o9AhBFqJl0K
	yTxT5yTWW6rDnVAqf9SV0fKPqNsD4RI8ZdK0D0HvtiNQyfnaIOYtgnw/RGBtoCytYJfK
	IXVPuwi92u/5V73wEPpQsjZH/iNJ5fAJRnIAio07eNRwzGhjyY7HuyPWLYjPbfKVDszD
	3J0j4qw1BDmOaqedoB7u2KpAOOBolGMe4gmGlqkVblvRBmi+eQnGneDTyJGYI/XPj3CI
	vvh+0iAyWuGs1iadYRFFRRk74g6R9j5fvO/7U1PbOFUScLEqzkCPK9qlN5WV0KlxQ4nZ
	u+Ow==
Received: by 10.204.154.131 with SMTP id o3mr153424bkw.87.1347977696997;
	Tue, 18 Sep 2012 07:14:56 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:10 +0200
Message-Id: <1347977601-28665-30-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 29/40] xfce4-cpugraph-plugin: update to 1.0.5
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...gin_1.0.2.bb => xfce4-cpugraph-plugin_1.0.5.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.2.bb => xfce4-cpugraph-plugin_1.0.5.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.2.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.2.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
index e3bea63..e32cbfb 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.5.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "93d7658d989ebf110875bc2deb76d7b3"
-SRC_URI[sha256sum] = "b535a9c3d105c0d1597fa4071fe140912bb483c4401c84ad178531fc85de0577"
+SRC_URI[md5sum] = "f0ebfabb273adf69361b37a3fa4b7912"
+SRC_URI[sha256sum] = "85da0ec89aacfd31e0bbafcefea37cdca618d62e681c1c9da8bdd492f028f4c7"
-- 
1.7.6.5



