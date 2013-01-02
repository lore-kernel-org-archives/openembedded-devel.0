Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TqQIC-0000Yz-FH
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 16:31:44 +0100
Received: by mail-ee0-f48.google.com with SMTP id b57so7085388eek.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 07:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PN2qu0LIoLGHP1nPu/lOCECbn05g9Bjh+AQLwkjgOHo=;
	b=J5cPJsxLs0xeGxgHvesCILsXsaQtbK0X6zH8vZRBBFMMwkDQb0u3YefjtoOIJggeF/
	XoVjTPkBEVaxQlxbqWyxsthJ5eIhKcRYSVT/lWU8Wfi6HZUrfw9ow90BJr5W1Jarp2Tl
	MnJJ5VnKeb71HlQwxiRzpS90U7Hi9RMeqG+eAWfKj5CAYV3+AfJIX0WxNFT2kBaJi3Q4
	HTWowwqk0uqtL9XsqC0odSiv4ku+IacWmnBpEdvlo9PmbMp1tyGqEdo+Qt99lyy87XQ7
	bv5GB62le9lwkQHF3JTlUxJpKwv+vyQ9uGhTlTTmdm6fFRa4Bh69hIIoJut132XH/1Ly
	gV7g==
X-Received: by 10.14.204.198 with SMTP id h46mr126682496eeo.1.1357139797277;
	Wed, 02 Jan 2013 07:16:37 -0800 (PST)
Received: from localhost.localdomain (p4FDF1C58.dip.t-dialin.net.
	[79.223.28.88])
	by mx.google.com with ESMTPS id b2sm98071345eep.9.2013.01.02.07.16.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 07:16:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 16:16:12 +0100
Message-Id: <1357139774-4364-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357139774-4364-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome/V2 08/10] xfce4-places-plugin: update to 1.5.0
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
X-List-Received-Date: Wed, 02 Jan 2013 15:31:44 -0000
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



