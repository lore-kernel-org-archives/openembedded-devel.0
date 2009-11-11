Received: from [62.2.86.239] (helo=a.mx.bitcloner.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1N8GPY-0002qy-OP
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:51:15 +0100
Received: from p5b2ccb6b.dip.t-dialin.net ([91.44.203.107] helo=127.0.0.1)
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <betheg@bitcloner.org>)
	id 1N8GIA-0005dp-9U for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:43:34 +0100
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 17:41:47 +0100
Message-Id: <1257957707-31349-4-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.6.5.2
In-Reply-To: <1257957707-31349-1-git-send-email-betheg@bitcloner.org>
References: <1257957707-31349-1-git-send-email-betheg@bitcloner.org>
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 3/3] checksums.ini: add entry for tzdata2009r
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
X-List-Received-Date: Wed, 11 Nov 2009 16:51:15 -0000


Signed-off-by: Michael Kurz <betheg@bitcloner.org>
---
 conf/checksums.ini |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index d646dbe..4b9bfe3 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -25802,6 +25802,10 @@ sha256=7b08bb8a98ad8a06e2cafda05ab21f2a69b2d64252dfc9435c93094d979e7c5a
 md5=75c74b9c8df7c83c8e3c3068fff08a82
 sha256=5fbd4053a4eb01b814799855e35a3c01743f98acf9fcd167522e6484a2edd7b7
 
+[ftp://elsie.nci.nih.gov/pub/tzdata2009r.tar.gz]
+md5=c38d977a3f9f4d4646cab902554c519e
+sha256=684d23e3ebe825c9db90732534446f4e33f5ad4455980b15fd9eb2e4ba5a6731
+
 [ftp://elsie.nci.nih.gov/pub/tzdata2009p.tar.gz]
 md5=e401e284512be17f5cf63ee52e4f3284
 sha256=7182ad6f03bfe16ccdbac4a3efb9e765ea7c51afc33c3a7fefb053122aa6da2c
-- 
1.6.5.2



