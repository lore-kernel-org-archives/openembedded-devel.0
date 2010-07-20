Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1ObHtW-0006nT-B2
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:50:30 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id DFB6780C534; Tue, 20 Jul 2010 20:45:02 +0200 (CEST)
Received: from localhost (p5489DD67.dip.t-dialin.net [84.137.221.103])
	by gravedo.de (Postfix) with ESMTPSA id E734280C534
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 20:45:01 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 20:44:53 +0200
Message-Id: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Some love for the lvm2 recipes ...
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
X-List-Received-Date: Tue, 20 Jul 2010 18:50:30 -0000

Heyho,

the following patches will update the lvm2 recipe in the oe tree. The first patch rebases
both already available recipes on a general lvm2.inc which contains common stuff for all
lvm2 recipes. The second patch adds a patch to fix a compile issue of both available lvm2
versions. The last two patches introduces machine specific configuration files for lvm2
and add one for the palmpre machine.

regards,
Simon Busch



