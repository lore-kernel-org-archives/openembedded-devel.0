Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vHf-0007Ju-3d
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:34:22 +0200
Received: by mail-yx0-f175.google.com with SMTP id 3so2495804yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=l0glZ3XKso0lQKkLPoTrfQaLEuFY/2WjUd69J7v1/zA=;
	b=aNXtsblTOky2XU/e+wzvn5KzMtbbvE0C6IVeNUYDfnFy6QDpSh6vBaZFZnhBLoxfJm
	OpFC56NfbzsPZPYC3WJAXHhZm5ffW1i3Hx7unD70D25/zI0p9SZuahwrhavF1vYzQaV+
	fLhz+53LSPFYjbI93xL+w9KThadliFyEK6wNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YVzAuiXu65sZV8zuiR+WB0Brdrzpkq0b1fpbP98EugFTwwkcfWOOG78Shpjbc4C6Dj
	I7Na5dWW9tpzct/jySxaCuxdAFosiYwRsdsyQoaImu0GvGuibw36y7OvICO0ykjeyfl8
	jn44jkQZXTYt+G5A+6x3oN7/CuS2kvRK8HBzQ=
Received: by 10.150.147.20 with SMTP id u20mr3719653ybd.179.1287668023755;
	Thu, 21 Oct 2010 06:33:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.33.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:33:42 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:14 -0500
Message-Id: <1287668010-11310-7-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 06/22] genext2fs: update package LICENSE
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
X-List-Received-Date: Thu, 21 Oct 2010 13:34:23 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/genext2fs/genext2fs.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/genext2fs/genext2fs.inc b/recipes/genext2fs/genext2fs.inc
index c2984bc..503c74f 100644
--- a/recipes/genext2fs/genext2fs.inc
+++ b/recipes/genext2fs/genext2fs.inc
@@ -1,4 +1,4 @@
-LICENSE = "GPL"
+LICENSE = "GPLv2"
 DESCRIPTION = "A tool to generate an ext2 filesystem \
 as a normal (non-root) user."
 SECTION = "console/utils"
-- 
1.7.0.4



