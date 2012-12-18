Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0g2-000724-7y
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:10:08 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so365378eaa.19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=LKgV2X7xUKvYiz4niWn6NR8rcfIb0ZmVrlzly2wf/p8=;
	b=D16mCq/zOOO9wzWSA54uJyIPh3Uwif4v9I5RKg5gy6oolYJfF+C95ZTn8gN8geBOW/
	B0nf+ToKV24PGCGvHfjVPCXsww66kcf7eYK8hiD3D6LoyP1hlGqdOvbUD4gN97tRa6jp
	LTSU8GKeC0UsMPtzsP6ncnlzGL0b8WLv/6icJ158EYL94XhgatMkt8slC163uS+jb+KT
	3spCbWG/xsD+j+1fo1VDaFAW/PslpgheeAvvEpeA654aeX8tG4x7WKo/VVSitFwfyv7z
	++jorrQ7pc5esY4L2OJxxQ9TXB08npAKLK5k3vROaSEt7GijezK6YnXK2Xo0JND24Odj
	g58Q==
X-Received: by 10.14.205.198 with SMTP id j46mr7091252eeo.27.1355849716529;
	Tue, 18 Dec 2012 08:55:16 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 6sm4242051eea.3.2012.12.18.08.55.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:03 +0100
Message-Id: <cb99f6dcf07a82601c55501f0be5818be12cbb81.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/10] e-base: bump EFL_SRCREV for E17 release called lucky
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
X-List-Received-Date: Tue, 18 Dec 2012 17:10:20 -0000

* changelog:
  http://enlightenment.org/p.php?p=news/show&l=en&news_id=73

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 1124d53..53df77d 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "80662"
+EFL_SRCREV ?= "80969"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0.2



