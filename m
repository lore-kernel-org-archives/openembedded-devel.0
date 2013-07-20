Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 31BF46AF2C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:19 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so2887620eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=VGjmrAdRkSc8wkzGHuJk2C9wFghhzMr2XE0P2yob7tw=;
	b=qmqQYycFE1GAiBRTrpSDGWrCVUhcslw7zqsVMVxadcZFAmd+ISvhj45Qx4ni3u0h2V
	lrFeePEKkbi388sNCXKp7LiL+xru68n7EhgsPS/CkVA4H9VM0qDuSF6MFG3H5d6awfrq
	AEzn3webjd0fBxoyMy+Jrv9u+wUkFD7zwjV0KmJFJ3MqaWYePBstkbCwakl4jTqtlyp1
	KMuJK0LM5VfxL40DU/B/Dxw0iIZvDAghmRW3tX/J2E+UpwKicLVOFTUxLhBZVGpGuALi
	r/pMbPkIXrvgybuy7ZmOOHUnJErjfM8rTwyrJQ2sTO8MSzRkPF6eMZ1/ptbDX6hGUBiz
	JgVQ==
X-Received: by 10.14.205.72 with SMTP id i48mr20535708eeo.139.1374332899425;
	Sat, 20 Jul 2013 08:08:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n5sm35914514eed.9.2013.07.20.08.08.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:26 +0200
Message-Id: <73c191ca11fbb6f3d1be65c29bd234d3222375b8.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/11] samba: use more specific LICENSE
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 6092226..e7defaa 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -1,5 +1,5 @@
 SECTION = "console/network"
-LICENSE = "GPL"
+LICENSE = "GPL-3.0"
 DEPENDS = "readline virtual/libiconv talloc"
 
 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
-- 
1.8.3.2


