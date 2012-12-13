Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhg-0006wK-OY
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:32 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522417eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=g5LNviiWTfPyWjZvXVMFctht5PIweiEOL/iqbOjelwY=;
	b=KdlXVfCFCeBh52uqyr0PGMLl4RGbzOvWUmgcwlLYBbqUu5MS4Nlg7LG6Vq5VtBKiU1
	3dH8mUT54JFScMv31ILjHJeFgLoOe35aC6bZGskCU+Ii0Gs1uSQ3yGds1ncA6BvMT8jI
	Iqi3lR1pQpVzBGRPROiLGCyTGHe8iGbs3qZYLLkdPwyIyABM+U5644gNwpgjC5f4p1Qu
	LKt2WKPCvc6PrHJjJVN9VcXuoo+UdO8pyTb4OrWYqlcK6fCBN+rLxFWb41/OSBKEB46g
	F2UUGABsT5a8Bz+n/c6fkbjFEp6Z4D9KyxkD36EKQMtB8RsYHJFgbCBDjE/Uiiw46gbd
	clDQ==
Received: by 10.14.175.133 with SMTP id z5mr9313767eel.15.1355438517623;
	Thu, 13 Dec 2012 14:41:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm5678829eeo.8.2012.12.13.14.41.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:41:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:45 +0100
Message-Id: <39dac1d55f8bf1b95d894154a0fddaa3a749326a.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/11] e-base: bump EFL_SRCREV for E17 beta1 and EFL 1.7.3
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:32 -0000

* changelog:
  http://www.enlightenment.org/p.php?p=news/show&l=&news_id=70
  http://www.enlightenment.org/p.php?p=news/show&l=&news_id=71

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index ab0063b..0c7fa8e 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "80174"
+EFL_SRCREV ?= "80477"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0.2



