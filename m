Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyC8L-0002rG-IO
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 00:52:40 +0100
Received: (qmail 12353 invoked by uid 503); 12 Mar 2011 00:29:39 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 12 Mar 2011 00:29:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Mar 2011 01:44:00 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Mar 2011 01:43:59 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 00:45:26 +0100
Message-Id: <1299887126-24886-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ileat6$gdk$2@dough.gmane.org>
References: <ileat6$gdk$2@dough.gmane.org>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12952071054280928585
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] angstrom-20101: prefer qt 4.7.2
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
X-List-Received-Date: Fri, 11 Mar 2011 23:52:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../include/angstrom-2010-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
index 7a19f2d..2ec92ec 100644
--- a/conf/distro/include/angstrom-2010-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
@@ -1,5 +1,5 @@
 ANGSTROM_MESA_VERSION = "7.9.1"
-ANGSTROM_QT_VERSION ?= "4.7.1"
+ANGSTROM_QT_VERSION ?= "4.7.2"
 ANGSTROM_LIBTOOL_VERSION = "2.4"
 # Use new sysroot feature
 LIBTOOL_HAS_SYSROOT = "yes"
-- 
1.7.0.4



