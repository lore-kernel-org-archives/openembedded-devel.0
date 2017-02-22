Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id CAB3D72FE3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 06:02:35 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id k15so1118494qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r0eI0vaC7q1xkk1Ggo1IQgUBjtme7lFMZI2Qae7iSN4=;
	b=phHVym++E/Bl+xQJFiFYTBVEwRRmiFD2vKxXMZM5FKPWwTNEkp6/efVOrYmaFQZb5F
	M3L2c6agGiTwuJfYgUEKCA7Luj8gIQ1ZxV6XCvcvc7C+U5qd2zucG3YB9hQyw7upvnX2
	nKymOJnqHW29+ppbDsfHQc7IfFYvjrkp+6vgzqLHbsxfW86Pf0XRhjrL6JTZWD7Z57nv
	YQ8rXBH9RP95mFTJwJ5q1qj1aSntmJpw5jb8QMYvTqerdv7j4OQnzu6YAlFKrBs1NrAP
	ywzRiSmZE38AW2jOPx1lPBAD9iL9rv3/2zK5ylpeY+S1Goqpax2b1sW6c6YGgZidhA0p
	UGcw==
X-Gm-Message-State: AMke39ncVWjtAkfrK0cDJXJYYyTxpYXoLXsLBZaH8UCDSvNEF3wMD+z3J5lqXDFYycoZ7A==
X-Received: by 10.200.38.196 with SMTP id 4mr27074672qtp.96.1487743356866;
	Tue, 21 Feb 2017 22:02:36 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id t67sm128706qkd.41.2017.02.21.22.02.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 22:02:36 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 01:02:16 -0500
Message-Id: <1487743336-20585-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: drop execute bit on recipes
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
X-List-Received-Date: Wed, 22 Feb 2017 06:02:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz_2016.10.bb  | 0
 meta-python/recipes-devtools/python/python3-pytz_2016.10.bb | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta-python/recipes-devtools/python/python-pytz_2016.10.bb
 mode change 100755 => 100644 meta-python/recipes-devtools/python/python3-pytz_2016.10.bb

diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.10.bb b/meta-python/recipes-devtools/python/python-pytz_2016.10.bb
old mode 100755
new mode 100644
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2016.10.bb b/meta-python/recipes-devtools/python/python3-pytz_2016.10.bb
old mode 100755
new mode 100644
-- 
2.7.4


