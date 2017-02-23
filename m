Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id EF8F872FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:13:00 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s186so18575673qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r0eI0vaC7q1xkk1Ggo1IQgUBjtme7lFMZI2Qae7iSN4=;
	b=T3zasjAOmM8sk6qAxLdoapLyIxlalECIjiQ/jkKf8hAWKLuHP/vNeDqqrTw1irfPa+
	7tlkzNDo8Kg+ExkXyPPvXFL107NZn9uiqWf+KhTljp35C74jq4y8sWDDaPyS0qSp2XLS
	c6UVjZVzdJgi+qxkYlu/bNpVDnnZ9Ri6jOxVv5s5dHUjpifSnOJpZGEE1izvX57LLgrI
	4LZEGSAekCeQ4gwdgUb8igsrNMrvrISZCjFQcGGStSUhD1Q8yVJqBi9bl4SRPq2WlUbN
	EmsMbh2v3gVzlbgPo+jSI+72xeyhWiwqycwofTMSrEe0+fxdQQu3JsaZRtmwJ3Lhp99J
	C7KQ==
X-Gm-Message-State: AMke39ncXmrpiwcuouBT8+tCt+QxIBzqqfsrVVOg0c9nZL5ctvtptiw/+JhTsCX270Sing==
X-Received: by 10.55.80.135 with SMTP id e129mr4850943qkb.192.1487808781494;
	Wed, 22 Feb 2017 16:13:01 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id g15sm312400qte.58.2017.02.22.16.13.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:13:00 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:12:53 -0500
Message-Id: <1487808773-25824-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-pytz: drop execute bit on recipes
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
X-List-Received-Date: Thu, 23 Feb 2017 00:13:01 -0000

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


