Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E56065C78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 11:21:22 +0000 (UTC)
Received: by wgme6 with SMTP id e6so25523152wgm.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=tkwGthLUHPhXi+m8oISyoyVAN8lmyMKsIkpaL1FALq8=;
	b=qdCdRAMW8JI2NIXT3cCeHP0kqcLDoCVVG/wRuXazCufSn54/LDDGinLU1jq6KrPhwX
	yaTVeSvq2tkKifLh8tf+0QXtxCADWFUpV3iCYhxnx2TTh6ZQgFhyAoTWIIgWALNHjLRh
	hMZTdObgTnZW8Hbh8FsphQX2CBt6X2SGInbcpfAiTQfhegu2gB4cZUgMpA/2Exm8HTuQ
	Pvk1ZrW3hGiJLUMlOLwx+6I6Elk43/OEXpUZWhqNIITU05gaSaWYicIOSNrXOPrAQft1
	G+EWJlEV48LIibn2hlOp0NMx3QZayz2IVEEA8NiFO1+rgJ13Q1I7O7HKRes2zkKmztIe
	+dDQ==
X-Received: by 10.180.72.198 with SMTP id f6mr39047698wiv.21.1432639283087;
	Tue, 26 May 2015 04:21:23 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id 16sm21245212wjs.41.2015.05.26.04.21.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 May 2015 04:21:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 May 2015 13:20:50 +0200
Message-Id: <1432639251-12249-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] poppler follow up
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
X-List-Received-Date: Tue, 26 May 2015 11:21:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

was pushed ontop of

https://github.com/schnitzeltony/meta-openembedded.git patches

@Johannes: feedback welcome

Andreas Müller (1):
  poppler: fix configure by pointing on moc

 ...dd-manadatory-options-to-find-qt4-qt5-moc.patch | 91 ++++++++++++++++++++++
 meta-oe/recipes-support/poppler/poppler_0.33.0.bb  |  3 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch

-- 
1.9.3


