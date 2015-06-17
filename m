Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6A273E3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:15:39 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so68762150wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7tSGHoWfHbfXVqfSXx6QB0JkK2E8sSspyFZJRXmLZag=;
	b=ZksVH/Br5v3NfUf+mfOd8nBX9L/PzTYcj1YFgEj9L42T3Q62YmZnpYXfspedj1gZHM
	K35K6IqJM8BBmQrI8AVTZhouDnLZB5X/BhSvzjod/UYvrCfHdM2bkQXG+1TBV6Kpk7W7
	Cqg7wnBhnc+VJOsFOOCjdWnLR5+9/WJ2bqMfhBCuSA1EYRlVrNq+bDmI6FpoQZ0Z9L9D
	DUwv/3Kocz4O8vQqU2MLSk8WOsbsdkeh+a3ENAFwQwmvA8GOakag4t94YbGD0wQgynPg
	oK9kcsxgSurjJaTvZLz9ZXwcJAfHTDX62B5o++ol+9hYjf82zd5SF2uDfaWmQ57DhNZ5
	xieQ==
X-Received: by 10.194.77.179 with SMTP id t19mr9605939wjw.30.1434579340278;
	Wed, 17 Jun 2015 15:15:40 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it ([95.236.248.246])
	by mx.google.com with ESMTPSA id hv8sm9004567wjb.33.2015.06.17.15.15.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Jun 2015 15:15:39 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2015 00:15:35 +0200
Message-Id: <1434579335-3994-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] utash_1.9.7: move recipe to its respective directory
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
X-List-Received-Date: Wed, 17 Jun 2015 22:15:41 -0000

The recipe was originally placed under /recipes-support by
commit: 9b05b3eb6d036eb661911e5e660447468fe4bc9d

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-support/{ => uthash}/uthash_1.9.7.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-support/{ => uthash}/uthash_1.9.7.bb (100%)

diff --git a/meta-oe/recipes-support/uthash_1.9.7.bb b/meta-oe/recipes-support/uthash/uthash_1.9.7.bb
similarity index 100%
rename from meta-oe/recipes-support/uthash_1.9.7.bb
rename to meta-oe/recipes-support/uthash/uthash_1.9.7.bb
-- 
1.9.1


