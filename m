Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSB-0007zx-1x
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:24 +0200
Received: by bkcik5 with SMTP id ik5so2247517bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=1P6wduA33nTJ+l/rx2FpHXvlcI8m6cagT8ajoijnZfE=;
	b=ED+M7fq/E+MR797ezz8CKgyYuG2ClvqWox5IGKGpvci6Yld4h0oTS+iFxHhQ/9T4Jy
	f7jwHSeRE2Vl7SzRaTpNmtIVBErJbovI74Jynehx5f0p7GfmDNOkzEsrUbyNPWaQ87cm
	EHLKa2CpOFgJOqP89zgvV34wsw4o3YmzCgoCscLh6cBN+YuFvkJHpN6df4n1XypaEw4P
	+kIxslPNvla/B6S69EsNewNCPQDYWMns6Z+XxCQAJ0IGPm58UckiA5E2MLL1FwPc5/UC
	3nomd1m7BFNK5mpDdLInFFIlPcEOQQxnKpYKnAatWyaCL5eQrg9+EQjG+qRTFyxxl61j
	HSUw==
Received: by 10.205.139.6 with SMTP id iu6mr172708bkc.20.1342168269158;
	Fri, 13 Jul 2012 01:31:09 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:09 +0200
Message-Id: <1342168240-7760-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,V2 01/32] systemd.bbclass: move to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 {meta-oe => meta-systemd}/classes/systemd.bbclass |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-systemd}/classes/systemd.bbclass (100%)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
similarity index 100%
rename from meta-oe/classes/systemd.bbclass
rename to meta-systemd/classes/systemd.bbclass
-- 
1.7.6.5



