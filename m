Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LdnNp-00008O-7y
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Mar 2009 16:15:13 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id A71F616DFB8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2009 16:24:55 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id ACA692A41A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Mar 2009 16:11:27 +0100 (CET)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Sun, 1 Mar 2009 16:11:06 +0100
Message-ID: <49AAA599.5070507@dresearch.de>
Date: Sun, 01 Mar 2009 16:11:21 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.19 (X11/20081227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>	<49A7BD17.2080407@dresearch.de>
	<432beae0902271228w2150a17fo79e5a76c8eb71b42@mail.gmail.com>
In-Reply-To: <432beae0902271228w2150a17fo79e5a76c8eb71b42@mail.gmail.com>
X-OriginalArrivalTime: 01 Mar 2009 15:11:06.0890 (UTC)
	FILETIME=[F207EEA0:01C99A7F]
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Sun, 01 Mar 2009 15:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Justin Patrin schrieb:
> Are the machines you're building on exactly the same? Do they perhaps
> have different architectures or distributions? Have you tried updating
> the systems?

The machines are different.

The one that works fine:
 Ubuntu 8.10
 Linux bfg9000 2.6.27-11-generic #1 SMP Thu Jan 29 19:28:32 UTC 2009 x86_64 GNU/Linux

The one with the problem:
 openSUSE 11.1
 Linux recycler 2.6.27.19-3.2-default #1 SMP 2009-02-25 15:40:44 +0100 i686 athlon i386 GNU/Linux

> This looks like a qemu failure to me.

I agree. But i can't believe, that the different OS my be involved in that. Both are up-to-date. And i thought that all the tools needed to cross-build the packages are build by OE itself.

Steffen


