Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rt4sg-0007x1-Hz
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 23:11:50 +0100
Received: by eekd41 with SMTP id d41so792967eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2012 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=p1/OOTRG9kx9QhJuTcy7RVQpvdnuRKuyvR4XC6XbJjc=;
	b=FhupYssAKlFuj+262knuYpRDjf5nle/E0+qtHTyWcR8g+yxFrrsr0BjQfl4fdXSGy9
	gNLTrQ3Ij+WB86gV+659cT9YXvgNlddaPX3N4O0tuS248uswM1vyB5It+I92QY1NYQuC
	umWOEcbnm0Gtb3HTm8/b1LdygIexSLK/Jc2Sc=
Received: by 10.14.18.141 with SMTP id l13mr1442668eel.103.1328220232700;
	Thu, 02 Feb 2012 14:03:52 -0800 (PST)
Received: from localhost.localdomain (p5B0A3966.dip.t-dialin.net.
	[91.10.57.102])
	by mx.google.com with ESMTPS id x4sm14036800eeb.4.2012.02.02.14.03.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 14:03:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2012 23:06:01 +0100
Message-Id: <1328220361-5612-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe] atk_2.2.0.bbappend: remove since oe-core now supports native build
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
X-List-Received-Date: Thu, 02 Feb 2012 22:11:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/atk/atk_2.2.0.bbappend |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)
 delete mode 100644 meta-oe/recipes-support/atk/atk_2.2.0.bbappend

diff --git a/meta-oe/recipes-support/atk/atk_2.2.0.bbappend b/meta-oe/recipes-support/atk/atk_2.2.0.bbappend
deleted file mode 100644
index d9172b4..0000000
--- a/meta-oe/recipes-support/atk/atk_2.2.0.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-BBCLASSEXTEND = "native"
-
-- 
1.7.4.4



