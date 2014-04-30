Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3670D65D14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 17:48:59 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id hq16so2585712vcb.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 10:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XT3OcIDlbVuNe2zgCwJPri5Z42FQU8f5b1eojNjCCy0=;
	b=cm/8EsU+T4Ebmb4F2bjL5dS05c0jgYbZohTl81TTIn94amoqxhNwjccv8jhTSGSq7J
	EVao9qNDSvu0UVO2aP3fVWoNwAlBRE10aZED0MB/fnmVS4Iw9S3kMwkU0IQGcb2ih2KM
	cJx54Kgl+A6kFqYuSO/ylDRCn5XKhbumLXb+mB9zogq1fGLM85yHV4W2j5+fu3MNB63W
	znTTXvrqs3irQBD8RaRZLTRHOZXrHG9abB9bNSaeutNUqMjylj1/PMe9wTpA/7kYh6/q
	LX41Wj6Kj3coiB2phqRDrhELGthXn2tKEJ6Aags2E2D7Efr5gJsavzp7XKvlMfiiPlJF
	nvbA==
X-Received: by 10.58.220.161 with SMTP id px1mr4856967vec.13.1398880140612;
	Wed, 30 Apr 2014 10:49:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 6sm51582287vdy.1.2014.04.30.10.48.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 10:49:00 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 19:49:01 +0200
Message-Id: <1398880141-555-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1398876295-19178-1-git-send-email-Martin.Jansa@gmail.com>
References: <1398876295-19178-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCHv2] lighttpd: rename .bbappend to match with any version
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
X-List-Received-Date: Wed, 30 Apr 2014 17:49:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.33.bbappend => lighttpd_%.bbappend}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.33.bbappend => lighttpd_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.33.bbappend
rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_%.bbappend
-- 
1.9.1


