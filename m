Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NYHKr-0004FG-Cx
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 12:05:56 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id 085A949127F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 12:03:38 +0100 (CET)
Received: from exchange.intern.dresearch.de ([10.32.1.40]) by
	hiob.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 22 Jan 2010 12:06:25 +0100
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 22 Jan 2010 12:03:50 +0100
Message-ID: <4B598603.4080603@dresearch.de>
Date: Fri, 22 Jan 2010 12:03:31 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 22 Jan 2010 11:03:51.0043 (UTC)
	FILETIME=[94419530:01CA9B52]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: package for kernel module devel?
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
X-List-Received-Date: Fri, 22 Jan 2010 11:05:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Our team is developing new kernel modules for our machine. For fast
development cycles it would be very helpful to be able to compile the
modules at the machine itself.

By installing task-native-sdk & Co. nearly all needed stuff is
available but i miss the linux kernel headers and the corresponding
link to them (/lib/modules/x.x.x.x/build). :(

Does a package exist for this (or for the complete kernel sources)?

Steffen



