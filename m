Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PrAw2-0006lL-Uz
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:10:55 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrAul-000643-Q2 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 07:09:35 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 20 Feb 2011 07:09:35 -0800
Received: from localhost.localdomain ([172.30.80.150]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 20 Feb 2011 08:09:34 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 08:09:17 -0700
Message-Id: <1298214559-9650-3-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
X-OriginalArrivalTime: 20 Feb 2011 15:09:34.0926 (UTC)
	FILETIME=[2F0D16E0:01CBD110]
Subject: [PATCH 2/4] kaeilos 2009: Pin gvfs to 1.6.6
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
X-List-Received-Date: Sun, 20 Feb 2011 15:10:55 -0000

We're doing this since glib-2.0 is pinned.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../include/kaeilos-2009-preferred-versions.inc    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/conf/distro/include/kaeilos-2009-preferred-versions.inc
index cf0f65d..0125724 100644
--- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
+++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
@@ -26,6 +26,7 @@ PREFERRED_VERSION_gst-pulse 	= "0.9.7"
 PREFERRED_VERSION_gtk+		= "2.20.1"
 PREFERRED_VERSION_gtk+-native	= "2.20.1"
 PREFERRED_VERSION_gtkmm		= "2.20.0"
+PREFERRED_VERSION_gvfs		= "1.6.6"
 PREFERRED_VERSION_hal		= "0.5.14"
 PREFERRED_VERSION_libgemwidget	= "1.0"
 PREFERRED_VERSION_libgpephone	= "0.4"
-- 
1.7.0.4



