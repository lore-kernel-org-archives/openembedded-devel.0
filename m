Received: from mailbackup.inode.at ([213.229.60.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Ra20o-00036h-Lb
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 10:17:30 +0100
Received: from [62.99.145.9] (port=59389 helo=mx.inode.at)
	by mailbackup.inode.at with esmtp (Exim 4.76)
	(envelope-from <Bernhard.Guillon@hale.at>) id 1Ra1nD-0002sN-0H
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 10:03:27 +0100
Received: from [83.64.51.210] (port=13528 helo=gateway1.hale)
	by smartmx-09.inode.at with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <Bernhard.Guillon@hale.at>)
	id 1Ra1n9-0005My-R3 for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 10:03:23 +0100
Received: from mail1.hale.at (mail2.hale [192.168.100.12])
	by gateway1.hale (8.13.8/8.13.7) with ESMTP id pBC93F02005412
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:03:15 +0100
Received: from localhost.localdomain ([192.168.100.138]) by hale.at with
	MailEnable ESMTP; Mon, 12 Dec 2011 10:03:05 +0100
From: Bernhard Guillon <Bernhard.Guillon@hale.at>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 10:02:55 +0100
Message-Id: <1323680575-31596-1-git-send-email-Bernhard.Guillon@hale.at>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-HALE-MailScanner-Information: Please contact the ISP for more information
X-MailScanner-ID: pBC93F02005412
X-HALE-MailScanner: Found to be clean
X-HALE-MailScanner-From: bernhard.guillon@hale.at
MailScanner-NULL-Check: 1324285396.28848@aKeh9zEMmP2+nsdZ76wtvw
X-Spam-Status: No
Subject: [[meta-oe][PATCH]] libgtkstylus_0.5.bb: add missing LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 12 Dec 2011 09:17:30 -0000


Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
---
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
index f614048..9c9fc2d 100644
--- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
+++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "GTK plugin for stylus based systems"
 SECTION = "libs"
 DEPENDS = "gtk+"
 LICENSE = "LGPL"
-PR = "r2"
+LIC_FILES_CHKSUM = "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
+PR = "r3"
 
 inherit autotools
 
-- 
1.7.1



--
Scanned by MailScanner.



