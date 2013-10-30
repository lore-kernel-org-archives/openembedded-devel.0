Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7B18C6D3B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 17:03:48 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c1so799657eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 10:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G8ATKiBjp1EbGkevZcbKukS9atiWtBQTYz+m8R4DfZ0=;
	b=jJ+a8h71UZ/ED6URZkXbwQl4apJPeuGCR5dIOgpgMv0DSXPBP/bJ+LpRGNbNU2nL2r
	5kGPw2JfXw25WWPneCTAd6E/vtY0/Se3C0k7LsrGbmFwXeBD7uRJE81GqHHR6kOBX6rG
	S3BfMtssVnTD1c6qV8w6RK6IeC4T4moIZpqwei4gq7pqHTbjxcb0hgml/2JgIs1jMaRH
	nPcgHdYE9fmm0NTZvzKS79wBAxigku+M3HlRWU0GwzOfixPdrJVSpMwssdahxHCQCAL5
	1UnSodMvLTdmO3nExNw9LzvIyIuLI/Mf/n3R7KGR5WKOmEdsO4EsiH7sFwLO02XojwdL
	lDQw==
X-Received: by 10.14.4.1 with SMTP id 1mr6046159eei.21.1383152629969;
	Wed, 30 Oct 2013 10:03:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm85685820eeg.13.2013.10.30.10.03.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Oct 2013 10:03:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 18:03:45 +0100
Message-Id: <1383152625-1337-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1383152625-1337-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383152625-1337-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 2/2] connman: Rename bbappend to match new version from oe-core
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
X-List-Received-Date: Wed, 30 Oct 2013 17:03:49 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/{connman_1.18.bbappend => connman_1.19.bbappend}              | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.18.bbappend => connman_1.19.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.18.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.19.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.18.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_1.19.bbappend
-- 
1.8.4.2


