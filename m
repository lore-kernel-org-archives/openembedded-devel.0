Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 57DAF65E68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 08:05:11 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 7791)
	id 3A1B53B34059; Wed, 25 Jun 2014 09:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.1
Received: from localhost (dslb-092-077-006-204.pools.arcor-ip.net
	[92.77.6.204]) by gravedo.de (Postfix) with ESMTPSA id 30ED03B34059
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 09:55:19 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jun 2014 09:55:15 +0200
Message-Id: <1403682917-7598-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.9.1
Subject: [meta-qt5][RFC] Initial recipes for QtWebEngine
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
X-List-Received-Date: Wed, 25 Jun 2014 08:05:15 -0000

Hey everyone,

I spent some time last weekend to get finally a first version of qtwebengine building
inside OE. The current state builds without any problems and is also usable to some
degree at runtime. Sadly I didn't had much time to do some extensive testing with it
on a target device so I first submit the two changes needed as RFC. I hope that helps
some people to get also started with QtWebEngine in OE until we have a fully working
and verified version ready.

regards,
Simon


