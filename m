Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id D43327D279
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:19:41 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id DB37122049D;
	Mon,  1 Jul 2019 09:19:38 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jul 2019 09:19:15 +1200
Message-Id: <20190630211917.16433-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190624062213.334-1-douglas.royds@taitradio.com>
References: <20190624062213.334-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH 0/2] googletest: Former gtest recipe has been renamed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Jun 2019 21:19:42 -0000

The gtest and gmock projects were combined under googletest in 2015,
and the former gtest recipe has now been renamed to googletest.

Douglas Royds (2):
  grpc: DEPENDS on googletest
  packagegroup-meta-oe: RDEPENDS on googletest

 meta-networking/recipes-devtools/grpc/grpc_1.14.1.bb       | 2 +-
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.17.1


