Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qvb8e-0001Cf-Eg
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Aug 2011 22:30:28 +0200
Received: by fxg11 with SMTP id 11so3800464fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2011 13:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=olIqkdc80uq4slSbH0t5rTdI4dm8CA0Ebr0fi43K2Bs=;
	b=ahq1LrvRKeJJEwnJAfDfZ752qtq92OYsZbrjQUGcRh2Wbqpzvj125OVsJtVFNl3qwK
	TzyIIsrxav97O31Q1T/oihu7NGUdQv8Q8CBwGVB7OdANbvng1f6toNgjGuS48PbYFHA/
	8KAT03Y91jV+R+ad1MHmaumx9hADQdarcvmoo=
Received: by 10.223.59.208 with SMTP id m16mr4162388fah.47.1314044744297;
	Mon, 22 Aug 2011 13:25:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm3312853faf.32.2011.08.22.13.25.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 13:25:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2011 22:25:34 +0200
Message-Id: <cover.1314044687.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-efl][PATCH 0/4] Pull request #9
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
X-List-Received-Date: Mon, 22 Aug 2011 20:30:28 -0000

The following changes since commit e2ab1ff691b2ed4444b331247157707c68f239f7:

  kernel.bbclass: save kernel image name into $kerneldir (2011-08-22 22:03:11 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

Martin Jansa (2):
  e-base: bump EFL_SRCREV
  elementary: add new elementary-accessibility package and improve
    packaging

Sebastian Krzyszkowiak (1):
  edje: include epp in edje-utils package. Fixes edje_cc

pespin (1):
  elfe: Add LIC_FILES_CHKSUM to recipe

 meta-efl/classes/e-base.bbclass            |    2 +-
 meta-efl/recipes-efl/e17/elfe_svn.bb       |    1 +
 meta-efl/recipes-efl/efl/edje.inc          |    3 ++-
 meta-efl/recipes-efl/efl/elementary_svn.bb |   15 +++++++++++----
 4 files changed, 15 insertions(+), 6 deletions(-)

-- 
1.7.6



