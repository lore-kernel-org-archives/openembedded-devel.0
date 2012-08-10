Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzpmI-0005XQ-Va
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:01:27 +0200
Received: by wgbdr1 with SMTP id dr1so1223439wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=05XJUJGS1GfG8A99vtW+nkqbedsianJ3QL1B1ONZWSg=;
	b=0JM80Ftlmv4jSsKFTxVfCit9/MwE/50Ac8iC0WHiWj5NU07LqX5Jr2RksXTxXTIHxd
	QGGOz1/R3eV1OdFY6RAlQHMWHgUk+hM/8YSxJeT9t0HseMkXPEMf+f9ANqWVLro1V8ZU
	FPpyaIigeh+7pFKSePRBUgekVVpDU+o0bhke1ydhby0Vd40LhEncXnDu6nil9nLUdezX
	lF4BMiHQgRCzRxpSeCe2b5nVxWkt1KONzqXeZ+MD1Q9S5svULsY1+SeFh5Ceigjpv8Sw
	Y6ln4SZATMEuTumKVfyJdRIceaTZQcN+BQHp/Qm932/Euq0Cej4+7UHahQC8Ecwd+LEF
	MLTw==
Received: by 10.180.80.134 with SMTP id r6mr6315956wix.1.1344606577518;
	Fri, 10 Aug 2012 06:49:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm7858745wib.5.2012.08.10.06.49.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:49:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:39 +0200
Message-Id: <dd295462d3a870015e5b61c92e4f6df4a40394bc.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 44/46] e-base: bump EFL_SRCREV for 1.6.99-alpha
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
X-List-Received-Date: Fri, 10 Aug 2012 14:01:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 439e5bf..4708fdd 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "75077"
+EFL_SRCREV ?= "75097"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



