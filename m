Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hW7-0002BU-RA
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:11:49 +0100
Received: by bwz10 with SMTP id 10so7236709bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=B0ZVwepXuCPJ1YkhwTrCCXlh0oJBZyr+5N+lGO8HUZE=;
	b=ipvG3vC3HijN+EFwTpKAHdmrfP922z3I/IYm+2AJ7HLX7XvSuHyIlHiyH/voyasak1
	L9eNnTuxjFEcSdUI1yO9ZVBe1MiGi9qk/3dgSetHOzQtsBFCkloQAOtrQO5X5cwHUHRR
	OmtKj7jQAGNXG/SUnVARhcmr1Fu0G+ZgUzT1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=tGeY2rDC6WPvm5AyKDyZJqQspHvj1275VL+dTcaPGOiA5D1RldyDFAq+xn9axOGPLk
	NVOCpNGyoL2UqsoB5uiojuJREaQZGO1cHWzzI3ySHJKRMVUFhVud5u+9NS3eRBGUoRUB
	cedoEICdxNhxMSRT2060BReFNxnHTUByRYEiA=
Received: by 10.204.35.18 with SMTP id n18mr536198bkd.91.1300961392301;
	Thu, 24 Mar 2011 03:09:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id k5sm1217549bku.16.2011.03.24.03.09.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:09:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:09:44 +0100
Message-Id: <cover.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/7] Checksums and LIC_FILES_CHKSUMs
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
X-List-Received-Date: Thu, 24 Mar 2011 10:11:49 -0000

Mostly checksums and LIC_FILES_CHKSUMs

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/license
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/license

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (7):
  libgpg-error: add checksums
  mime-support: add LIC_FILES_CHKSUM
  eina: add LIC_FILES_CHKSUM
  embryo: add LIC_FILES_CHKSUM
  gitflib: add LIC_FILES_CHKSUM
  fribidi: fix LICENSE, drop D_P, add LIC_FILES_CHKSUM
  lua5.1: add LIC_FILES_CHKSUM

 meta-efl/recipes-efl/efl/eina.inc                  |    3 ++-
 meta-efl/recipes-efl/efl/embryo.inc                |    3 ++-
 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb    |    1 +
 .../recipes-devtools/libfribidi/fribidi_0.19.2.bb  |    9 +++------
 meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb       |    1 +
 .../libgpg-error/libgpg-error_1.8.bb               |    3 ++-
 .../mime-support/mime-support_3.44.bb              |    1 +
 7 files changed, 12 insertions(+), 9 deletions(-)

-- 
1.7.4.1



