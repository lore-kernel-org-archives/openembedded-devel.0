Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylx-0001lE-DE
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:33 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=GL3v0Wlu0iMQl62fT1pOSaiAUeEZ65qbjr7J1/8BrhE=;
	b=KuFgFzOAGdOEOwGMLU4hgjMSJaQk35G473FJZOgsUzgA7aP2oBYumCGRnDlk9SuAPy
	TJVYm+8qHJEmgP+5dqRmEWPn1jtl0sCOs6P26KnLSY/IA3IMu4sVDnNRms8BhLHG6xtd
	8w2L/zivSmhFGTqLiZECQRyq2pL5gXbrRnJqojUeSjU7f4+NFJxuNrG5g4XPzgUMW2gl
	Ng3cy3NlArrMt8dcw8nbBgAEEfIlEp7vW3G8d5oJWoITO9jfRwTce5sFIxrJtyJNCdEr
	fyq7EDnLBHeg1WGH84vgyY3lmJcfcu9iAc9W4cR90wDKlQXWIEfzpZFQdF4aSFtVYrSd
	nHkQ==
Received: by 10.204.0.81 with SMTP id 17mr115466bka.140.1347977695665;
	Tue, 18 Sep 2012 07:14:55 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:09 +0200
Message-Id: <1347977601-28665-29-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 28/40] xfce4-places-plugin: update to 1.4.0
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...lugin_1.3.0.bb => xfce4-places-plugin_1.4.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.3.0.bb => xfce4-places-plugin_1.4.0.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.4.0.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.4.0.bb
index 5310586..1f6c231 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.4.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "d075fffccf44bcf09a1bfcd4e0cd38a2"
-SRC_URI[sha256sum] = "0266e6bb9905b6af25f80cbb364d2710b6b95100382d2d540edf9f8408e09936"
+SRC_URI[md5sum] = "cdb5c966c7a93ca29f2ce50223782133"
+SRC_URI[sha256sum] = "d2a451a35096ecb8b6ca96ab0af3ebca3f163a7c8dc08627518940a633cce5e5"
-- 
1.7.6.5



