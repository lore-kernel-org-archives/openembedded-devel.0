Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHw-0007eE-FO
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:59 +0200
Received: by mail-yw0-f47.google.com with SMTP id 5so2895458ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=RyYBFjudNPxF7aRtEnrmx5Lc+s0Q/g0ajUmHFDheNU0=;
	b=rnrzMgiYTAa48qAXSKU1G0vRb6glGJbSnJEEo3LJwGWiYUYJS5zRyh8ADLc0uqIVPV
	DsDAnXN1W8aOgOFCt0TNkFjBNdH9Ut7vccN7Pb4dUx20gnUoAg2VsQVhj8Vmixm+SXVG
	N3NlMj4siM2hpcpnPzDfSWsXf9BtKsICLko/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=FGE5aVUR7C4Lx6cu/YMMK19QcrV4OibxiZp78U/a++uycZ+hjGGvSaRi9q3vP/ruLN
	CT8vG/8636JJrEWAMWTm6mpz+uQo+qxQnvzyWmIECCoxXn1yRgBky4jsagYDEJYyhfO1
	6UYXNBkdDZ9UzFcYMtfmVds0uSoloq96K1BFY=
Received: by 10.150.178.2 with SMTP id a2mr3769868ybf.282.1287668040944;
	Thu, 21 Oct 2010 06:34:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:34:00 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:26 -0500
Message-Id: <1287668010-11310-19-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 18/22] tinylogin: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:10 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/tinylogin/tinylogin_1.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/tinylogin/tinylogin_1.4.bb b/recipes/tinylogin/tinylogin_1.4.bb
index 40171ff..47c1190 100644
--- a/recipes/tinylogin/tinylogin_1.4.bb
+++ b/recipes/tinylogin/tinylogin_1.4.bb
@@ -4,7 +4,7 @@ changing passwords, and otherwise maintaining users \
 and groups on an embedded system."
 HOMEPAGE = "http://tinylogin.busybox.net/"
 SECTION = "base"
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+|NewBSD"
 PR = "r7"
 
 #SRC_URI = "http://tinylogin.busybox.net/downloads/tinylogin-${PV}.tar.bz2 \
-- 
1.7.0.4



