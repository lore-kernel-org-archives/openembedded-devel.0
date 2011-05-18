Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMouZ-0003Pr-9a
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 00:08:11 +0200
Received: by fxm19 with SMTP id 19so1851802fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=BCI67uU+l6Ehc4QZz9xqyHRVKOGuEw0a9QKJdPYutIY=;
	b=blwSbMLxhLFKn3DOzEHFz8FDBrB/O0lMdzlyZ3h0zwCRhfhI3YBLMWKWLAqxfMHOsk
	qZowFUnxV8vEKyAOwahRbB6AA8jPkKvKcaD5jFYZL8NTvexnFtXNfa1VnmfBzCSbelrB
	Nu0L43VA6so+9iB3bzs4hTrGjExpXF3Tx/o24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=YmLiWefihKO3O3fgwvETbT35E/BcwYazAGLcFHc67lFiowyr+s+wPJJjgcG0S3grd3
	+qBVWN6HN8UNxlU9crs6TA81VnYkgBUcmrum43LoqgWfWe1xR+OxXRLPvCJxMSuBYAJ2
	XBPB6FTMFxaeOwF/Y+ajpTjsRRnPFc67ydeOI=
Received: by 10.223.13.10 with SMTP id z10mr113672faz.69.1305756316573;
	Wed, 18 May 2011 15:05:16 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 5sm1690618faz.2.2011.05.18.15.05.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 15:05:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 00:05:14 +0200
Message-Id: <cover.1305756266.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-oe][PATCH 0/2] Pull request #9
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
X-List-Received-Date: Wed, 18 May 2011 22:08:11 -0000

Please merge following 2 patches

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-oe
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (2):
  glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
  glib-2.0: append libffi and python-argparse to
    DEPENDS_virtclass-native, drop gdbus-serialization test

 meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb |    4 +++-
 meta-oe/recipes-core/glib-2.0/glib.inc        |    4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.5.rc3



