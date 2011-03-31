Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Dyp-0006xr-Kw
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:15:51 +0200
Received: by bwz5 with SMTP id 5so1664409bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=NQW9b0ibD3/ejZ72R5/A6bECbtwYCjxLpDNn8SLHvhk=;
	b=GtE5DcLLkc4DkGh4dAiSP/wDg09QaLgjK/dslQ/jgT2EWNUqfFdPAkNvumu2Ofkn4k
	/zxzP4bLUx13BP+S9w97cnIX/nwwUYaY9i9ZLGEXcBk8FJreOUBnHLUzKleoKuavr61B
	UCCjka91olLvAq9QEpO4q38jLO/tgpNl+xv3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uSAqCqKBZ0kxNmIp86Qe9epqS5kGQoKfY5m/F2oxrugbz1L2xT9UXfp8+VedNCPHuY
	ya+EHX9ACLiC1E8n+UStlNVfKkbEYDccFs+Oq+xmRm5UL5r9ZHZyQ8yoSCz84L7p68hZ
	cHlBa3u4cz3FwoG9ibGqwy6qVeZK6FC+L8JEU=
Received: by 10.204.20.139 with SMTP id f11mr2217635bkb.177.1301562828136;
	Thu, 31 Mar 2011 02:13:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm591895bka.3.2011.03.31.02.13.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 02:13:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 11:13:40 +0200
Message-Id: <cover.1301562689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] [meta-oe] Pull request #2
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
X-List-Received-Date: Thu, 31 Mar 2011 09:15:51 -0000

python-cython is needed by meta-efl layer for python-efl
ttf-sazanami: fix LICENSE

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-oe
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (2):
  python-cython: import from meta-shr
  ttf-sazanami: fix LICENSE and add LIC_FILES_CHKSUM

 .../recipes-devtools/python/python-cython_0.13.bb  |   19 +++++++++++++++++++
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-cython_0.13.bb

-- 
1.7.4.1



