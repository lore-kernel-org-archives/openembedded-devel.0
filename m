Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QAGPJ-000652-TV
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 08:52:01 +0200
Received: by fxm19 with SMTP id 19so1173770fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=iI1XhxPfpN7r2PtCarCcxcMUNNaqoZ6pN4obdERm34c=;
	b=uuWVtiKbr3jWummNtrzI+I+ES/mn9TwBhuIsBo3pplBVNrmlHfBSd5OqXjAu+ZWgMr
	eFUuiAmURPn1fCm8qe+7oXtptmPEnyiuZav+3uDkLURm7ORtFVr/nn6IXdvCfLS+V2po
	IBCHx+EQVxqsAA08ID+6VAaY1fS+f+cCExBUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=B834+lVuvskqyAjGxMaNeFhYTSai7VUSTnkARuJpgXeA+TQZHpe5Zfg7xGvGQRKSQ5
	8cvnP5780gs0CIR3OpR7HOQXzRSOtC8jIyQNzpBWXAgMM2WMneIvISGGWBL5TkKGbXGE
	tQrJ26idUeH0FzoCQywN8DVO68mk3mWCZSf40=
Received: by 10.223.6.198 with SMTP id a6mr396619faa.128.1302763785090;
	Wed, 13 Apr 2011 23:49:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f15sm395853fax.10.2011.04.13.23.49.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 23:49:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 08:49:37 +0200
Message-Id: <cover.1302763646.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [meta-efl] [PATCHv2 0/2] Pull request #4
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
X-List-Received-Date: Thu, 14 Apr 2011 06:52:02 -0000

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-efl
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (2):
  e-base: bump SRCREV
  imlib2: add LIC_FILES_CHKSUM

 meta-efl/classes/e-base.bbclass        |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.7.5.rc1



