Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N6JwS-0000FG-7L
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 09:13:11 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id A284C4912A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 08:41:32 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 6 Nov 2009 08:44:02 +0100
Message-ID: <4AF3D312.9040101@dresearch.de>
Date: Fri, 06 Nov 2009 08:41:06 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AF2B936.4020105@dresearch.de>	<baaef4710911050521m19cdb480k3460a4715d939563@mail.gmail.com>
	<4AF35674.5040608@gmail.com>
In-Reply-To: <4AF35674.5040608@gmail.com>
X-OriginalArrivalTime: 06 Nov 2009 07:44:02.0250 (UTC)
	FILETIME=[E89232A0:01CA5EB4]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg memory problem?
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
X-List-Received-Date: Fri, 06 Nov 2009 08:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> The following is untested and only reduces that chances of this occuring,
> but perhaps it makes sense to do something like this?
> 
> diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
> ...

It seems to help in my case. No error messages any longer. :)




