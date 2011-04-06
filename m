Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7MwX-0005o1-1C
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:14:21 +0200
Received: by fxm19 with SMTP id 19so886040fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=klbnlcL+/TtrbznNFNAQPCAVyAz4H7DnHG2tVjm2ekM=;
	b=pSdPP/J713/6qo75f46+F5/yWNfHx3jjWIIayGj4s61vVSNg87vBgHA219fQv3FEze
	C+t98bJZ5UQlo2eK9MDaLQ/dXlRTY1Ioi9VkmusxDZHVJnS7HR2NLdWTmDGWxQZ8rYqj
	tXnAfxCEjmGQ2ZFp1ynLq+QK9+fe/hPlxQJFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=btbX/ZYbwSfUMRfesGmJD1p67vaegHUz08+kzdne56YIJnANTD3lKkaX7d0BIxqMJ2
	H4us0MjZumPBA01YeCuCsxVM/sTWGWsC8rQiWWbaN29PLD+QUBOCRbGMemy8NVUEYeQz
	7j/CquA3Ov9s1nw9yieyNPILlLHzZkf+kyhUU=
Received: by 10.223.67.210 with SMTP id s18mr660827fai.41.1302073934796;
	Wed, 06 Apr 2011 00:12:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e23sm78840faa.42.2011.04.06.00.12.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:12:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:12:07 +0200
Message-Id: <cover.1302073753.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] [meta-oe] Pull request #3
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
X-List-Received-Date: Wed, 06 Apr 2011 07:14:21 -0000

Pull URL: git://gitorious.org/shr/meta-openembedded.git
  Branch: jama/meta-oe
  Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-oe

Thanks,
    Martin Jansa <Martin.Jansa@gmail.com>
---


Martin Jansa (1):
  ttf-arphic-uming: fix LICENSE and add LIC_FILES_CHKSUM

 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.4.1



