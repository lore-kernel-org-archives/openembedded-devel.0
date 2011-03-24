Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2tvz-0004AQ-Sg
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:27:19 +0100
Received: by bwz10 with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=K9Qy+dRnXpZVxKMNPh0kK1a3s9SlOiWYEEFJysvBBCE=;
	b=Kg4ey+zr1Bk3mM6UlKyWfL7POAe7/G3x7toPbqfTRAyk7X64/CP6F95p0G7fR9azSR
	oZuwdo+d+Q3sj+Z1ECZTZiUamx2flpTx1c9sz9AeanS73I9gQ8IewLQne76ODNDzcPUq
	bCP9Kzl4kTeePgswiL0VPQE+9GD2UW7uwTVyc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=M0X30dHVXbZzIw1rp1SqHEfrDQwnrcYfh7stAYQoILP7eccD44ZYKH6HpuTrLEbXfg
	tUqYleBPuNOui751k5sXg/Zmlp2i+/St+vztYJiNMxGkgY2WgN1cl9g8IDu4QVvOdguN
	/A5KPA3tw4M8Txe8P0DG2lMKPb5+A1fUaceOU=
Received: by 10.204.19.74 with SMTP id z10mr68223bka.183.1301009127150;
	Thu, 24 Mar 2011 16:25:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm323644bkt.5.2011.03.24.16.25.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:25:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:25:20 +0100
Message-Id: <cover.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/8] [meta-oe] remaining set of LIC_FILES_CHKSUMs for e-wm build
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
X-List-Received-Date: Thu, 24 Mar 2011 23:27:19 -0000

e-wm compiled fine now with few extra BBCLASSEXTEND in oe-core

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/license
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/license

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (8):
  eet: add LIC_FILES_CHKSUM
  evas: add LIC_FILES_CHKSUM
  ecore: add LIC_FILES_CHKSUM and inherit gettext
  edbus: add LIC_FILES_CHKSUM
  efreet: add LIC_FILES_CHKSUM
  eeze: add LIC_FILES_CHKSUM
  edje: add LIC_FILES_CHKSUM
  e-wm: add LIC_FILES_CHKSUM and inherit gettext

 meta-efl/recipes-efl/e17/e-wm_svn.bb |    3 ++-
 meta-efl/recipes-efl/efl/ecore.inc   |    7 ++++---
 meta-efl/recipes-efl/efl/edbus.inc   |    1 +
 meta-efl/recipes-efl/efl/edje.inc    |    1 +
 meta-efl/recipes-efl/efl/eet.inc     |    1 +
 meta-efl/recipes-efl/efl/eeze.inc    |    1 +
 meta-efl/recipes-efl/efl/efreet.inc  |    1 +
 meta-efl/recipes-efl/efl/evas.inc    |    1 +
 8 files changed, 12 insertions(+), 4 deletions(-)

-- 
1.7.4.1



