Return-Path: <joe@deserted.net>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9412D745C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Oct 2018 16:00:16 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id 134-v6so4129627itz.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Oct 2018 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=NNa6pMkAiNmb+Ns379Pb7fGeUpJh3SMSbvUmd+hln4Y=;
	b=F4V0Y2IDtpEc2PurdobyGS139drgPHHEg9f2mxvI7Uy3AIRG7MIcvmb6cdi+9S22IC
	AdwgTR8+zqMEcUfI+g2mlqlMZp7vidgj8EzDhIA6Qu9KqfUQZU3TLHlW7hpX37m2YH6y
	kIKcMRAL9Q5GxcjLFyWYbw8bgm0eRPcSz152T4uKn+8L1nbm4XZvj6jmGQmuihwdeKjj
	UwTp1h/TGfp3JtuiEpI9dGR35F47gh8k9TP9ukgK12QmfgiMx+a8I9ipXOlTx3Z+iETn
	RGV2qtkaI68ZoIhPsElYx+UNu/M6T/JLGT+/TuZgcFQNo7XUUFgBVJ0EUTQEph1HMPO/
	BCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NNa6pMkAiNmb+Ns379Pb7fGeUpJh3SMSbvUmd+hln4Y=;
	b=lu8pct2vQ08hI3KR/iIbh7PdiFAAIwd6+wsHbLMS/icqq2KAXe8YUsRqiV4+xYO4Gb
	gJw0zSv5cKNpLau8L+6fDwyTpBy8PvS6K4rXGf6xgHPjUm0eX5016lmZLbt99SdS7C1s
	KxoS4eQciRVPSvirDu1sKDDN9mnjG2x/c/keu6C5jAcVo9DPrtH3J8x3A1Ftl6c7YhHR
	CuQCn2JgOwzDrVdaZbvQxYR4lGWuaJQkQMBi7Hoti45jX5xaeJkgabvWKw98EwX6cnYZ
	PcEUqBnsCvriE8t7tJG2Dz0gvIgREH1Xr2dZrXFIloMyvMGObSHfDiIUFB2NZ3zFoQat
	CV9A==
X-Gm-Message-State: ABuFfoiLgNBYItjKg8ynm/NACzVFyO2Hkx2mDbJNGB/3lR9XMlQzjCEM
	G4g7YDWOUPi8pHbJ70LXcLB6L+uK6afjzw==
X-Google-Smtp-Source: ACcGV62YI7vKkYX5bv3wAo1KMT7gZa70N83TdAJVeE2rROcdguCeA/YjvmNV/Q4kcPTtjjGutwnFTg==
X-Received: by 2002:a02:5f5a:: with SMTP id
	r87-v6mr12072929jab.22.1538496016962; 
	Tue, 02 Oct 2018 09:00:16 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	l142-v6sm4777431itl.23.2018.10.02.09.00.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Oct 2018 09:00:16 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Oct 2018 12:00:14 -0400
Message-Id: <1538496014-1888-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] update maintainers
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
X-List-Received-Date: Tue, 02 Oct 2018 16:00:16 -0000

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/MAINTAINERS | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index bbb2d1b..5c4c4ce 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -26,7 +26,11 @@ Please keep this list in alphabetical order.
 Maintainers List (try to look for most precise areas first)
 
 COMMON
-M:      Joe MacDonald <joe_macdonald@mentor.com>
+M:      Khem Raj <raj.khem@gmail.com>
+M:      "Joe MacDonald (backup)" <joe@deserted.net>
+L:      openembedded-devel@lists.openembedded.org
+Q:      https://patchwork.openembedded.org/project/oe/
+S:      Maintained
 F:      conf
 F:      recipes-*
 
-- 
2.7.4


