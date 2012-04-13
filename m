Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SIkjV-0007Av-Oc
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 19:56:29 +0200
Received: by wibhj13 with SMTP id hj13so2915402wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=H3Us60YKEgXjLS87QjbdivfB1irQLWoHnrLvMPUBNi0=;
	b=Sk8P9KMFKAe4eqpCBwARyGieEziGg4O2MQ8nM6EECwoIev1SWvb0hhmniexi1sUkgR
	mgA8E3T3lcF5wGQphNtFeW2nDs8ADh69WFvqica78kDP08vaOCu/A04FgQm83npjM+g2
	oiHmDg2bY4pMS7hPUSuxWw211ee6rfhgezPwMpfw6W2hVAUN59+FQdgTBzB5z0VWzyM1
	5ZZa4n1Yc6ywpHO7kXKe5coSkZNhm6aBtRtfXgBFrFySF2/80XKwERLJCL7xMR/L0P6A
	gMNDa0ud6KQk33eOPaUiEdqbwTseYfNXw1McL9dHPPELPyjQFenFZB/bMVc3Jjz2v/Xi
	DFLw==
Received: by 10.180.101.136 with SMTP id fg8mr6789830wib.4.1334339228388;
	Fri, 13 Apr 2012 10:47:08 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id j3sm10249272wiw.1.2012.04.13.10.47.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 10:47:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Apr 2012 19:46:56 +0200
Message-Id: <1334339216-5824-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe] libxcursor_1.1.12.bbappend: remove
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
X-List-Received-Date: Fri, 13 Apr 2012 17:56:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Error message during parse was:
ERROR: No recipes available for:
  /oe-core/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
ERROR: Command execution failed: Exited with 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xorg-lib/libxcursor_1.1.12.bbappend            |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend b/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
deleted file mode 100644
index d3267ac..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native"
-- 
1.7.6.5



