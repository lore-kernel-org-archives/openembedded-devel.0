Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3286BDD2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:38:51 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5BFcqhM022876
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:38:52 +0200
Received: from dev.vm6.ccp.siemens.com (MD1FZU9C.ad001.siemens.net
	[139.16.78.240])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id x5BFcq9A021920
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:38:52 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 4E00110D1262
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:38:52 +0200 (CEST)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2019 17:38:46 +0200
Message-Id: <20190611153848.30239-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606065308.23766-1-pascal.bach@siemens.com>
References: <20190606065308.23766-1-pascal.bach@siemens.com>
Subject: [meta-oe][PATCHv3 0/2] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Tue, 11 Jun 2019 15:38:52 -0000

Protobuf-c 1.3.1 is not compatible with protobuf 3.8.0.
This updated patchseries update backports a compatbility fix for protobuf-c
from master.


