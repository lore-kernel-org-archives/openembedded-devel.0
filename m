Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhlaU-0000wR-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:17:46 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArcEAIyGPk1bdWOb/2dsb2JhbACWUY8Rr18BjSeFTwSMKIVj
X-IronPort-AV: E=Sophos;i="4.60,374,1291590000"; d="scan'208";a="721343428"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 25 Jan 2011 17:17:02 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhlZm-0005P7-0x; Tue, 25 Jan 2011 17:17:02 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhlZl-0004WL-Jl; Tue, 25 Jan 2011 17:17:01 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhlZl-000455-7w; Tue, 25 Jan 2011 17:17:01 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2011 17:16:53 +0100
Message-Id: <c47809e46ea6a0fa950c961b01213171d4bea774.1295971903.git.vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <cover.1295971903.git.vjaquez@igalia.com>
References: <cover.1295971903.git.vjaquez@igalia.com>
In-Reply-To: <cover.1295971903.git.vjaquez@igalia.com>
References: <cover.1295971903.git.vjaquez@igalia.com>
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCHv2 2/2] python-scons_1.3.0: fix licence type
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
X-List-Received-Date: Tue, 25 Jan 2011 16:17:46 -0000

According to the wiki [1], the licence of the project [2] is MIT, not GPL.

1. http://www.scons.org/wiki/FrequentlyAskedQuestions#head-4fe23271137d5e5e95370a1360909ca303157c0d
2. http://scons.tigris.org/source/browse/scons/trunk/LICENSE?revision=557&view=markup
---
 recipes/python/python-scons_1.3.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/python/python-scons_1.3.0.bb b/recipes/python/python-scons_1.3.0.bb
index a0690d1..82231f2 100644
--- a/recipes/python/python-scons_1.3.0.bb
+++ b/recipes/python/python-scons_1.3.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "A Software Construction Tool"
 SECTION = "devel/python"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "MIT"
 SRCNAME = "scons"
 PR = "r1"
 
-- 
1.7.2.3



