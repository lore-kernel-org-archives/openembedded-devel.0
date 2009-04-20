Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR0-0006gM-Uj
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:27 +0200
Received: (qmail 21640 invoked by uid 813007); 20 Apr 2009 15:25:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:07 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:24:55 +0200
Message-Id: <1240241104-21935-3-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 1/1] tracker: added libgnomecanvas to dependencies
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:27 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 recipes/tracker/tracker_0.5.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/tracker/tracker_0.5.4.bb b/recipes/tracker/tracker_0.5.4.bb
index 4753280..e1a94b7 100644
--- a/recipes/tracker/tracker_0.5.4.bb
+++ b/recipes/tracker/tracker_0.5.4.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
 LICENSE = "GPLv2"
-DEPENDS = "file gtk+ gstreamer gamin libgmime dbus poppler libexif libgsf"
+DEPENDS = "file gtk+ gstreamer gamin libgmime dbus poppler libexif libgsf libgnomecanvas"
 
 PR = "r3"
 
-- 
1.6.2.3





