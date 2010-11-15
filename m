Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelox.123@gmail.com>) id 1PHmv8-0005z1-Nx
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 01:27:44 +0100
Received: by ywo32 with SMTP id 32so1450898ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Nov 2010 16:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=EBuR2DhP456oupCn8bapIVOAYpa1JngB3/RGTDHKmQQ=;
	b=IgGKahCznMQAYUHaMm8y0nBRQ5oXx5XUVYBoKfNV3aA/e1+1mQ5l4bjAHPDoDNWrU4
	YDOmbHTiTM4BAaJ9Xjc1JH0a8nRpSLwwx8E45zuaOYpirOpTnfSB4n9KrHxTO/XOrXOa
	NZBRy5TlMYpwYo4gohooQlCALLeCYZ4HDlbdI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=i2bvnNgEJq7u4z4KBmsooUQm0WX9HynRCRHxzMK/GKnEK61rATkDfFLaqi/bnT2jCd
	/WH/HsP1EE8wdcbxXrrKX2rBQBXLJ4milixmn2j6f+3phVat7WJb2eOuJ7ze01UTbwCu
	PeQyhCtHb9zODQ6yPin6at3RSQ9p9bSho4mfc=
Received: by 10.100.255.20 with SMTP id c20mr3822122ani.195.1289780799035;
	Sun, 14 Nov 2010 16:26:39 -0800 (PST)
Received: from localhost.localdomain (201-95-47-20.dsl.telesp.net.br
	[201.95.47.20])
	by mx.google.com with ESMTPS id i37sm3087505anh.34.2010.11.14.16.26.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 14 Nov 2010 16:26:38 -0800 (PST)
From: angelox_123 <angelox.123@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Nov 2010 22:26:30 -0200
Message-Id: <1289780790-10045-1-git-send-email-angelox.123@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <angelox.123@gmail.com>
References: <angelox.123@gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: angelox.123@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: =?UTF-8?B?W1BBVENIIHYzXSBtZXRhbm8uY29uZjogQWRkIElNQUdFX0JBU0VOQU1FIHRvIElNQUdFX05BTUUgaW4gTWV0YW5v4oCZcyBjb25maWd1cmF0aW9uIGZpbGUu?=
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
X-List-Received-Date: Mon, 15 Nov 2010 00:27:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This will help me to identify the names of our images :)
* By: Angelo S. Mavridis Bartolome (angelox_123) (from IRC #metano_linux),developer and maintainer of Metano Distro

Signed-off-by: Angelo S. Mavridis Bartolome <angelox.123@gmail.com>
Signed-off-by: angelox_123 <angelox.123@gmail.com>
---
 conf/distro/metano.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
index 934c598..ba0e3d7 100644
--- a/conf/distro/metano.conf
+++ b/conf/distro/metano.conf
@@ -56,7 +56,7 @@ IPKG_VARIANT = "opkg"
 #############################################################################
 # IMAGES CONFIGURATION
 #############################################################################
-IMAGE_NAME = "Metano_Linux-PD.Edition-${DISTRO_VERSION}-${MACHINE}"
+IMAGE_NAME = "Metano_Linux-PD.Edition-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
 
 CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
 DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
-- 
1.7.2.3



