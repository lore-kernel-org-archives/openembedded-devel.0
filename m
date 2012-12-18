Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tl0fz-00071p-Nb
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 18:09:55 +0100
Received: by mail-ea0-f172.google.com with SMTP id a1so366444eaa.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=xzLQc0pU86euI2G6WDraI7/SQogSV3QGpSfaxl0Ua8w=;
	b=QZEZxplW646jJHAp2Ch/w0pfepdOrx9FP2vsL+1JXTtENIu7rnQ8pRmHDU3VDmj5WP
	VuBXBuivhCyy7YfKr1KhSCmDdSkaW9O/SxBRtwB9TlYgl/8Jp/bV1iRxQoauAB45/BYL
	UyR8PPKxxmplrb4XuilVHRU1hdqlG2YW9Jp32JMxc82dVAYfyBZ/hAzTK38ca9N7NTU6
	W2WTpnKjEZ6AIgTtQoPx7aYLnzgFwTYIqgn5gxK8FaabHsB/yiGGsNuclWcCTN4nt4Fm
	G0ssLLwp5fLSEGzX1zDQ+fZMROE46qCaLWnICDpWvVQHruU34BbUIhTzll2dQ9rHc9yl
	dElg==
X-Received: by 10.14.209.193 with SMTP id s41mr7251144eeo.9.1355849713919;
	Tue, 18 Dec 2012 08:55:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm4210084eem.14.2012.12.18.08.55.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:55:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 17:55:01 +0100
Message-Id: <efdf1cb3bb715574ed9d55920b2ab52be34cd130.1355849280.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355849280.git.Martin.Jansa@gmail.com>
References: <cover.1355849280.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/10] florence: move to meta-gnome due to libnotify
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 17:09:55 -0000

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/florence/files/0001-Fix-glib-includes.patch           | 0
 {meta-oe => meta-gnome}/recipes-support/florence/florence_0.5.1.bb        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-gnome}/recipes-support/florence/files/0001-Fix-glib-includes.patch (100%)
 rename {meta-oe => meta-gnome}/recipes-support/florence/florence_0.5.1.bb (100%)

diff --git a/meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
similarity index 100%
rename from meta-oe/recipes-support/florence/files/0001-Fix-glib-includes.patch
rename to meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.5.1.bb
similarity index 100%
rename from meta-oe/recipes-support/florence/florence_0.5.1.bb
rename to meta-gnome/recipes-support/florence/florence_0.5.1.bb
-- 
1.8.0.2



