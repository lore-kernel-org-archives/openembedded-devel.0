Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 528F160667
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 22:40:16 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x54so2835410wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mNvJjTkVMxumcxClg5/mxJflC8aZk4N66LqzqQz5y6w=;
	b=LSHGWxSlVouTg/Xy3aBC0wmJeZYaTHEOdZmfhAqC2JgH7z9Mg0/OmGk5n/AzjuShbt
	3vDtFuI6AzDsTGwsJNVj5Q1giYtLY2O4mGjMaa4M3EEfIUgIMcqmLYqlmRScF7RsUbaF
	Qhzmvxl5F42LsRJIdgDz9io1i7Lc5kUbHzIWZ2EgD/wH3TLuQ1zoI+38Iq3VaFTCBSJY
	a0UBTPyNIP6ZSKRSeJvKCdEriAJMOazHgQRK0ZurlCbWLHSjWKfP22c2GqLX9o+nxF05
	cQMiIXqUxGkKMO/KiWXeQ1LSlFGQAnhvzt4SVX+yQM9ZGuYzgh2GBTeesB6i1DPFSeny
	odeQ==
X-Received: by 10.180.72.227 with SMTP id g3mr6300718wiv.1.1371508816546;
	Mon, 17 Jun 2013 15:40:16 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	b11sm25213954wiv.10.2013.06.17.15.40.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 15:40:16 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2013 00:40:09 +0200
Message-Id: <1371508809-4106-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] palmtt2.conf: remove, device support is present in palmtt.conf
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
X-List-Received-Date: Mon, 17 Jun 2013 22:40:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/palmtt2.conf | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 conf/machine/palmtt2.conf

diff --git a/conf/machine/palmtt2.conf b/conf/machine/palmtt2.conf
deleted file mode 100644
index 2c62a04..0000000
--- a/conf/machine/palmtt2.conf
+++ /dev/null
@@ -1,2 +0,0 @@
-WARNING:="${@bb.fatal('\n*\n*\n*    Sorry, There is no dedicated configuration for the Palm Tungsten T2,\n*    because \
-its very similar to the Palm Tungsten T. Use MACHINE = \"palmtt\".\n*\n*\n')}"
-- 
1.8.1.5


