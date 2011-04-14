Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QAGLj-0005sl-OK
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 08:48:19 +0200
Received: by fxm19 with SMTP id 19so1172487fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Apr 2011 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=o1EEc+YUw2juLRwNdDAPyfZGQPT2np+3TdOOIVvRW3s=;
	b=aS015GTamJdRmxHKPn/3vx8JWd3ROR8ZcdyqQUNi0B0fV6S1I/S5C3jmVQ2QqnfCqy
	+5RLJjSl0Wu6vU+DhLTuH5lHKAZMiJFlaPckCIFBBMKxiCUpOc99yXRvmT0Jt9hYmxtb
	Rj30tIZB7cy1QJUVfPEGZW4jU5giTqCEclwNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aLGftpMAAvDPjpHUu631wRAchRH3wdE1gNYzR6Ev00jbjBtRJx45Qr7hH5IPanpKqQ
	F4H6twzLLZwZbVQpPzH7uQRlZnZ+beecofflMuetAEQWdEzMqwjXtmH6D12KChtcPN5c
	EzNZWpCWXpW9llpnQanEAPXd3gHonYhAgYJ5A=
Received: by 10.223.3.132 with SMTP id 4mr399333fan.132.1302763564021;
	Wed, 13 Apr 2011 23:46:04 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm393286fam.40.2011.04.13.23.46.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Apr 2011 23:46:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2011 08:46:02 +0200
Message-Id: <cover.1302763397.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
Subject: [meta-oe] [PATCHv2 0/1] Pull request #6
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
X-List-Received-Date: Thu, 14 Apr 2011 06:48:19 -0000

Small fix for mesa-xlib.
FILESPATHPKG support in oe-core would be nice.

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-oe
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (1):
  mesa-xlib: fix FILESPATH

 meta-oe/recipes-graphics/mesa/mesa-xlib.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.5.rc1



