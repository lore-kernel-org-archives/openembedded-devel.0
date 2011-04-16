Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QB49m-0003Mm-Ua
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:59:19 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2693953fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2011 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=r/oDUupEJ1H2VqJdYHfynpanjmvD8ebJgFmnAHCdzak=;
	b=oi6ws9hFk/EIgb2A3jLNh6nXo58smTanzzc0eP9iX1ZAi7mUcCwLqbLT71yhwSNIkl
	hVMdZkgDSuz8wjExEaQBmM3JPYoFDbfmfVjl34CD4aYio8FI8NCc+VcC2esOwJVOXJAo
	32dJ1jOGK+9fvHM2sSe7Ky4s7htjUDq77LPJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=AINI0/Tzse8Sp2fd4j9HsNk4wuWCcN5IgLxO27LjTQ51/Ezr3CPZcJoH+6NZryXuZb
	1zN/nQprMgkSYa9qSGtLplUCseAEahqawaghO2cwGtzR+G8fMpxyXE7j2WIxaNjuSKpm
	MwPVWyxKziOAf03Qqkwy7N+p9s/eNaaB/0eMo=
Received: by 10.223.143.16 with SMTP id s16mr3190903fau.57.1302955023023;
	Sat, 16 Apr 2011 04:57:03 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c24sm1067956fak.7.2011.04.16.04.57.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Apr 2011 04:57:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Apr 2011 13:57:01 +0200
Message-Id: <dc4339fae98fa38dfee39b74f52ba7407e600809.1302954782.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1302954782.git.Martin.Jansa@gmail.com>
References: <cover.1302954782.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] vala.bbclass: move from meta-efl to meta-oe as libcanberra_0.26.bb is also using it
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
X-List-Received-Date: Sat, 16 Apr 2011 11:59:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 {meta-efl => meta-oe}/classes/vala.bbclass |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-efl => meta-oe}/classes/vala.bbclass (100%)

diff --git a/meta-efl/classes/vala.bbclass b/meta-oe/classes/vala.bbclass
similarity index 100%
rename from meta-efl/classes/vala.bbclass
rename to meta-oe/classes/vala.bbclass
-- 
1.7.5.rc1



