Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhNr2-0005W8-4K
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:57:16 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtIFAEciPU1bdWOb/2dsb2JhbACEE5I4jxCrK4M7AYxygSSDOHQEiyA
X-IronPort-AV: E=Sophos;i="4.60,370,1291590000"; d="scan'208";a="323126466"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Jan 2011 15:56:32 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNqJ-0006aI-Pw; Mon, 24 Jan 2011 15:56:31 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNqJ-0007v4-Lh; Mon, 24 Jan 2011 15:56:31 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhNqJ-0006PQ-AG; Mon, 24 Jan 2011 15:56:31 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 15:56:30 +0100
Message-Id: <1295880991-24606-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] linux-omap4: push to a newer SRCREV
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
X-List-Received-Date: Mon, 24 Jan 2011 14:57:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 recipes/linux/linux-omap4_2.6.35.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/linux/linux-omap4_2.6.35.3.bb b/recipes/linux/linux-omap4_2.6.35.3.bb
index f5a11f4..0502554 100644
--- a/recipes/linux/linux-omap4_2.6.35.3.bb
+++ b/recipes/linux/linux-omap4_2.6.35.3.bb
@@ -4,7 +4,7 @@ require multi-kernel.inc
 
 CORTEXA8FIXUP = "no"
 
-SRCREV = "35528f5b0481485654a6577306f7a80d9e6a5cf5"
+SRCREV = "ti-ubuntu-2.6.35-980.1release13"
 
 SRC_URI = "git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-L24.11 \
            file://0001-tiler-avoid-lock-ups-due-to-unmapped-DMM-entries.patch \
-- 
1.7.0.2



