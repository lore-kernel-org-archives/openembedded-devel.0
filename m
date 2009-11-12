Received: from [66.80.197.243] (helo=looper.buglabs.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1N8crl-0003jW-W7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 17:49:53 +0100
Received: from aphid.buglabs.net (aphid.buglabs.net [192.168.20.30])
	by looper.buglabs.net (Postfix) with ESMTP id B0D4934049
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:48:39 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by aphid.buglabs.net (Postfix) with ESMTP id 9D33128E002
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:50:33 -0500 (EST)
X-Virus-Scanned: amavisd-new at aphid.buglabs.net
Received: from aphid.buglabs.net ([127.0.0.1])
	by localhost (aphid.buglabs.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBH4uqrIWhyn
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:50:33 -0500 (EST)
Received: from [192.168.0.120] (t61.buglabs.net [192.168.0.120])
	by aphid.buglabs.net (Postfix) with ESMTP id 0F58D28E001
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 11:50:33 -0500 (EST)
From: Ken Gilmer <ken@buglabs.net>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Organization: Bug Labs, Inc.
Date: Thu, 12 Nov 2009 12:48:10 -0500
Message-Id: <1258048090.6495.40.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.5 
X-SA-Exim-Connect-IP: 66.80.197.243
X-SA-Exim-Mail-From: ken@buglabs.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Summary of Toolchain/SDK session (Continued)
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
X-List-Received-Date: Thu, 12 Nov 2009 16:49:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Carried on from Philop's earlier post:

Regarding classes of developers, I've started a wiki page that attempts
to give some details.  Next will be to list apps and tools (or
proposals) that address the needs of each developer class.

http://wiki.openembedded.net/index.php/ToolingUseCases

Another part of the discussion (unless this is covered under another
section) focused ease of setup of OE.  There are some custom tools for
doing this, Denis suggested something like Android repo tool.  Esben has
his own script.  OTE has a simple installer.  It was agreed to
collaborate on a approach for easier installation and configuration of
OE.  Denis proposed defining a data format that could be read by a
variety of tools to download and install all pieces necessary for OE to
work and could be used by customers and other users.  Wiki page for
this:

http://wiki.openembedded.net/index.php/EasyInstall

thx
ken




