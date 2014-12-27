Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 03C6C713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:45 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id eu11so14696657pac.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8PK1HWvg+OVZ4pSi5IRLRfPmef/buvGHrd9Kfvd/tPo=;
	b=JNWa5wWc2eDi6Dju+47t7AXSH1XW44SCgwUYa7RM9dkXc8K85pOF16ezPVhC1Y42jE
	vLt/DrAXZnMIAe6fbtk6t8Zf/udVRYWXuQs2Te+COnuJxUSP6uhBHv2y+hDp85+SU+Y3
	kIZsRhYW3kjUn16o/7bHKrE0r5FOlPgOW10ISmR4CUj6CXu8faK+ybjbk+reIFKiENRJ
	H4DPPEb4li+9Jp353770D5bGp+tpMhTUv3YUNV/rN+5hZfUCvn2/RlEl+Ecd/CKnkb7A
	FLw3Eg7oXU3+IrmjW9e+JWHPULn+DXNKEMf7lFTJ9PqFcIFiGx5qd/c+eFNYlR4TdMm2
	Byew==
X-Received: by 10.66.119.239 with SMTP id kx15mr67103392pab.11.1419700966003; 
	Sat, 27 Dec 2014 09:22:46 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:04 -0800
Message-Id: <1b01b3c6288df09160f0a8d28c0ab56d4eb17be1.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 17/27] meta-gnome: fix typo of directory name
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:45 -0000

From: Kang Kai <kai.kang@windriver.com>

Fix typo of directory name 'recipe-devtools' in meta-gnome. It should
recipes-devtools.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/{recipe-devtools => recipes-devtools}/glade/glade3_%.bbappend | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-gnome/{recipe-devtools => recipes-devtools}/glade/glade3_%.bbappend (100%)

diff --git a/meta-gnome/recipe-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
similarity index 100%
rename from meta-gnome/recipe-devtools/glade/glade3_%.bbappend
rename to meta-gnome/recipes-devtools/glade/glade3_%.bbappend
-- 
1.9.1


