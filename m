Received: from [88.149.128.34] (helo=smtpi4.ngi.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M4WCT-0005ah-LQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 10:22:02 +0200
Received: from localhost.localdomain (81-174-25-145.dynamic.ngi.it
	[81.174.25.145]) by smtpi4.ngi.it (Postfix) with ESMTP id C0C2542092;
	Thu, 14 May 2009 10:15:08 +0200 (CEST)
From: Elena Grandi <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 May 2009 10:14:56 +0200
Message-Id: <1242288896-6347-4-git-send-email-elena.valhalla@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1242288896-6347-3-git-send-email-elena.valhalla@gmail.com>
References: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
	<1242288896-6347-2-git-send-email-elena.valhalla@gmail.com>
	<1242288896-6347-3-git-send-email-elena.valhalla@gmail.com>
Subject: [PATCH] checksums.ini: added entry for gtksourceview2_2.6.0
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
X-List-Received-Date: Thu, 14 May 2009 08:22:10 -0000

Signed-off-by: Elena Grandi <elena.valhalla@gmail.com>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index b087213..72f2db9 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -9942,6 +9942,10 @@ sha256=c1c2e1fb0168ecb3a5e773ac0cd74a0e5caeaaf402f108479337794dab8aa75f
 md5=a56ea78c74fe93a604357d7c555af0e5
 sha256=38c238ec57bf22023bbc50f70ecbaee8c06b817b9e11f1a3a0ae7faf95cc1f26
 
+[http://ftp.gnome.org/pub/GNOME/sources/gtksourceview/2.6/gtksourceview-2.6.0.tar.bz2]
+md5=dd065ab2e96e51aade949249c5556439
+sha256=92ddd976721e26377eaa59fea07707a0caa85eb874500868c1e6fdd9a21fe0dd
+
 [http://downloads.sourceforge.net/gtkterm/gtkterm2-0.2.3.tar.gz]
 md5=a49f93d15909dbd2e7011428ae01f0f0
 sha256=fb68b18d752ae2379f144186b94743be991af1a42c88bc1e6f0685e45cb1d573
-- 
1.6.0.6



