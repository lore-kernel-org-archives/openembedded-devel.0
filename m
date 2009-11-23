Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1NCdQj-0001QK-LS
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 19:14:32 +0100
Received: by gxk7 with SMTP id 7so8873512gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 10:13:01 -0800 (PST)
Received: by 10.101.207.1 with SMTP id j1mr3931429anq.39.1258999979459;
	Mon, 23 Nov 2009 10:12:59 -0800 (PST)
Received: from localhost.localdomain ([200.184.118.130])
	by mx.google.com with ESMTPS id 9sm1559186ywf.5.2009.11.23.10.12.49
	(version=SSLv3 cipher=RC4-MD5); Mon, 23 Nov 2009 10:12:53 -0800 (PST)
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Nov 2009 15:06:23 -0300
Message-Id: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: ricardo.salveti@openbossa.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCHES] Fixing Mamona-related packages.
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
X-List-Received-Date: Mon, 23 Nov 2009 18:14:32 -0000

Patches:
[PATCH 1/2] mamonaim-e-applet-git: bumping rev, fixing PV and using oe-stylize
[PATCH 2/2] mamona-input-methods-git: bumping rev, fixing PV and using oe-stylize

Both patches are basically to fix broken Mamona-related packages at current OE. When Rodrigo Vivi started
to merge some Mamona commits, he actually got the wrong ones for these recipes, so this basically fix
something that didn't actually work.

As current Rodrigo Vivi is not working at Mamona and OE anymore (at least not directly related as before),
I'm basically maintaining it with Alecrim and Willer, but as none of us have commit access, I'm asking
for anyone to please apply both pathes at OE tree.

We are currently working at Mamona Overlay and probably until the end of this week I'll submit many other
commits for review and merge.

Thanks,

Ricardo



