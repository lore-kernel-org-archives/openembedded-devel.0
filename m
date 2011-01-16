Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Peagh-000594-Mp
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 23:03:03 +0100
Received: (qmail 26891 invoked by uid 503); 16 Jan 2011 22:06:05 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 16 Jan 2011 22:06:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Jan 2011 00:02:28 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Jan 2011 00:02:27 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Jan 2011 23:02:02 +0100
Message-Id: <1295215324-10460-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1295215324-10460-1-git-send-email-eric@eukrea.com>
References: <1295215324-10460-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7706503388184227146
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/4] slugos: prefer busybox 1.18.2
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
X-List-Received-Date: Sun, 16 Jan 2011 22:03:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: Mike Westerhof <mike@mwester.net>
---
 conf/distro/include/preferred-slugos-versions.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index 83c09e3..4649c90 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -26,7 +26,7 @@ PREFERRED_VERSION_autoconf			?= "2.65"
 PREFERRED_VERSION_autoconf-native		?= "2.65"
 PREFERRED_VERSION_automake			?= "1.11.1"
 PREFERRED_VERSION_automake-native		?= "1.11.1"
-PREFERRED_VERSION_busybox			?= "1.18.1"
+PREFERRED_VERSION_busybox			?= "1.18.2"
 PREFERRED_VERSION_dbus				?= "1.4.1"
 PREFERRED_VERSION_glib-2.0			?= "2.26.1"
 PREFERRED_VERSION_glib-2.0-native		?= "2.26.1"
-- 
1.6.3.3



