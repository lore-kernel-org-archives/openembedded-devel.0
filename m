Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrbpU-0000fE-Sl
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 23:30:44 +0200
Received: by wgbds1 with SMTP id ds1so4173601wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GtKrsPtNJmQz+KiytU6guHD77cJ026U7fv37tmTDETE=;
	b=Jq6sdmSxJtm7aGdFAEzgzkTLy8/kWyR92Ov1azO1waWhXINCpqr3oWTU8yWOw13BtC
	N32sdEBLABaqD9m2YMeI29FbcjMHGvEPrd1NxW72185kYoNmHGSqir+mWoAythIDbi0D
	4P0qgyhDZYF5uuwcdO07XTJxRtxwZmspkkdE9QBnC4inffaq0INSeVahunQ+POmEgUG/
	x56dnPb4ROt2Hlp7H3V8nlgxDHU++l17fc1i1RTiEmvmfcKfpFgcBeYk9p4AZAdphb7m
	z4vU2Lv/D0z5gAAHr5b9soq5vZkqVVbd3w7Va9Hj7RQEixGOwTAXKrkLN7rIJq85gHer
	QXRA==
Received: by 10.180.14.8 with SMTP id l8mr9951264wic.6.1342646364008;
	Wed, 18 Jul 2012 14:19:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm364222wix.5.2012.07.18.14.19.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 14:19:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jul 2012 23:19:11 +0200
Message-Id: <5a44806cd323e4be09046cf6d10ac938ac7169a6.1342645937.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342645937.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][RFC 01/14] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Wed, 18 Jul 2012 21:30:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 27dd2eb..c1e564f 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "70490"
+EFL_SRCREV ?= "74035"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



