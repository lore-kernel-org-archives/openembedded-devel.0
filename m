Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1780601B8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jul 2016 11:56:18 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id q11so250047qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2016 04:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bSxikzE24+/t4m5FPqdLoV0dOYSHmd2tW3AjO6FgsLQ=;
	b=BskUc3DtSqRN2jAoSXrJM4KnpvTRrHPk96dqqhgtVIx5UbHOG58WkQEAMJtk6QfVDy
	DDtWrTRCuNkB3TzWAfN1ta62FqovK6B+kG+32tgPWx7w5Q34dWXd6SyY5qi81kh7SUTm
	rFhnZiSeX3aUfGKu84hx4+bbMywrHwFFjN+GeoV7OOOKHCeFJso1bp7/TPV5vgfLjnpr
	n6C60+fwh9vjitL0PxAPlZz3wXZl7YgZCsBvHkGJK7INiyJPrTiJay++eicKoVgwPiIQ
	81Br58kv/plYwxLkwaGc14rB084jwox9tYdTcG5NhHiC9N8b1qqIMmaecsIAEDgBYTrC
	TzEw==
X-Gm-Message-State: ALyK8tJdBDix9nDBanACxf0taB5FwO4q4c93R0sdeFCbvGOy0bI1Er4u4yIM7u/UgAuRyw==
X-Received: by 10.237.39.37 with SMTP id n34mr14629327qtd.47.1468065379033;
	Sat, 09 Jul 2016 04:56:19 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id e187sm6157qkf.35.2016.07.09.04.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jul 2016 04:56:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jul 2016 07:55:58 -0400
Message-Id: <1468065358-32604-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] Add Derek Straka as a maintainer for the meta-python layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jul 2016 11:56:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/README | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/README b/meta-python/README
index f62ab8f..905d5ee 100644
--- a/meta-python/README
+++ b/meta-python/README
@@ -50,4 +50,5 @@ Maintenance
 Maintainers:
         Tim "moto-timo" Orling <TicoTimo@gmail.com>
         Paul "bluelightning" Eggleton <paul.eggleton@linux.intel.com>
+        Derek Straka <derek@asterius.io>
 
-- 
1.9.1


