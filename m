Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJlG5-0005Yl-HC
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 13:37:45 +0200
Received: by bwz5 with SMTP id 5so5331058bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 04:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=ydX2rvQmhJakDHp8adJcf/xFa9ok/GAJvPc08NhmBoM=;
	b=RwwY5iuU6spkZ++N3XS3WYZWtSya+Uuydpd+fJTtJSNtT9de97lMIMWSoUwjUQBo8P
	zxTAUtJEkexAJEgW7gaMQA7DREkJyZm3AYIbQGBSvHzYAw/m1THYrP2BqtNi5DJMVNAZ
	dWAIugatz1wmSMqbotTRvIUexkzECV/gXcT8I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=BRE/1QBdi/2lpTYvH0I06qsnAh51Of3ap4SNFT22fM/SssJuyJ4LWQMDV31h34T4WB
	kPlvAR3O2LrbYkqnSEya33ZCer7X7Iz4kIrKaJCJL43EQOn7c0yMzwZJ0ee0awGV/8mz
	VBrkjLrCFtsU5Sl548RljwzGaNqZ0SB93zpZg=
Received: by 10.204.82.224 with SMTP id c32mr7048624bkl.161.1305027300097;
	Tue, 10 May 2011 04:35:00 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm441834fak.1.2011.05.10.04.34.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 04:34:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 13:34:58 +0200
Message-Id: <cover.1305027207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-efl][PATCH 0/2] Pull request #5
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
X-List-Received-Date: Tue, 10 May 2011 11:37:45 -0000


Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-efl
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (2):
  e-base: bump SRCREV and update fix-ecore-fb-initialization.patch
    patch for ecore_svn
  embryo, epdf: fix LICENSE, from oe.dev

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../ecore-1.0.0/fix-ecore-fb-initialization.patch  |   28 ++++++++++++++++++++
 .../efl/ecore/fix-ecore-fb-initialization.patch    |   17 ++++++-----
 meta-efl/recipes-efl/efl/embryo.inc                |    7 +++--
 meta-efl/recipes-efl/efl/epdf_svn.bb               |   10 ++++---
 5 files changed, 48 insertions(+), 16 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/ecore-1.0.0/fix-ecore-fb-initialization.patch

-- 
1.7.5.rc3



