Return-Path: <net147@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA3296E687
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2016 00:51:20 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id xm6so2464904pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2016 17:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xIqdDEiAZhMO7n5Vqi9yFVqQBq5TRCWsVSh1ABHZjOA=;
	b=G/plqvFXMp4S3P7Z23Ei0mJZ5xtsN0mEJ1Uo36OlkPFmWyMHsg0uejcAaz4iyiXFVd
	neFEeDnyMZpX5mRdCRIvXiejYHhd21XxZozMmvrOu88rA6RYS8No3ulAMTTiDHYOaw55
	S/tPeOUQbxhSzqPkyui8SzSXEREnDP4hv9sLQshN5jE+ZMxus50NT8saC/d9tawk4w4X
	0G14UWWqfY/qGf0Ae/l84EoKWKfz8Tsp/v0X1o9wMNwIwBkI752gaD4A8jh49R5aDdWt
	H7sVAVM/e4FfB4GT9ZdC03LWHHmNr7Nlh3LE5V5M+kYCMaeoKoOZVpoSzzZiyKoOgcvm
	/QTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xIqdDEiAZhMO7n5Vqi9yFVqQBq5TRCWsVSh1ABHZjOA=;
	b=HMdeOdFqCi2dZ9qU3uP/wa2+kjxEYnbw+XG6mCQvpp4YUpsQlTdA93VqS/KSQjmZFg
	E665nJ7HOILMN9rEjtPe5frYhkXgcPw2s6dN6d/22NQicXjJ5RWjRJc1Ys5/kSvZUVh2
	/KCOOsaFEaI6drOrng4edAyv5W+gZa/O3K3CRn3HYF0qhyEpwnrfUrh1gxoTVSG/d03G
	BPCVagGVzu5WoscPvC6DJ63uNuC9K/4v3HZMdnqpcBwHFzs+enngjuAAye5S/otsC9KQ
	qOdDspLu5lkEaRqtmsmz0VZgO6YoYkP6aOIHFGkrzW+QxYBvt3GkIMuZxWgxt5fGRY9T
	/Gvg==
X-Gm-Message-State: AOPr4FU1Ipap1qp2uRmGsUmp1ghb5qE87d7WrS0cWZ9YwvR+rx4lILhF3rSMVf57O3SC3Q==
X-Received: by 10.66.221.167 with SMTP id qf7mr41011402pac.94.1463359881136;
	Sun, 15 May 2016 17:51:21 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	g84sm42791497pfj.42.2016.05.15.17.51.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 May 2016 17:51:20 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2016 10:51:02 +1000
Message-Id: <1463359862-29212-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.8.0
Subject: [meta-qt5][PATCH] licenses: update technology preview license to match upstream
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
X-List-Received-Date: Mon, 16 May 2016 00:51:20 -0000

The license has extra blank lines at the end so these are removed to
match LICENSE.PREVIEW.COMMERCIAL from upstream.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 licenses/The-Qt-Company-TPLA-2.4 | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/licenses/The-Qt-Company-TPLA-2.4 b/licenses/The-Qt-Company-TPLA-2.4
index 0f96e73..1f59ab2 100644
--- a/licenses/The-Qt-Company-TPLA-2.4
+++ b/licenses/The-Qt-Company-TPLA-2.4
@@ -625,6 +625,3 @@ Licensed Software (including related documentation) is provided to U.S.
 Government End Users: (a) only as a commercial end item; and (b) only
 pursuant to this Agreement.
 
-
-
-
-- 
2.8.0


