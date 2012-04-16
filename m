Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SJiVV-0000o0-6X
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Apr 2012 11:46:01 +0200
Received: by wibhj13 with SMTP id hj13so7339715wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2012 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=lo5xp7iqAyNBsCnHpY8AFPUJeSi8tZrTrw0H6nU5WJM=;
	b=uc8w5AgqMZpZ5kQj69Qz74fqMfGEZ+mTaH24lDGwoKMgmjVfQx42ojIA14n8nUUOIO
	Wgu6RRPa4KgGBXTmq6bFV/wiUx6mf2hxVGRQ8Z4RtnzVrCf77L+rPsla9FwkZN+gmcf3
	+SlTWHOyLYuVxCSO/UTqf4S2YXr9EN8bnt16s8DgTZeYwIlQU5O7GTrsRglSe0yYy94O
	oB1S8QWSVZESkx9mMa6PmFaXKXdi8ACu4ET06BYC5Q5IVjpttQmAc65qhlzJeuUWiihr
	dDLN7gFY8UIJv6Qj/kfUY0kuUmMP7r42gDe495ODCSQMTmIZpkXn/C4qe6akEdUfH3Qf
	WGow==
Received: by 10.216.144.149 with SMTP id n21mr5893484wej.42.1334568996697;
	Mon, 16 Apr 2012 02:36:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm18496045wix.8.2012.04.16.02.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Apr 2012 02:36:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Apr 2012 11:36:26 +0200
Message-Id: <62de43c3c2201f1dc73e7c4c9eb6aba0c131d1b4.1334568930.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1334568930.git.Martin.Jansa@gmail.com>
References: <cover.1334568930.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/3] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Mon, 16 Apr 2012 09:46:01 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 32f0b28..3d7e8d7 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "69500"
+EFL_SRCREV ?= "70165"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.5



