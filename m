Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id B589A73214
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:31:19 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id l7so133367173qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WYDTOZMdikp81epkD085PmR6XZShwLOeSfqgDjAVxh4=;
	b=ttaWJtOs3bfUn8UtIureb+pwiuoQYouvtBSCjUrb1npktcwIppzs3wo173fTEgxXPn
	rWgDxFHL1p2pQXf/rufD2YjBk5qCjl9rqjd0ro9FDAZ2pmueUxlAXFAxXusf496TqDwG
	gcUwndlZPuLep+MLwClS/gxb9PbpUA/vnugDgEO4FnPvjBPulz773ApDkGaCkzC10KMj
	DjbxAYd7N3+W6D67R2oWGJ3lzbKAlzk9wby3vldxDWLy0Lp+P1qLTTPiEp/XqnqOa2Wn
	v7YdkOkFt1vcio1Gi3VhIJBIehzer42zvzYquJNzx79MDjnNA1+IR4nIlpRk7hQMpVxI
	x2wQ==
X-Gm-Message-State: AIkVDXIvS+Xvr/a/c3xxuM9WqT7mz3iway8pB3l/O3X9HjimSv9O7dRmfQj5EBetMcJ0sQ==
X-Received: by 10.200.36.219 with SMTP id t27mr25943206qtt.255.1485189079369; 
	Mon, 23 Jan 2017 08:31:19 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	t62sm13545024qkc.33.2017.01.23.08.31.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 08:31:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2017 11:31:12 -0500
Message-Id: <1485189072-13789-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ipaddress: update to version 1.0.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2017 16:31:25 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-ipaddress_1.0.17.bb => python-ipaddress_1.0.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ipaddress_1.0.17.bb => python-ipaddress_1.0.18.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.18.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
rename to meta-python/recipes-devtools/python/python-ipaddress_1.0.18.bb
index bfee254..cc4f589 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.18.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
 DEPENDS += "python-pip"
 
-SRC_URI[md5sum] = "8bbf0326719fafb1f453921ef96729fe"
-SRC_URI[sha256sum] = "3a21c5a15f433710aaa26f1ae174b615973a25182006ae7f9c26de151cd51716"
+SRC_URI[md5sum] = "310c2dfd64eb6f0df44aa8c59f2334a7"
+SRC_URI[sha256sum] = "5d8534c8e185f2d8a1fda1ef73f2c8f4b23264e8e30063feeb9511d492a413e1"
 
 inherit pypi setuptools
 
-- 
2.7.4


