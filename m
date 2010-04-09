Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1O08fF-0006VF-Hp
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 09:30:06 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id E849420B2B; Fri,  9 Apr 2010 11:23:18 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 11:23:08 +0400
Message-Id: <1270797788-25090-2-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1270797788-25090-1-git-send-email-khimov@altell.ru>
References: <201004081428.07413.khimov@altell.ru>
	<1270797788-25090-1-git-send-email-khimov@altell.ru>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] preferred-om-2008-versions.inc: use latest tzcode-native/tzdata
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
X-List-Received-Date: Fri, 09 Apr 2010 07:30:06 -0000

Is there any reason not to use latest tzdata?

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 conf/distro/include/preferred-om-2008-versions.inc |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-om-2008-versions.inc b/conf/distro/include/preferred-om-2008-versions.inc
index d46a9f6..2c38437 100644
--- a/conf/distro/include/preferred-om-2008-versions.inc
+++ b/conf/distro/include/preferred-om-2008-versions.inc
@@ -1873,8 +1873,6 @@ PREFERRED_VERSION_twm ?= "1.0.3"
 PREFERRED_VERSION_twutils ?= "0.2"
 PREFERRED_VERSION_txdrug ?= "0.1"
 PREFERRED_VERSION_tximage ?= "0.2"
-PREFERRED_VERSION_tzcode-native ?= "2007k"
-PREFERRED_VERSION_tzdata ?= "2007k"
 PREFERRED_VERSION_u2nl ?= "1.3"
 PREFERRED_VERSION_uae4all ?= "0.7.1"
 PREFERRED_VERSION_ubahnnav ?= "0.4.1"
-- 
1.6.4.2



