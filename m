Return-Path: <philip.balister@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1739475E7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 17:34:27 +0000 (UTC)
Received: by qkch123 with SMTP id h123so13152662qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 10:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=9dvv2orO4EpAw0Wv6p+MfF66iEe0yu9apJi7d0Mp5lQ=;
	b=N9o1hjD85GKl7ZMFsKtdRwGwgP3rfKQyRFted+EFwuwPdmSaYH5ocLGbOVIIclwEny
	dw+wzq3Fngu4DjyRMF0YuPR7xynM52KthgVe2n6OmpJrPpZ902tPkGLjck4TsH9b9xUk
	dsqKcKql7hG7irCmPr0X9lOgEBeDzNb5OC2f1KmikYWZw1mAZK9S1QBbfYXwYYXUMts6
	3gMmZWtVk8jtX6w2z8n1f6ibvCk3dYOjbNaGAJ5VD4wQd4XioSPPAmYeO1+dwFFTQkMP
	E6wOgtbpHNSDh72uqmTpU1q8Hda1uv0QK2WOqP2ad8Bcvas+MoTU79HucTmqPKmrjzqO
	M/mQ==
X-Received: by 10.55.43.130 with SMTP id r2mr7923438qkr.54.1440092067909;
	Thu, 20 Aug 2015 10:34:27 -0700 (PDT)
Received: from thuvia.localdomain
	(pool-108-44-118-114.ronkva.east.verizon.net. [108.44.118.114])
	by smtp.gmail.com with ESMTPSA id
	124sm2635799qhr.36.2015.08.20.10.34.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 10:34:27 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 13:34:23 -0400
Message-Id: <1440092063-18022-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] cppzmq: Bump rev.
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
X-List-Received-Date: Thu, 20 Aug 2015 17:34:28 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 3409976..1a59716 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.zeromq.org"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
-SRCREV = "ee47ae4cddc304741526c9bb2035f98c3274e0ec"
+SRCREV = "a88bf3e0b0bc6ed5f5b25a58f8997a1dae374c8b"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
-- 
2.1.0


