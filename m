Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi1R-0001w5-SY
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:14:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377424eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5xxDqesoossjoCj6mXbu/TCZrbhYlpDlvm8KywqWJlc=;
	b=hhFZ98rW8jZw1lUYOH4k4JCi2LRy28MtLI52C6DEFkaP8uEeo1ddIavh/1hq8sxvRM
	6RhllUpIbYNInMlgwXAPP93MNVatHRqVtRrx2GGWXrMGCtvnH0oAxqXXvZW+SqdpzAjt
	CB633JVNGSrxZcDkZYagJKEnp4yfMIS6pCMTDuBLo+NREFp7hE0mlqsqYfjT+HWmK/e7
	8ClDjJp670LWqC6E0Lg5WXLh7fez5FO2sCXvw5Ml1JZvAK0CDBRPANvz84HoyJKw0nli
	sk30X+tY61pM7WX+nR8ZuAjY4gSsMBCcSRjPst1+SV6QjErBapnQIuvk0ToLJ2bDC1Tj
	3GMA==
Received: by 10.14.221.65 with SMTP id q41mr8908268eep.30.1354586388217;
	Mon, 03 Dec 2012 17:59:48 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f49sm34787775eep.12.2012.12.03.17.59.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:59:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:34 +0100
Message-Id: <2a7bd7f595dba887a00e0eb663330a41fb0770ed.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/58] e-base.bbclass: bump EFL_SRCREV for E17 alpha6
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
X-List-Received-Date: Tue, 04 Dec 2012 02:14:10 -0000

* changelog: http://enlightenment.org/p.php?p=news/show&l=en&news_id=67

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 4099351..9ff0ffc 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 SRCVER ?= "${PV}"
 
-EFL_SRCREV ?= "79741"
+EFL_SRCREV ?= "79754"
 
 ARM_INSTRUCTION_SET = "arm"
 
-- 
1.8.0



