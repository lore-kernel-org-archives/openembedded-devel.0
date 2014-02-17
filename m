Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0FF6E7BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:36:52 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id d10so7345193eaj.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 08:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U9nM570MmTZscq529FF0VfrVdWDxzfjNAbrvyUp2RQ8=;
	b=lIW5gpTbeItGt7yR4p5h8BmsVUnargTErnmKndpY7f9BvfrB8EF1NrnAmTXQwgH1Kg
	7j+ysd37hs5L8C1bFhm2OLAPHJakh1acqdXjucMT4LFhI/7PU12bKs0whlVwrmpOug9A
	BIzYrNoqwA12G4uVRq3UhGbSEv/JZzlhBRH3wH0rgx4tl9bX2PxcfEYRiYCdltL1aycF
	AgI9y3Pt08D9XTl5hwuoaY5NtGMBDDli798YLsMYmxwUoroDmhzdGKP+Hspf6RImq7QD
	bwQJ213ttcyIDh1aJdloo70DT2XaTjRO4YXPmaNGBA8RioUNhmdkJXIt6nAREAXWlhXd
	OLmQ==
X-Received: by 10.15.52.66 with SMTP id o42mr2843605eew.89.1392655012548;
	Mon, 17 Feb 2014 08:36:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm59161873eeg.5.2014.02.17.08.36.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 08:36:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 17:37:19 +0100
Message-Id: <1392655039-10538-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-browser][PATCH] nspr: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 17 Feb 2014 16:36:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-support/nspr/{nspr_4.10.2.bbappend => nspr_4.10.3.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-support/nspr/{nspr_4.10.2.bbappend => nspr_4.10.3.bbappend} (100%)

diff --git a/recipes-support/nspr/nspr_4.10.2.bbappend b/recipes-support/nspr/nspr_4.10.3.bbappend
similarity index 100%
rename from recipes-support/nspr/nspr_4.10.2.bbappend
rename to recipes-support/nspr/nspr_4.10.3.bbappend
-- 
1.8.5.3


