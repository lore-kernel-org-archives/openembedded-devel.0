Received: from 7.27.mail-out.ovh.net ([46.105.34.120] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyABk-00042Z-Fi
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 22:48:31 +0100
Received: (qmail 5003 invoked by uid 503); 11 Mar 2011 22:33:08 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 11 Mar 2011 22:33:03 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Mar 2011 23:39:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 11 Mar 2011 23:39:31 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 22:40:56 +0100
Message-Id: <1299879658-10136-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10850015927870532937
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/3] shr: prefer qt 4.7.2
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
X-List-Received-Date: Fri, 11 Mar 2011 21:48:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: Martin.Jansa@gmail.com
---
 conf/distro/include/preferred-shr-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 662f366..ce4ea82 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -28,7 +28,7 @@ PREFERRED_VERSION_perl = "5.10.1"
 PREFERRED_VERSION_perl-native = "5.10.1"
 UDEV_GE_141 = "1"
 
-ANGSTROM_QT_VERSION ?= "4.7.1"
+ANGSTROM_QT_VERSION ?= "4.7.2"
 PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded = "${ANGSTROM_QT_VERSION}"
-- 
1.7.0.4



