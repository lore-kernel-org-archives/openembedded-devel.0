Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8E95F6C745
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2014 16:48:36 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so1586649ead.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 08:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=0i90Dl2Hu4XWUbaTVK5q4DkwHC1uTD62bxabBfl4ABQ=;
	b=y4sdeICs18D1sLLuB3whdQj8An57xs7I1nIewNcskd1Mwm0qbI+HjJLN4Iks3+7tWU
	Shuk+M2SNuTvoMYcMEDIwcFEPo56PiJGf7kpgpsENtotKlUfJqVEizG+Pm++WDQFaN1s
	kVihoN2R6cWiCMsGy8MaMbBF3nhAGc782Vu4kmJMEaYeo1r/uI/Ee8sPJm1P5a6ZL1fT
	D0AFRqGjDDHkHQeCL7J09BrqkQROtlOF1q8pDyVrVLPpMCHTlwHXo0KwSHA3fKx4alwq
	6EkAHFA+8WV3r+hq8DB0twbgsBB0INrkMhSihzTyXHpbgtajSq1EpMDm9p2hrVuMCQkQ
	nXgw==
X-Received: by 10.14.99.129 with SMTP id x1mr4312046eef.89.1389286116613;
	Thu, 09 Jan 2014 08:48:36 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id o13sm7061332eex.19.2014.01.09.08.48.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 08:48:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2014 17:48:25 +0100
Message-Id: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2014 16:48:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I did not check if this error is in master branch - but hopefully 5.2 gets merged soon...

Andreas Müller (1):
  qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch

 .../0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1


