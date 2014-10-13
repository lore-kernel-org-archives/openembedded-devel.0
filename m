Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6E471834
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 15:22:03 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id eu11so6031888pac.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 08:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3ato8fFhhrKrRxfbQI2ziObrpNbTQe6FvYnDng0RG2A=;
	b=FC/LKjErrlcC/l4zt9cENsrgnZSDEM5sQHlOX0H71CQX5qYc53bQsShpiZPFgejRQ7
	RVyM+qS5rZOSefJd0etcdeeD6ksOKJoc2x9JTgTOnuz83TkC0qo9m451Axfmoanp4PkH
	Le0SSvJfuJsqQ7IGgWTZyac/zsenkh1lHDymC+FRRPIZOc/abfhboq1f4HczKllUHZvX
	WekJZJs0aG2gpZNnZ8dqBQIgi9vGaBSqJJ+zo7Jal3BqLW7ew592qiMRgquE1NUCgXfe
	xMZUye4jhOBM1uTfLDYD7SJYkmB2wsno/zGTWJhe01rfmg8uRj3OY6CaSxS2cF9yeslg
	uQiQ==
X-Received: by 10.68.186.33 with SMTP id fh1mr24346945pbc.105.1413213724579;
	Mon, 13 Oct 2014 08:22:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	jq5sm11517165pbc.32.2014.10.13.08.22.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Oct 2014 08:22:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 08:21:51 -0700
Message-Id: <1413213711-30114-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [[dizzy][PATCH] update maintainer info in python README for dizzy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Oct 2014 15:22:07 -0000

This is the first time meta-python is being taged with a release

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/README | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-python/README b/meta-python/README
index f62ab8f..becf371 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -17,12 +17,12 @@ The meta-python layer depends on:
 
 	URI: git://git.openembedded.org/openembedded-core
 	layers: meta
-	branch: master
+	branch: dizzy
 	revision: HEAD
 
 	URI: git://git.openembedded.org/meta-openembedded
 	layers: meta-oe
-	branch: master
+	branch: dizzy
 	revision: HEAD
 
 Please follow the recommended setup procedures of your OE distribution.
@@ -39,10 +39,10 @@ comments and patch review. It is subscriber only, so please register
 before posting.
 
 Send pull requests to openembedded-devel@lists.openembedded.org with
-'[meta-python]' in the subject.
+'[meta-python][dizzy]' in the subject.
 
 When sending single patches, please use something like: 
-'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][PATCH'
+'git send-email -M -1 --to=openembedded-devel@lists.openembedded.org --subject-prefix=meta-python][dizzy][PATCH'
 
 Maintenance
 -------------------------
@@ -51,3 +51,10 @@ Maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
 
+Dizzy branch maintainers:
+    Otavio Salvador <otavio@ossystems.com.br>
+    Armin Kuster <akuster808@gmail.com>
+
+Prefix email subject with: [dizzy]
+
+
-- 
1.9.1


