Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylw-0001n9-0U
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:32 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ayb3TLlLCd4YRwves9KIXIP2i1cSmy1gCFK/GeyJr7k=;
	b=I5g2acjRuwzS+QSFtx7xw3Wnw33CT30sMUwY5XqTQo9iyWCTaBEM5hwxBDI79VV+wj
	BHBdcR96PCuwXemG4phCqWGUx8WVJ6RreNz9rXakgyHnD9fIJ4ioqk3YyMYd/vcyVFF3
	sliz56oSHbiOhNZzgTVBh9OL8ThANc3bAQ0BADFxI+gdCJxDG5tBGsvbqHjz3bdltSMa
	uECT9sFwS+Hy64UJCvV23EbSBQEgGvsQNTWpqrHk16MPVUsE7cXvf1fFhs3taafO9nT+
	+0zVodqZ278tTDCiswmT+HOcB8cNRbvxwGOBJqIMoXyF3lKpsliv1KsDtb/Nl2brKFjJ
	ObJw==
Received: by 10.204.151.81 with SMTP id b17mr153644bkw.95.1347977694295;
	Tue, 18 Sep 2012 07:14:54 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:08 +0200
Message-Id: <1347977601-28665-28-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 27/40] xfce4-diskperf-plugin: update to 2.5.4
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...gin_2.5.3.bb => xfce4-diskperf-plugin_2.5.4.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.5.3.bb => xfce4-diskperf-plugin_2.5.4.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.3.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.3.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
index e80d0bd..6946931 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.3.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.4.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "ba880f763e273787d0c8365eebc4feab"
-SRC_URI[sha256sum] = "418a250fe8d48f1fd87658206a8e6762032d35dc1b2e98e27d309a35f873f9b6"
+SRC_URI[md5sum] = "2db453fc3ea2e4fe073ec313a25b0961"
+SRC_URI[sha256sum] = "aab6b9c4e2f78620920efac6874c4edf426f05b63b94cfda0da8c99a91110a0b"
-- 
1.7.6.5



