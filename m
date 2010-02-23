Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1Nk2QD-0002UE-MN
	for Openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 22:36:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 159012CA11;
	Tue, 23 Feb 2010 21:29:08 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwfPdVQFX2TX; Tue, 23 Feb 2010 21:29:04 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 8813C2C81E;
	Tue, 23 Feb 2010 21:29:03 +0000 (UTC)
Message-ID: <4B84499B.2010800@gmail.com>
Date: Tue, 23 Feb 2010 22:33:15 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Error: eggdbus_0.6.bb do_configure failed
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
X-List-Received-Date: Tue, 23 Feb 2010 21:36:05 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,
maybe I'm wrong but looks like after latest patches to dbus Angstrom
doesn't build with eggdbus_0.6.bb do_configure failed.
Where is dbus-bus-introspect.xml now ?
Anybody is successfully building x11-image (or similar) recently?

http://pastebin.com/NEuN3JCE

TIA

/marco



