Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSa2c-0007Iq-0g
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 21:00:35 +0100
Received: (qmail invoked by alias); 21 Nov 2011 19:54:04 -0000
Received: from p5B0A17D0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.208]
	by mail.gmx.net (mp070) with SMTP; 21 Nov 2011 20:54:04 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/Pk3t/65TPW9zhy37sxv0c0mHGcAjmsBukXPJK9z
	ZggcSYrnEe0yAd
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2011 20:53:58 +0100
Message-Id: <1321905239-3527-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
References: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V2 3/4] networkmanager: bump PR to force rebuild with libnl 3.23
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
X-List-Received-Date: Mon, 21 Nov 2011 20:00:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 6d5a7ac..1dcc3cf 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "systemd libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
 inherit gnome gettext
-- 
1.7.4.4



