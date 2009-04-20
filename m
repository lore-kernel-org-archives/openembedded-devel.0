Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR2-0006h0-EH
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:28 +0200
Received: (qmail 21714 invoked by uid 813007); 20 Apr 2009 15:25:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:09 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:25:01 +0200
Message-Id: <1240241104-21935-9-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 1/1] checksums.ini: added checksum for util-linux-ng 2.13.1
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:29 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 948a4bf..051057d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23186,6 +23186,10 @@ sha256=b8e499b338ce9fbd1fb315194b26540ec823c0afc46c9e145ac7a3e38ad57e6b
 md5=af9d9e03038481fbf79ea3ac33f116f9
 sha256=b8e499b338ce9fbd1fb315194b26540ec823c0afc46c9e145ac7a3e38ad57e6b
 
+[http://kernel.org/pub/linux/utils/util-linux-ng/v2.13/util-linux-ng-2.13.1.tar.bz2]
+md5=424badc1832e4b5291a2ec04e9e244f4
+sha256=e67d86683adef0855220b6f5a4b7ca2c51a15faa142e2ecd69925ede76854a4d
+
 [http://kernel.org/pub/linux/utils/util-linux-ng/v2.14/util-linux-ng-2.14.tar.bz2]
 md5=23f227da49df36f33fe47e917e332cd8
 sha256=7736d8d7d3b39654e350416585b3e00af9f55670cce8b3dddd2c2494cbaae81c
-- 
1.6.2.3





