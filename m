Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4849165E94
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:29:07 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id x48so15799765wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 00:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zLjdTDue+rAl2Tt5VSjLgCmR7vMsS2V+RqYIvlLSt8E=;
	b=JgJDGLwMMmti8TqLx3lZaBkX8KSfaZkVxdNS01fkDE1b61W7NNrSZeKBQPyVSoTvwr
	Qb2D27knG7t6jZMU5u+WwIXuAHy9tiIykEUMbHLedB6+X1W7ceTWU5yUHFqXWrYbD8mA
	0dAPSPk6VCMCqikxWFHBExU/gfhxQBjHkIeDqQc351UD5YYh9X3P8crQG13D4HhioraQ
	anl0shWTZZOTLriMc8rMbpKhIFMyqV3708lBNYfwzO/XW0uxUMt5PXgyyQewX1DcQ0X7
	HvTQMGEe0cAxjU2miahhWocdpDe9UVHAX0+RLVe5fBe5hV87twMZ81ox5vgqss1lrSV8
	eu5A==
X-Gm-Message-State: ALoCoQkLvZ80UsjYiz51J38tA13AD8mU7wWiK/wl5w4xznQ/jLWqbXcjicJwF97Y1pEg9cuVJBiu
X-Received: by 10.180.99.97 with SMTP id ep1mr25656647wib.33.1409124548722;
	Wed, 27 Aug 2014 00:29:08 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	cy10sm14699398wjb.21.2014.08.27.00.29.07 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Aug 2014 00:29:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Aug 2014 09:29:01 +0200
Message-Id: <1409124541-12549-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1409124541-12549-1-git-send-email-koen@dominion.thruhere.net>
References: <1409124541-12549-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-initramfs][PATCH 2/2] dracut: update to 038
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
X-List-Received-Date: Wed, 27 Aug 2014 07:29:13 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index 9909a6d..ea55a4d 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -5,10 +5,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "036"
+PV = "038"
 
-# v036 tag
-SRCREV = "d50a99c5ceeb7107f624c5d3238d37509b2217a8"
+# v038 tag
+SRCREV = "267a109a81715c8957f14659593deb7b6255d40e"
 SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
-- 
1.9.0


