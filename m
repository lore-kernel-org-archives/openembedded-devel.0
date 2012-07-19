Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Srutu-0003jD-75
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 19:52:34 +0200
Received: by wibhq4 with SMTP id hq4so5521524wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TaJ+lv8cgdQJSAVAfU892zdwQJUuows4mmQUIRW5RdQ=;
	b=P0huc8lFrTKfmMVUDJwJNhm/RqpNM9ojV3O/9SX0aDEkLq40sCZE5BqT1H4j5qLCZv
	O9tZPVEjZYA4bDDyoTpH++oyAncgYEP0rus6mx00IKcBxTdgaFrbHkRsId8A1aB/N8w2
	QNkCKpRLCzV3blPD9E/0VTiRUXNf689pHcG4wo30eq7dM1Np/7QMbJh7tyhoaJAPbEHp
	ECf6s1xmDPch7lqOThuzl92rBsvOD/a5LILqm+x7OqHnfMJ+aOAPgoFeFgR9bLcJbzs0
	b+8sgv9y0fkuFUm+6IM/rlHbio96+EeJZz1SkP3ZzWDCpo6Y1bkCkFAQd3Vcws7LIe20
	R6zw==
Received: by 10.216.240.79 with SMTP id d57mr1697114wer.3.1342719672320;
	Thu, 19 Jul 2012 10:41:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ef5sm7653357wib.3.2012.07.19.10.41.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 10:41:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 19:41:11 +0200
Message-Id: <1342719671-28184-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342719671-28184-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342719671-28184-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] connman: rename bbappend to match new version from oe-core
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
X-List-Received-Date: Thu, 19 Jul 2012 17:52:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{connman_1.0.bbappend => connman_1.3.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/meta-oe/recipes-connectivity/connman/{connman_1.0.bbappend => connman_1.3.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/connman/connman_1.3.bbappend
-- 
1.7.8.6



