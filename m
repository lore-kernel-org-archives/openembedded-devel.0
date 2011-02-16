Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeic-0000xQ-SB
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:47 +0100
Received: (qmail 19882 invoked by uid 503); 16 Feb 2011 11:16:18 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:37 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:36 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:52 +0100
Message-Id: <1297852433-31160-8-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297852433-31160-1-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105675799480937808
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH 08/10] angstrom-2010: prefer busybox-1.18.3
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this is the latest stable version

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: Koen Kooi <koen@openembedded.org>
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 5532f29..006dc74 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -12,7 +12,7 @@ PREFERRED_VERSION_autoconf = "2.65"
 PREFERRED_VERSION_autoconf-native = "2.65"
 PREFERRED_VERSION_automake = "1.11.1"
 PREFERRED_VERSION_automake-native = "1.11.1"
-PREFERRED_VERSION_busybox 	= "1.18.2"
+PREFERRED_VERSION_busybox 	= "1.18.3"
 PREFERRED_VERSION_cairo		= "1.10.0"
 PREFERRED_VERSION_dbus 		= "1.2.24"
 PREFERRED_VERSION_dropbear      = "0.52"
-- 
1.7.0.4



