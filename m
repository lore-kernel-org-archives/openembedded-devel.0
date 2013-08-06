Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id B4F546B53B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2013 20:22:31 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so434931eak.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2013 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hQbWNlO7k+r051lDn+0arHTH1jVD1mx6TflKeGPj+FQ=;
	b=rxon3rmuuFLZX7zDdsbR991VQcvildWCGaHUABuTtgYVb/jhFIAr8tGGmfND0oZO71
	D/wH9UJMoSED/9iXB8al20IwdlFLHFvOoTustY/aOawhp32JL9yhzas7NT5tA3NcaWWg
	r3Li7kVfQmNqg54Ei4RiTQ8KJXIMZWwptRnTXev+GNC3v1AR8lLswTKctCzqe973hbLB
	HjMprPQi7L94UQSoKQfRWf5kNuvMoPIkHs5X4Jm1ZjT3VSi8Garz5E10I54fhXKvP2OZ
	rQF7qV7kOdEIVki/xmIy3tdPgvk0nuO5+xilBvIZ/T1OXt4jLfcWjvBkzSMYXTC3KxBq
	6W6g==
X-Received: by 10.14.110.194 with SMTP id u42mr2657064eeg.112.1375820551375;
	Tue, 06 Aug 2013 13:22:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id p5sm4520311eeg.5.2013.08.06.13.22.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 13:22:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Aug 2013 22:23:12 +0200
Message-Id: <1375820592-32196-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-systemd][PATCH] util-linux: rename .bbappend to match new oe-core version
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
X-List-Received-Date: Tue, 06 Aug 2013 20:22:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../util-linux/{util-linux_2.23.1.bbappend => util-linux_2.23.2.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/util-linux/{util-linux_2.23.1.bbappend => util-linux_2.23.2.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.1.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.1.bbappend
rename to meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.23.2.bbappend
-- 
1.8.3.2


