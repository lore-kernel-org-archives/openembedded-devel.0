Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RSdy7-0002FC-Ae
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 01:12:12 +0100
Received: (qmail invoked by alias); 22 Nov 2011 00:05:41 -0000
Received: from p5B0A17D0.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.208]
	by mail.gmx.net (mp055) with SMTP; 22 Nov 2011 01:05:41 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/dIuh5+CLd0oPNrFsprWwFhto7JYdv8417CZzLz7
	FzBi8ZgRA5HOFV
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Nov 2011 01:05:34 +0100
Message-Id: <1321920336-4905-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321920336-4905-1-git-send-email-schnitzeltony@gmx.de>
References: <1321920336-4905-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V3 3/5] networkmanager: bump PR to force rebuild with libnl 3.23
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
X-List-Received-Date: Tue, 22 Nov 2011 00:12:21 -0000
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



