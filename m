Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAlH8-00016T-A7
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 19:26:26 +0200
Received: by daks35 with SMTP id s35so922956dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 10:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NgDukkUQTNrqv3ythK83mAs68gL+/qbEn8btJfnEryU=;
	b=A10+b77wQdz9vET2RFsIQHsJKyM6rUwaJO3F/r5IYbAyZAwMYwB3YMel2RwnO7H2U5
	sE9EAlQq5JcXJXgnv8FhQu/zk4f3uwgfsykvBn3Ut07kUtM4fokkAD9Dpet/H7E7xSlm
	abbxX5pNG+1zBtIdV6zugavStvCwemg+/eK+sYC31hqNj80KUJR1JX7b8TK31SUuM3yf
	7loqEI7mOvFG5BLpEj3IkVBt4/uVCNRW8yCAUeP7sy/WQEZ0tdaz4A7U4ee8dwV6K6Me
	Z2hWt07i47zcKyAlxT0e+7PzTxxZrL6EQ6mYB9GRNqwUxTkG6npor/PAMP2EJyg5GszQ
	y7FQ==
Received: by 10.68.226.132 with SMTP id rs4mr1088286pbc.75.1347210836944;
	Sun, 09 Sep 2012 10:13:56 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nt7sm343471pbb.33.2012.09.09.10.13.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Sep 2012 10:13:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2012 10:12:59 -0700
Message-Id: <1347210779-20115-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-smartphone][PATCH] task-base.bbappend: Rename to packagegroup-base.bbappend to match OE-Core
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
X-List-Received-Date: Sun, 09 Sep 2012 17:26:26 -0000

Fixes
WARNING: No recipes available for:
  meta-smartphone/meta-openmoko/recipes-core/tasks/task-base.bbappend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-base.bbappend}                    |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openmoko/recipes-core/{tasks/task-base.bbappend => packagegroups/packagegroup-base.bbappend} (100%)

diff --git a/meta-openmoko/recipes-core/tasks/task-base.bbappend b/meta-openmoko/recipes-core/packagegroups/packagegroup-base.bbappend
similarity index 100%
rename from meta-openmoko/recipes-core/tasks/task-base.bbappend
rename to meta-openmoko/recipes-core/packagegroups/packagegroup-base.bbappend
-- 
1.7.9.5



