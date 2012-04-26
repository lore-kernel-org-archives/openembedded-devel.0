Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJj-00064B-3I
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:01:03 +0200
Received: by wibhm17 with SMTP id hm17so5194299wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4wR0Kjsc//Jp4OrGhJ9uEtz2SnRvvMO8lW1Yh/4Zte8=;
	b=nEWmTLSx8oLTOE77GNBkZ2Q2uHdYsBPre0Dh1KJDuYK6iSaZIrZhFqe0N42MLfIn3U
	YHA/XpYPGLbwMrku8D4DajFPMgivJyT4iOUjGDt1aZCtZRup1bwOl2dSWnM9yG+wwQY7
	lhldv/1o5qFBMJCXy93dpMu4DzmAYqbCOLkODsIWSeFyjnZLJStdHwZN8iw+nI+o+JDq
	jNkUzA3CnqaBMLV9v8fNZAQR8aRV71CHQGzX94NfyP6JDspHzTBbqQWkko+VqJECLzT1
	0ET5Gq/Im/hIQAPjynFRR5bOGrh9JKMa/uqU+l2FnaY5no/HhKpGZhMfSNtF1FT1/KZK
	K8ag==
Received: by 10.216.131.30 with SMTP id l30mr4074050wei.111.1335444686184;
	Thu, 26 Apr 2012 05:51:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd4sm10787802wib.6.2012.04.26.05.51.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:51:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:13 +0200
Message-Id: <05595025539ab529b123d009c116306d1b680e00.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 08/15] efl-from-svn.inc: rename
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
X-List-Received-Date: Thu, 26 Apr 2012 13:01:03 -0000

* people with this included will notice new release recipes
  and use them if possible without breaking upgrade path

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{efl-from-svn.inc => efl-from-svn-recipes.inc} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-efl/conf/distro/include/{efl-from-svn.inc => efl-from-svn-recipes.inc} (100%)

diff --git a/meta-efl/conf/distro/include/efl-from-svn.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
similarity index 100%
rename from meta-efl/conf/distro/include/efl-from-svn.inc
rename to meta-efl/conf/distro/include/efl-from-svn-recipes.inc
-- 
1.7.8.5



