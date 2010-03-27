Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NvKag-0004Cz-Qa
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 02:13:33 +0100
Received: from fbcmmo06.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 02:09:16 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 02:07:59 +0100
Received: from localhost.localdomain ([87.8.251.207]) by FBCMCL01B08.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 02:07:59 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Mar 2010 02:07:38 +0100
Message-Id: <1269652058-31406-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.4.4
X-OriginalArrivalTime: 27 Mar 2010 01:07:59.0114 (UTC)
	FILETIME=[F0E226A0:01CACD49]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [STABLE][PATCH] procps_3.2.8: add missing checksums
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
X-List-Received-Date: Sat, 27 Mar 2010 01:13:34 -0000


Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 6a171e8..ed06efc 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -20674,6 +20674,10 @@ sha256=6d52c706401af197bd9d7e0187c35b4a3463ea720392ffa0c020d94899b361e5
 md5=f490bca772b16472962c7b9f23b1e97d
 sha256=b439e04adab9b1e66e11f59c4331680da48f1722f2123123f7c16dfbed2c38dc
 
+[http://procps.sourceforge.net/procps-3.2.8.tar.gz]
+md5=9532714b6846013ca9898984ba4cd7e0
+sha256=11ed68d8a4433b91cd833deb714a3aa849c02aea738c42e6b4557982419c1535
+
 [ftp://ftp.nl.uu.net/pub/unix/ftp/proftpd/ftp/distrib/source/proftpd-1.3.2.tar.gz]
 md5=756f762883cc8eed03d99dc3b1c56a8e
 sha256=5e00c20d74bbf98fb8bcc63bd4aecfd08480a87ec731dae8955bd9fca6a01bb3
-- 
1.6.4.4



