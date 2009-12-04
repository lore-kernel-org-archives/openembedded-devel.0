Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NGSTZ-0007LJ-Go
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 08:21:16 +0100
Received: from homiemail-a17.g.dreamhost.com (caiajhbdcbef.dreamhost.com
	[208.97.132.145])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 2287C17F798
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 23:19:37 -0800 (PST)
Received: from localhost.localdomain (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPA id 5FC107A8060; 
	Thu,  3 Dec 2009 23:19:34 -0800 (PST)
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Dec 2009 08:19:27 +0100
Message-Id: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Sebastian Spaeth <Sebastian@SSpaeth.de>
Subject: [PATCH 1/2] shr.conf: set DISTRO_apm = fso-apm
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
X-List-Received-Date: Fri, 04 Dec 2009 07:21:16 -0000

Signed-off-by: Sebastian Spaeth <Sebastian@SSpaeth.de>
---
 conf/distro/shr.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 2a33427..80f89bd 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -183,6 +183,7 @@ PREFERRED_PROVIDER_virtual/db-native = "db3-native"
 PREFERRED_PROVIDER_virtual/libsdl = "libsdl-x11"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
 PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
+DISTRO_apm = "fso-apm"
 
 #############################################################################
 # PREFERRED VERSIONS
-- 
1.6.3.3



