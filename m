Received: from [59.124.115.149] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nytowl@openmoko.org>) id 1LeA3H-0002US-MJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 16:27:32 +0100
Received: from s0106001c100a3234.cg.shawcable.net ([70.73.132.19]
	helo=[172.16.14.103]) by aakash.openmoko.org with esmtpsa (SSL
	3.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nytowl@openmoko.org>) id 1Le9zH-0006Fy-AR
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 23:23:34 +0800
From: Angus Ainslie <nytowl@openmoko.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 02 Mar 2009 08:23:19 -0700
Message-Id: <1236007399.6800.1133.camel@alap>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 70.73.132.19
X-SA-Exim-Mail-From: nytowl@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: [PATCH] Add elementtree checksum
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
X-List-Received-Date: Mon, 02 Mar 2009 15:27:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Please advise me if there are policies for applying patches to
checksums.ini


Thanks
Angus

---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 52e26d6..497dd07 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -1,3 +1,7 @@
+[http://effbot.org/media/downloads/elementtree-1.2.7-20070827-preview.zip]
+md5=30e2fe5edd143f347e03a8baf5d60f8a
+sha256=5071431068c58c1f56dcc8fff37f8a213351f3b45c012d3adb640ec9418053ad
+
 [http://www.directfb.org/downloads/Extras/++DFB-0.9.25.tar.gz]
 md5=c6a2705f6210d8ede50a947b375f1c0b
 sha256=b3dbf01563dd60d63cff543ea8cd0c885381e78ecbbab8ff176e46df3f198a88
--
1.5.6.3




