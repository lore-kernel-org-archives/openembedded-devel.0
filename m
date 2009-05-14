Received: from [88.149.128.34] (helo=smtpi4.ngi.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1M4WCT-0005ab-LK
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 10:21:58 +0200
Received: from localhost.localdomain (81-174-25-145.dynamic.ngi.it
	[81.174.25.145]) by smtpi4.ngi.it (Postfix) with ESMTP id F00CC42075
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 10:15:07 +0200 (CEST)
From: Elena Grandi <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 May 2009 10:14:53 +0200
Message-Id: <1242288896-6347-1-git-send-email-elena.valhalla@gmail.com>
X-Mailer: git-send-email 1.6.0.6
Subject: Add gtksourceview 2.x and rename the 1.x tree recipe
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
X-List-Received-Date: Thu, 14 May 2009 08:22:10 -0000


GtkSourceView[1] currently maintains a stable 2.x tree and an old stable
1.x tree for compatibility with older applications[2] and they can be
installed together on a computer.

I need to add the recipe for the latest 2.x version, and since the old
stable is used just in 2 recipes (gobby_0.4.1.bb and tea_17.3.5.bb) and
mentioned as a preferred version in preferred-om-2008-versions.inc
it seems to me that this could be a good time to rename it to
gtksourceview1 with minimal breakage.

(I also hope I've used correctly the git tools for patch sending by
email: sorry if I've done something wrong)

[1] http://projects.gnome.org/gtksourceview/
[2] http://projects.gnome.org/gtksourceview/download.html

--
Elena ``of Valhalla'' Grandi

email: elena.valhalla@gmail.com


