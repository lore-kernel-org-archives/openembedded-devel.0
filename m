Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJQ-0005hJ-Hu
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:44 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so972116wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1KejlWNTGlY56b59avnyOefr5KxuwW6zeHWavkSx8Xk=;
	b=M9lhzBRb8aYKzxntu6PswcMuKiNxdjPzCAJ1JOM5tiuaDVzQTp5abVoBgFUvI5nAKq
	LKi5dxcG3ZLwAbPUkw/OfssYujIXedsb4M+dmue8DtnVNx9c3WYsX/sxZK1c378Pu+Qf
	z/3Oul9wOKgRCFhw07glrXlZR5U7pLHUQHOPrtPzmnB0LDrGyIG3PmT5xcnqYc2nmVDv
	mICxtd1R7LNRmj+yeUU9z0SuU/kruxd6GVDYnVg+u1bV/Uu2FZ1FdmqfJZk6KZVZTTgg
	pp/fLe5JT0f5nxur5H11BEGTz7Q4yOI7peZ/SVRZB62WhvzarrJg1k4vLgy6xOHncw0O
	JMHg==
Received: by 10.180.100.2 with SMTP id eu2mr9473672wib.1.1335444669882;
	Thu, 26 Apr 2012 05:51:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm44615704wia.11.2012.04.26.05.51.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:11 +0200
Message-Id: <0b8274e661c9dbdf3ad691af800e68aa8ba28f0e.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 06/15] e-base: bump EFL_SRCREV for 1.2
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:44 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 3d7e8d7..27dd2eb 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "70165"
+EFL_SRCREV ?= "70490"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.5



