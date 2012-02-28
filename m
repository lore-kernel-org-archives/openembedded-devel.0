Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nyy-0001cG-Cp
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:48 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:16:23 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.14.80 as permitted sender) client-ip=10.213.14.80; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.14.80 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.14.80])
	by 10.213.14.80 with SMTP id f16mr5679983eba.135.1330438583347
	(num_hops = 1); Tue, 28 Feb 2012 06:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=k0y4TnJk6SnmUvfUGyf10Z7utWuSEGpkZB8DQRe/U3g=;
	b=binM5YQBSGlOyjTIzq5LixttziTCw+dCSdwlLcRZ15nF7x/ScHAnHak+FDxVhjYHLR
	CT/M3mJL80XE+dA1nuUqI3Lt0I7OCKmfKoiB3k31M344xKzKhBFFwYp4MvhRvMpgaMk1
	W6H6Lh3rwAuBEDuLIulV4U3yPG6mZ1IAdiJ/w=
Received: by 10.213.14.80 with SMTP id f16mr4242807eba.135.1330438583274;
	Tue, 28 Feb 2012 06:16:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm24021354eef.9.2012.02.28.06.16.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:16:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:44 +0100
Message-Id: <5f9b2212a0aa455e58facbb15e1745d0d065c4e2.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 13/14] tiff: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{tiff_3.9.5.bbappend => tiff_4.0.1.bbappend}   |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-multimedia/libtiff/{tiff_3.9.5.bbappend => tiff_4.0.1.bbappend} (100%)

diff --git a/meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend b/meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
similarity index 100%
rename from meta-oe/recipes-multimedia/libtiff/tiff_3.9.5.bbappend
rename to meta-oe/recipes-multimedia/libtiff/tiff_4.0.1.bbappend
-- 
1.7.8.5



