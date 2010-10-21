Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHt-0007iN-9r
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:01 +0200
Received: by gwb17 with SMTP id 17so75365gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=CHpCD1RvDDzj71fhIOqqHLuQQGQ9qul1E6wA6bxNjxE=;
	b=ARxUqRUAaLfYGOHIrgOubSGx4bvXerGRpMt4nrb5FvFQAH+DI/HW4s9CeBKulm+/TG
	UgNjQzuuhoibHqEWKE97l7OCHTc8hQb3Yn/Nc274nFBa8/wUgFieoma1h0hwWyUxc0ZV
	wDgrDnrCF5bbOodYdeW/u5sO20nrsQYXaQvME=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=v9o/7QbHJ0QLoEGagZIuOn8oOBuf7edzOS62hIrz2bYXX+THjoxHryzAyHh998YPKT
	YTNog1RYiq29GGTMpHZiT9GfoK8vOpihrOzKTOOIIhReh//JVpeK455qkSRlYArACKMB
	2QzOtVQO2BqXZZy0MFfQBdcjA1qCFW4DyTd28=
Received: by 10.151.8.8 with SMTP id l8mr3761445ybi.251.1287668035507;
	Thu, 21 Oct 2010 06:33:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:54 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:22 -0500
Message-Id: <1287668010-11310-15-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 14/22] pkgconfig: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:35:09 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/pkgconfig/pkgconfig.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/pkgconfig/pkgconfig.inc b/recipes/pkgconfig/pkgconfig.inc
index acbda40..4edad6a 100644
--- a/recipes/pkgconfig/pkgconfig.inc
+++ b/recipes/pkgconfig/pkgconfig.inc
@@ -4,7 +4,7 @@ compile/link flags that works with automake and autoconf. \
 It replaces the ubiquitous *-config scripts you may have \
 seen with a single tool."
 HOMEPAGE = "http://pkg-config.freedesktop.org/wiki/"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 INC_PR = "r8"
 
 SRC_URI = "http://pkgconfig.freedesktop.org/releases/pkg-config-${PV}.tar.gz \
-- 
1.7.0.4



