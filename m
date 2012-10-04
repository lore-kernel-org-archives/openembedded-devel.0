Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrT-0006pJ-MP
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:35 +0200
Received: by mail-gg0-f175.google.com with SMTP id v1so13582ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HHl6XrsplTBM7QxgueE7fEe5F7SzGVci0CYp0uNDdBA=;
	b=muGaHdrLxJyCX7uuqiATf5JbMYQRtkcTn9aEsieabz/X0JiNgJkOxOhRoJBQHcOAtQ
	DcpinCM16jLkWkyIgOD930LXgKgICFQGAc6+jWXk0gIf5c7QH+EbdLzwFIIC9eilzauF
	3NwH/tuwdarkHmtLNPfFLscfDKOSOY3oVi/mFlN0KjkmDzsP3PZqsaKwBnmnD56MVVEX
	+F0uSqdsMv9Q4SfKq2xP2d0A61E7qAbNtqNsYgwqYbriHLVxqekUMR+aePKOyXrNV5oX
	7iZi/RT/4SjJDocyrTJ8ay1UKvlXnYKSAaEbfwtMQHSSQszb4OPTfSNIziAjs00o9QUM
	7yKg==
Received: by 10.236.78.106 with SMTP id f70mr3991086yhe.51.1349323417376;
	Wed, 03 Oct 2012 21:03:37 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:09 -0300
Message-Id: <1349323389-16520-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 9/9] opencv: bump PR due libav update
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:35 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 9cd4541..6d0121c 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "svn://code.opencv.org/svn/opencv/branches/2.4;module=opencv;protocol=
 SRCREV = "8988"
 
 PV = "2.4.2"
+PR = "r1"
 
 S = "${WORKDIR}/opencv"
 
-- 
1.7.2.5



