Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 106EE7258E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 09:05:44 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id l18so16810860wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 01:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=uqBsTmdb9Tu528hO2nNcf4dsaBsid98UDkD2qdDIXMg=;
	b=h8hDB34t79trBtVx1i/JYygQKNC2/EzvsAqHPBPdUMhpZFSSbDBppz2GYoq7NHv+zx
	UHXI9Rhm8qJ3hOvdRhQmXFE90tkWi7bhRZuLly3HgoPYn0qMoyEdeb3noePZE/5+E9Qt
	FCz+fWdYKBx40dSoO3vf5eFDYlbK9TvZLTPm4Dfy/0m4PagIQJm2rrcVqD0WVYDpIykV
	5PkE2PtmBKt3fdIxn4zTI/5R/Ezb2AiprQx5boDuGV3zF+XssMm0sRWCsdPkDkH7vTfp
	Ih15+8DxHsSvTUHE+vbrPiGkQHLbdzTrFUqKPXQWW22krR3XIubNwcGltLFFyMmJw80b
	jpOA==
X-Received: by 10.194.81.38 with SMTP id w6mr59330074wjx.17.1418720744699;
	Tue, 16 Dec 2014 01:05:44 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id gl10sm295635wjd.26.2014.12.16.01.05.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 01:05:43 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Dec 2014 10:05:35 +0100
Message-Id: <1418720736-20426-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 0/1] qtwayland: re-enable cmake files they don't break build anymore
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
X-List-Received-Date: Tue, 16 Dec 2014 09:05:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build tested with qtwayland 5.4.0

Andreas Müller (1):
  qtwayland: re-enable cmake files they don't break build anymore

 recipes-qt/qt5/qtwayland.inc | 2 --
 1 file changed, 2 deletions(-)

-- 
1.8.3.1


