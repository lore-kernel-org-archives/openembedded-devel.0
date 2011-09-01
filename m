Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9eT-0008VC-Dp
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:58:01 +0200
Received: by fxg11 with SMTP id 11so881914fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CBkTTP/c7Uthc+HP1rBVYOW1pe2pfylsLnACybFHtl0=;
	b=lEwh32HxP9eapOtOmoJOwYbNDSiGMK1Xv7z4wbjML/uenZkVws7gsbpsqplp4tPhcS
	QJUnqmyq9o5owx3DfrYy2g0yNA6MihZDoT2CVIfC/DV0ODtL0j+0zJpShbMWxz9h40nd
	uHq/AcQ8i7SMmVoyCWj1Ls2JYtn+MXpsXbjhk=
Received: by 10.223.56.17 with SMTP id w17mr490974fag.142.1314892386056;
	Thu, 01 Sep 2011 08:53:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b19sm131720fab.32.2011.09.01.08.53.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:53:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:52:57 +0200
Message-Id: <cover.1314892354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-efl][PATCH 0/2] Pull request #10
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
X-List-Received-Date: Thu, 01 Sep 2011 15:58:01 -0000

The following changes since commit a577b53823d5a0e078777a5fb56a1e3d776b3130:

  lmbench: Add version 3.0-a9 (initial recipe) (2011-09-01 16:30:32 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

Martin Jansa (2):
  evas: add evas-loader-svg back to RRECOMMENDS
  e-base: EFL_SRCREV bump

 meta-efl/classes/e-base.bbclass   |    2 +-
 meta-efl/recipes-efl/efl/evas.inc |    6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

-- 
1.7.6.1



