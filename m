Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pyp1G-000605-BY
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 18:23:54 +0100
Received: (qmail 28660 invoked by uid 503); 13 Mar 2011 17:40:22 -0000
Received: from b7.ovh.net (HELO mail97.ha.ovh.net) (213.186.33.57)
	by 31.mail-out.ovh.net with SMTP; 13 Mar 2011 17:40:22 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 18:55:36 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 18:55:34 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 17:57:03 +0100
Message-Id: <1300035425-15984-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300035425-15984-1-git-send-email-eric@eukrea.com>
References: <1300035425-15984-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17799914579356134730
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/4] angstrom-2010: use busybox 1.18.4
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
X-List-Received-Date: Sun, 13 Mar 2011 17:23:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 2ec92ec..46fc765 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -12,7 +12,7 @@ PREFERRED_VERSION_autoconf = "2.65"
 PREFERRED_VERSION_autoconf-native = "2.65"
 PREFERRED_VERSION_automake = "1.11.1"
 PREFERRED_VERSION_automake-native = "1.11.1"
-PREFERRED_VERSION_busybox 	= "1.18.3"
+PREFERRED_VERSION_busybox 	= "1.18.4"
 PREFERRED_VERSION_cairo		= "1.10.0"
 PREFERRED_VERSION_dbus 		= "1.2.24"
 PREFERRED_VERSION_dropbear      = "0.52"
-- 
1.7.0.4



