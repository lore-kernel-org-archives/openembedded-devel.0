Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TjHhk-0006xq-Fj
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 23:56:36 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1522433eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0ObvwZ/uGuK0ohJVY44FeR3qGyfpC8hC3/gy3oL3OF0=;
	b=lkQQ6Y10xU2T0o417mfRYUpsdaBYd+iqBD6KJM6bux1Byk1B5Ml9ZzI3xa6/A2nars
	4e4DHr6IXlqDrQOppdsEQETZu4c0v4hrTO1I55mpJkIqew59eTZIhU4uA8lGHklSxkb5
	W43f5rhgl2l2intIcOP1JvER4NdXR8q23Mc19OcdC4joTdnH6tBHYgqwjwpMiykTcKHq
	af4Lv+lVVyRs7Blq4+gqshZEbA/lO+oZqMNokkCCigvyNOzDRjN7HKsRvpiTzaOtiBlH
	oi2Yci3zP81euKPigA0Cmvz+/FKwXMsXNg5UH1Vny9Ui5kDYtOr85wDg1gsUircpFdd+
	PRyg==
Received: by 10.14.225.72 with SMTP id y48mr9067755eep.46.1355438521347;
	Thu, 13 Dec 2012 14:42:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w44sm5685766eep.6.2012.12.13.14.41.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 14:42:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 23:41:46 +0100
Message-Id: <656ff747d3d473ec60f3e9be46a6d360afc0370e.1355438402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355438401.git.Martin.Jansa@gmail.com>
References: <cover.1355438401.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/11] e-base: bump EFL_SRCREV for E17 gamma
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
X-List-Received-Date: Thu, 13 Dec 2012 22:56:36 -0000

* changelog:
  http://www.enlightenment.org/p.php?p=news/show&l=&news_id=72

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 0c7fa8e..1124d53 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "80477"
+EFL_SRCREV ?= "80662"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0.2



