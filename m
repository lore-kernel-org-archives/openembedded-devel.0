Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REgr0-00080s-EH
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 14:27:10 +0200
Received: by bkat8 with SMTP id t8so1904372bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kpQUghmNhQ8wrneEQ430VsRRMdL/MvYgZltdzm8Lfws=;
	b=AYiMowbYrLwInF3bOKkExbpDtxumUjUx0va9+hT0Hlm32IrhGXDWAJBx/oeEizNsgp
	tqBhYFEKIwpMVahsVTk3T6YkRIi5Cltqg5CuFTqltvYOmYqiQvXZpeY7u24FcakrrdiS
	5kqYnu5j9YJvHE9PJLyNq7kseKjKJA2ZPb6/I=
Received: by 10.204.129.193 with SMTP id p1mr6659660bks.19.1318594884355;
	Fri, 14 Oct 2011 05:21:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d17sm8242545bkq.11.2011.10.14.05.21.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 05:21:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2011 14:21:00 +0200
Message-Id: <1318594861-29087-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 1/2] tiff: rename .bbappend to apply to new 3.9.5 version
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
X-List-Received-Date: Fri, 14 Oct 2011 12:27:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/libtiff/tiff_3.8.2.bbappend |    1 -
 .../recipes-multimedia/libtiff/tiff_3.9.5.bbappend |    1 +
 2 files changed, 1 insertions(+), 1 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
 create mode 100644 meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend

diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
deleted file mode 100644
index d3267ac..0000000
--- a/meta-oe/recipes-multimedia/libtiff/tiff_3.8.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend
new file mode 100644
index 0000000..d3267ac
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend
@@ -0,0 +1 @@
+BBCLASSEXTEND = "native"
-- 
1.7.7



