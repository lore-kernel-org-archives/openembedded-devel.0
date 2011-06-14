Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWWrq-0006UB-S2
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 18:53:30 +0200
Received: by vxd7 with SMTP id 7so5158528vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=EiboGC+5x3s4tLX3zVQsAuHyoW+Mxjt6cmjl83VmZa8=;
	b=efiQMh54Kwc25ShGvFVzh2d+PKpoCpOn0k/h7tbd3hbnBLURYN7ik02SBOFaJU9Etk
	YHxfEoyZGQOAuveJ5sYZ51dyNy5go+jWcRwASXDU2MVEWb5g8/gTC7TWb221kTNYZb00
	2n5oi0PMn0f9R+7lGtObZdIuGc7nZ5k/+w7iE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=PTgOQj237zClXyQBpPey9wAG3h2/uMh82oLdLYO00XAo4IiVG/SpJl8+xILaW1OSl4
	ard/NHJaO8Eq+EUuAkHfZl6FvOCCsbv8cvpnGFFpJU/zhu6NFsVtQ2DEop4qWae4TmbA
	3rqUdo00fzG2V+8OaCkDquBHjAcw17ynba9VA=
Received: by 10.52.177.166 with SMTP id cr6mr6037780vdc.151.1308070194928;
	Tue, 14 Jun 2011 09:49:54 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id bt2sm2307123vdc.12.2011.06.14.09.49.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 09:49:54 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 16:49:34 +0000
Message-Id: <7f3cc6bd9bc16d66b66f7fded64aff1b1f8c3820.1308070134.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 3/3] freerdp-extension-xpunlimited: bump SRCREV due library renaming
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
X-List-Received-Date: Tue, 14 Jun 2011 16:53:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
index 4fc6928..c9721f4 100644
--- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
@@ -14,7 +14,7 @@ PR = "r0"
 
 inherit pkgconfig cmake
 
-SRCREV = "d27f90a0128c687ce74cc922dba8b7eeb33f0654"
+SRCREV = "e952627ff4c116b4ce8541c91cb96bd5422c4a0d"
 SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



