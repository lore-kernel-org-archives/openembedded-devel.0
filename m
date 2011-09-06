Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qRi-0000AJ-Dc
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:51:50 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so2463833ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=F0O2SuIDx3KOruSgfK+RMxcHcnbPV1Dy3+XbatWqbJ0=;
	b=ZNvxuwd7DNI5WKyaPS13s0uP1P5HtG5BRWajYm94RjkTotD+mIYgqP6E+8JrKa87sF
	gF/PQ8J5p1cVdhvkzafODG1V/5kHpRkhJEiiajKP2Yl4PRrJXOVXiU1m03voHluVckQQ
	sC0tgLggJNk7RrYIOsGJJmiRpF28+QvfPS88k=
Received: by 10.14.2.76 with SMTP id 52mr1578947eee.145.1315295211768;
	Tue, 06 Sep 2011 00:46:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f1sm13172709eec.0.2011.09.06.00.46.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:46:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:38 +0200
Message-Id: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1315295093.git.Martin.Jansa@gmail.com>
References: <cover.1315295093.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/6] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Tue, 06 Sep 2011 07:51:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index b4b91f4..0ffabdd 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "63052"
+EFL_SRCREV ?= "63195"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.6.1



