Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 542F26EC6B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 22:22:29 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so582256eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 14:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s0uoUV16l8/YZkWOO5nDrB/B3jSW2lDC0toe3XeFeYw=;
	b=zVkAdq6UkQCMbPtn77z/bQw3J4pRXhPP+9rET1IccIVvR7w24Fwk5S+KQ6/yP6me6j
	W7sBaQ1tf8f4362D0hu6hcqRgNKeArFKeyDBz9eMFB2WagWt6op865kyT4qIgUHmYl/G
	ryvgbr1/EooKUb3oKpgv2miLierPkD/4kJUurMbW/VlY50SZ680i8hKAUYJ6ghH91/YN
	8s5XUBODMck76RMvKwnYxSzbH0dNmGSOO0isRvhnY3fqFGftyVcKIY+Hc+q9AmxeEd6+
	uuuLYlHNCIrnuNqJut2S3BfjTnveNnpitvurftQR82cVO4XfGKHisL9IIl66Yv6Lxy9j
	K9iQ==
X-Received: by 10.14.223.9 with SMTP id u9mr20659516eep.79.1393194150121;
	Sun, 23 Feb 2014 14:22:30 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm56081839eep.11.2014.02.23.14.22.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Feb 2014 14:22:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 23:22:20 +0100
Message-Id: <1393194140-24218-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1393194140-24218-1-git-send-email-Martin.Jansa@gmail.com>
References: <1393194140-24218-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 2/2] xf86-video-geode: Move to nonworking
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
X-List-Received-Date: Sun, 23 Feb 2014 22:22:30 -0000

* according to http://www.openembedded.org/wiki/Bitbake_World_Status
  it's broken at least since 2013-10-30 and nobody seems to care

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/{ => nonworking}/xf86-video-geode_2.11.14.bb              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{ => nonworking}/xf86-video-geode_2.11.14.bb (100%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb b/meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.11.14.bb
similarity index 100%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.14.bb
rename to meta-oe/recipes-graphics/xorg-driver/nonworking/xf86-video-geode_2.11.14.bb
-- 
1.9.0


