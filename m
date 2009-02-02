Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LTxII-0000BD-3s
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Feb 2009 12:48:50 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id 772F0714C87;
	Mon,  2 Feb 2009 06:40:47 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: 0.175
X-Spam-Level: 
X-Spam-Status: No, score=0.175 tagged_above=-10 required=5 tests=[AWL=-0.323, 
	BAYES_00=-2.599, HELO_LH_LD=1.215, RCVD_IN_PBL=0.905,
	RCVD_IN_SORBS_DUL=0.877, RDNS_DYNAMIC=0.1]
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDrE0nQT4swc; Mon,  2 Feb 2009 06:40:47 -0500 (EST)
Received: from localhost.localdomain
	(82-46-19-72.cable.ubr02.bath.blueyonder.co.uk [82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id 367BE7156D5;
	Mon,  2 Feb 2009 06:40:46 -0500 (EST)
From: David-John Willis <John.Willis@Distant-earth.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Feb 2009 11:40:49 +0000
Message-Id: <1233574850-4230-3-git-send-email-John.Willis@Distant-earth.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>
References: <> <1233574850-4230-1-git-send-email-John.Willis@Distant-earth.com>
	<1233574850-4230-2-git-send-email-John.Willis@Distant-earth.com>
Cc: David-John Willis <John.Willis@Distant-earth.com>
Subject: [PATCH] Add fb.modes default file for the Pandora.
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
X-List-Received-Date: Mon, 02 Feb 2009 11:48:50 -0000

Signed-off-by: David-John Willis <John.Willis@Distant-earth.com>
---
 packages/fbset/fbset-modes/omap3-pandora/fb.modes |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100755 packages/fbset/fbset-modes/omap3-pandora/fb.modes

diff --git a/packages/fbset/fbset-modes/omap3-pandora/fb.modes b/packages/fbset/fbset-modes/omap3-pandora/fb.modes
new file mode 100755
index 0000000..0c87401
--- /dev/null
+++ b/packages/fbset/fbset-modes/omap3-pandora/fb.modes
@@ -0,0 +1,6 @@
+mode "800x480-65"
+    # D: 36.001 MHz, H: 34.124 kHz, V: 64.998 Hz
+    geometry 800 480 800 480 16
+    timings 27777 40 214 10 34 1 1
+    rgba 5/11,6/5,5/0,0/0
+endmode
-- 
1.6.0.5



