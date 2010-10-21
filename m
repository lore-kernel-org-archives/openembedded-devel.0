Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHt-0007if-ST
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:04 +0200
Received: by gwb17 with SMTP id 17so75337gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=uQtSEF567uDtu3q1JW7aeHZ3d54SLC87z9IkaLKuaD0=;
	b=cjcks9zg+hsSYd206yCj+RcabZLtFUFZCMFsxWZKO9kLxWbC9c0643PfopbugaKhyN
	26FKUzJhjnepqJsZKIxqXClgU8RH5F6FcMMSdJC1l+Mk4VCtSXZGDbRO9VIFTXGDKO5M
	HYjP6R2VCaFiXN0nhzwsRGH9fl+mx2F1t+H7E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Qt0Xhc9UAgw4NJxZVEHbeOoYJd7tbKWGyYO4dgrSIMzqZkqLyY5p7mAtswXpzEDIme
	ugZ2sQUwbhapfZudMaBSCghFnAgbLwzjVC2B/SqoRp++bCv03dV1unQirz1lDXtwhi/w
	cD2y/5le+I3PeEZnZT2pYdWSWaycKUmRBBSg8=
Received: by 10.150.51.20 with SMTP id y20mr3713708yby.244.1287668032695;
	Thu, 21 Oct 2010 06:33:52 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:52 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:20 -0500
Message-Id: <1287668010-11310-13-git-send-email-Chase.Maupin@ti.com>
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
Subject: [PATCH 12/22] libtool: update package LICENSE
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
 recipes/libtool/libtool.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
index 97fdb30..1ddde91 100644
--- a/recipes/libtool/libtool.inc
+++ b/recipes/libtool/libtool.inc
@@ -3,7 +3,7 @@ This is GNU libtool, a generic library support script.  Libtool hides \
 the complexity of generating special library types (such as shared \
 libraries) behind a consistent interface."
 HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 SECTION = "devel"
 
 INC_PR = "r26"
-- 
1.7.0.4



