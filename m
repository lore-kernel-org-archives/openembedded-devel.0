Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5p-0005cR-W5
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:22 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=D3HNVt+U9rWfjEjBH5KZ4Ofg7FqGzs57asyBsL7fiO8=;
	b=nNkTWWDep8xV1Pf614Vct8QaLFsy9HgPZ+h6NW11SQeoDxbtKsnjVsOx0oICTfCAdC
	V7o1M9FN3ck/NfwoD2EXIxvtSEsMbM9KcWTmmP1AAU+QV5K9x3fpcWSqys56t9IQp988
	7q4VdyxVmoIanwAKc6gWwfZrKdhif5kvshfq8v4p9zLuDPfxIk6n62nB/HN+G5NIwpPi
	U4YlQEzPLJg4VHoPul1VELhHraAUyiG9xHi6WZZ8enbMmgjE+0vLvlaAl/StCqjvO025
	ZPC2nS+T2GqcGoM825Wyaj/82kcrO5NqDqKiO7xlxQ6U2xqkyKNTfvVtrLpO967xXW62
	meyg==
Received: by 10.14.213.134 with SMTP id a6mr61945917eep.45.1354048510887;
	Tue, 27 Nov 2012 12:35:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm42853604eem.3.2012.11.27.12.35.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:47 +0100
Message-Id: <f46be41dba88d0036a9681672c625582fd086115.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 10/21] e-base: bump EFL_SRCREV for E17 alpha3
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 03f673d..3e7499f 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "78871"
+EFL_SRCREV ?= "79400"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



