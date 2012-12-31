Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjEI-0005xD-DW
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:54 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so6424146eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PN2qu0LIoLGHP1nPu/lOCECbn05g9Bjh+AQLwkjgOHo=;
	b=ssZ/GV9u0FsTKQvky7hvwNJd+hNsvN80o1YRyDXyiduGEySYm0MBaUrQKzCCnIZut4
	SidQk8qQeb4OLuvKukL5Cs6Cg6EdhjFT5lnPeOtAGwkili0I9+5DXL2Po2vWM7rAKd6+
	KWrVY7M0Ohx/UBK6+InwX/gqzr7a7KboWdPaWzzmPIZmOMDfsbJhQFJLhGo/W7C+QP6T
	5P7tRgQOgAZ9pqZRTiy07HIz4yomBCiKV1h2HnZdhxfFL3rDEGyyyugSMn5wSxJhFEX0
	V8eSFlGfyhF+lR7tPBS/gDhbujP6QGB5qVpddMvVY0lsGxTL5NzwAIt+jVAse0GYEgq8
	2AnQ==
X-Received: by 10.14.221.5 with SMTP id q5mr111636360eep.33.1356974270867;
	Mon, 31 Dec 2012 09:17:50 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:50 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:23 +0100
Message-Id: <1356974245-3497-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 08/10] xfce4-places-plugin: update to 1.5.0
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...lugin_1.4.0.bb => xfce4-places-plugin_1.5.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.4.0.bb => xfce4-places-plugin_1.5.0.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.4.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.4.0.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
index 1f6c231..2e0b810 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.4.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "cdb5c966c7a93ca29f2ce50223782133"
-SRC_URI[sha256sum] = "d2a451a35096ecb8b6ca96ab0af3ebca3f163a7c8dc08627518940a633cce5e5"
+SRC_URI[md5sum] = "84c39fb123e07e1c7caaf006d9383656"
+SRC_URI[sha256sum] = "6996051669a13d4791a5a453747801dc2f7f6fa5546785622d80b34966283d44"
-- 
1.7.4.4



