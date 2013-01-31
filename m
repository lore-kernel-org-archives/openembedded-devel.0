Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0wtS-0002O3-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 17:21:42 +0100
Received: by mail-da0-f41.google.com with SMTP id e20so1352640dak.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=XxpyGGQXI6eVLxXsDAozmAymHbt1gAVk7ACRWOpIhxM=;
	b=IgJERnaEz6f39Avxc5bZWwQUNLYLCvu06gZMWrklod6GoHehXHUWdNUWLm4c2NCwBI
	/icBValvJ2ZkLtrjqAglenTfqGT52lJerd1LX+K+XJKA+fE+pW9THnkJ2WIgwjAcoCcg
	L1cJIPQsFTSg7OMFK8IbOv86OyO84YGBhnN2DGx1Moem3v909nkIAXxlno6+K0ReFaH1
	9loWMbv0UtVfuIxaeS+k6Dp5W5fNTuXC4VsSj6e9RSU5O/7BRg8myROiRQF7nXd1iIfb
	41l0m9vxJjQUUGDlj5iToo6+O8lRm7mPLiitwBZgBYbtdIOB90EJ5CbdUmClGa/5SQK+
	bp4A==
X-Received: by 10.68.213.169 with SMTP id nt9mr11530110pbc.65.1359648358518;
	Thu, 31 Jan 2013 08:05:58 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qm9sm5397531pbc.10.2013.01.31.08.05.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 08:05:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jan 2013 17:05:53 +0100
Message-Id: <1359648353-23681-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH][meta-efl] e-wm: upgrade to 0.17.1
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
X-List-Received-Date: Thu, 31 Jan 2013 16:21:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/{e-wm_0.17.0.bb => e-wm_0.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-efl/recipes-efl/e17/{e-wm_0.17.0.bb => e-wm_0.17.1.bb} (61%)

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.0.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.1.bb
similarity index 61%
rename from meta-efl/recipes-efl/e17/e-wm_0.17.0.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.17.1.bb
index f12072c..dbf04a5 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.0.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.17.1.bb
@@ -12,5 +12,5 @@ SRC_URI = "\
   file://applications.menu \
 "
 
-SRC_URI[md5sum] = "b2824849c2c56d80fdc11c1f2171d4ec"
-SRC_URI[sha256sum] = "469a493c6f7fb2599912edb5ec17181554187c2845bb5290878f1eba9e04b258"
+SRC_URI[md5sum] = "fcd29635328efa2bd207f18fe230e41a"
+SRC_URI[sha256sum] = "2d9327158b1bdf4301d898a1dca7d94d3e480f6e595dee05809dc66969df5dd3"
-- 
1.8.1.2



