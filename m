Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF3676A4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 15:15:29 +0000 (UTC)
Received: by lbcbn3 with SMTP id bn3so5412592lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cvpgZZzkW9tcC0O3iCq/nl/5fqJZD9r6XM0LxeQMcyQ=;
	b=KsquC+/6Ofv9J96y7t1ebNpMbglIcu10+MOT7Hw9YqnftNsrVzs+NT/omHm+xj70uj
	dB6F6qNJh/Th16Mu5w3K19gl+/Wz0KHuAw6icj1km9JFkD0+ZDfv+M236enJs+oX4EtE
	mKYt2VVf0uKaYvAANFZFUniMJDa+cC5prYJ2UHBxfnEE2KyBfV+MdK9CTirqjZY9ndVU
	DkuHc8ITS6+QZRJ+swQT5yu7Fyxm2oprXT5FIaElVQZaPuOGezjlhnPXnrLyGa0IQc4n
	aIwTbO5VTCpEL10vzDxzHhAaStiJDYWJvLxDiXB6LqKSqLEz76MlnPgNCi91SQIOl9TG
	t23Q==
X-Received: by 10.112.130.97 with SMTP id od1mr11419919lbb.37.1439997328520;
	Wed, 19 Aug 2015 08:15:28 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id le5sm294049lab.29.2015.08.19.08.15.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Aug 2015 08:15:27 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 17:15:25 +0200
Message-Id: <1439997325-4480-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] opencv_2.4: Update HOMEPAGE
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
X-List-Received-Date: Wed, 19 Aug 2015 15:15:30 -0000

Old link is dead

ricardo@neopili:~$ wget http://opencv.willowgarage.com/wiki/
--2015-08-19 17:12:44--  http://opencv.willowgarage.com/wiki/
Resolving opencv.willowgarage.com (opencv.willowgarage.com)...
70.35.54.199
Connecting to opencv.willowgarage.com
(opencv.willowgarage.com)|70.35.54.199|:80... failed: Connection timed
out.
Retrying.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 570de3109a74..733fe44cc53c 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
+HOMEPAGE = "http://opencv.org/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-- 
2.5.0


