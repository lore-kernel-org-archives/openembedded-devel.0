Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QMory-0003AZ-PI
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 00:05:31 +0200
Received: by bwz5 with SMTP id 5so2106297bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2011 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=PcLA4Y7mxifyef8i8nDHRvwEwRhQgrfbdgbE2i/DNww=;
	b=V3NRbOxWsnP9o0yzmywULjuVAZEmjJXuIfvaAPieHh0f5YnrGw80RDyj4euiS4R7sn
	uuzdV7SkNx0Vn1etVRq+jeU2mcErLqNwhRUnh8NWLcpJPcAJBGulchDyNG1/Kt/qvubj
	koBgmCqz3cr4OYhPD0zNz/izmPHKJK8FPsc2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=mfe6GIhKadjoa3Q91aMJZhoJXjeX/GwO2rk1AWlOQR71UxdmkhoqWMDq6oeR9sslXx
	n/gxqF8cw7+Jv3JvGhpH6mNN1tIGJMhgjhwdCdkOvDUeNrbhcdv9G7NlkN7ehToITu6p
	UTrUamVm+YewukHN5VhzCvDENAfq5PR7pqk1o=
Received: by 10.205.64.208 with SMTP id xj16mr2407756bkb.60.1305756124637;
	Wed, 18 May 2011 15:02:04 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 5sm1689854faz.0.2011.05.18.15.02.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 15:02:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 May 2011 00:01:56 +0200
Message-Id: <cover.1305755919.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [meta-efl 0/2] Pull request #6
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
X-List-Received-Date: Wed, 18 May 2011 22:05:31 -0000

Please merge following 2 patches.

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-efl
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (2):
  efl-from-svn.inc: import from meta-shr
  e-base: bump EFL_SRCREV a bit

 meta-efl/classes/e-base.bbclass               |    2 +-
 meta-efl/conf/distro/include/efl-from-svn.inc |   17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 meta-efl/conf/distro/include/efl-from-svn.inc

-- 
1.7.5.rc3



