Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <supernic2002@gmail.com>) id 1Shs37-0002q3-Jv
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 02:48:33 +0200
Received: by qcso7 with SMTP id o7so652600qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 17:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=LWuIM2jv/yre6n7uW0c4IIcABD2t9eDMqBcDrb8JQ3I=;
	b=mv32vWD/ROmh/iuRT2v4U7Y4bKiC7fzP8t7INSZR6dgzFhb/xVYOVks71uMRa4Q9OA
	ausMWM/Uk/LwOMAtuxAUemg0UF7Bpe4rVUNrIIXK3d8ufSQMjiYyehC10EfdMQY/e+sr
	HH/vCFNnoOPsZ5ivwaHScKsteErE78M/7nvZ4PkWpfv8wE1GM6+06mHSdQJ/1GgsRsk3
	kDT0mzW3WweBgpoXYLgMBAlUjyUKremCI4XrK5ouPffeZ2pRW57FEhHBxs/Zsq607I0s
	EhctTFRGZDwUFlRJ1EKxI7ToSZN2HutWchVhnp20lX/KY5xmOA4f9mYoD+vmuEG6hFnE
	jfhw==
Received: by 10.224.201.136 with SMTP id fa8mr3123079qab.20.1340325466564;
	Thu, 21 Jun 2012 17:37:46 -0700 (PDT)
Received: from localhost.localdomain (SEASNet-52-36.cis.upenn.edu.
	[158.130.52.40])
	by mx.google.com with ESMTPS id j12sm45933474qak.15.2012.06.21.17.37.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 17:37:45 -0700 (PDT)
From: Nicu Stiurca <supernic2002@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jun 2012 20:37:38 -0400
Message-Id: <1340325458-11332-1-git-send-email-supernic2002@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] * updating mirror
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
X-List-Received-Date: Fri, 22 Jun 2012 00:48:33 -0000

Signed-off-by: Nicu Stiurca <supernic2002@gmail.com>
---
 recipes/iproute2/iproute2_2.6.38.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/iproute2/iproute2_2.6.38.bb b/recipes/iproute2/iproute2_2.6.38.bb
index 6a72999..68cf425 100644
--- a/recipes/iproute2/iproute2_2.6.38.bb
+++ b/recipes/iproute2/iproute2_2.6.38.bb
@@ -2,7 +2,7 @@ require iproute2.inc
 
 PR = "${INC_PR}.0"
 
-SRC_URI = "http://developer.osdl.org/dev/iproute2/download/${P}.tar.bz2 \
+SRC_URI = "http://sources.buildroot.net/${P}.tar.bz2 \
 	   file://configure-cross.patch \
 	  "
 
-- 
1.7.0.4



