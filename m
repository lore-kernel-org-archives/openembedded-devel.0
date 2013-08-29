Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id C1A186B099
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 10:09:55 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so127592eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SXUhVGtOAPj1kLam99W1IlMO4bvVjBdGCt4P5lJQ1I0=;
	b=PbE9HSxAhGhVIOcKrFsCv+XilYZ4+nGki4MArKZNwqF5XhMoQ3s3FJmWxgJWMBmHaV
	gJ+3GNV/aNygqjBviZDHLm75Ctmqt4Uqwo7ctDfSs9W5rcblDMbEHUfd9ks6u3ylz8q+
	KLf5oj5KLzr+Xr9lqQp6GUtklaYeyYLzHFPhSsFjxdzrKg2xAoZdL7fb4dWQj0DDzhWE
	Db+8Azc0fUVWU9JJn4QUnrxqSNF4WhvfS23KWQlCwMk60bhijKHUelyq6TRXktMRGxsv
	xCitUJ7J0binunjS+2AUAuGCS57iA4yfmYd9hIAVcWKSSbXo4cCMdTz+rcmVf6jLcBLE
	rM2Q==
X-Received: by 10.15.63.142 with SMTP id m14mr929203eex.106.1377770995922;
	Thu, 29 Aug 2013 03:09:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm44716835eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 03:09:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 12:11:06 +0200
Message-Id: <1377771066-24270-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-systemd][PATCH] systemd: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Thu, 29 Aug 2013 10:09:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/{systemd_204.bbappend => systemd_206.bbappend}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-core/systemd/{systemd_204.bbappend => systemd_206.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-core/systemd/systemd_204.bbappend b/meta-systemd/oe-core/recipes-core/systemd/systemd_206.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-core/systemd/systemd_204.bbappend
rename to meta-systemd/oe-core/recipes-core/systemd/systemd_206.bbappend
-- 
1.8.3.2


