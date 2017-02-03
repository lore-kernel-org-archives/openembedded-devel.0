Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 25FE260767
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 03:25:06 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id v23so14711368qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 19:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r0eI0vaC7q1xkk1Ggo1IQgUBjtme7lFMZI2Qae7iSN4=;
	b=hzH6jGsA0Hye3trsy+5S5VUGxkKfi0JeXwjhLj0zMztaQGKosBytLHZyn6mgoUJ+3X
	HmTXooXF5VJcMZbkpyS1ILqC5xaJnIAP4OZ7/+TO9zJUa+6ksG6kEVrv5W82vyZKR1gU
	e2lFqlNLXSQ5Fkr0Rf8GnS1ski0ucu1odPorGSAt3DMaZ5w5YrjIRNHQpYBr8so6WJba
	SNwttUODuvdGszbIi1qkyeRpCRforHU3vEiRtYMBI9gEHv+dqSjGawUjPbRqW1ikfoL3
	f0lth2dXWZX4NcWDlz6eNeRzzbYf/bsAHV3our1jPInMmmxi7cQt9hYvDBdBShTvel34
	jswA==
X-Gm-Message-State: AMke39n9+BqYDuA3o7OGdY24KNrRsmTw35z2W2sjXEO/rPPFvtbBbqn0jhK8dex8316oBg==
X-Received: by 10.55.21.133 with SMTP id 5mr11472993qkv.71.1486092306528;
	Thu, 02 Feb 2017 19:25:06 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	q5sm23240806qtc.36.2017.02.02.19.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 Feb 2017 19:25:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2017 22:24:44 -0500
Message-Id: <1486092284-19210-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: remove executable bit on the recipe files
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
X-List-Received-Date: Fri, 03 Feb 2017 03:25:07 -0000

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


