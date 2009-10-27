Received: from [87.193.137.100] (helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1N2lLj-0006QH-MN
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 13:40:34 +0100
Received: from hiob.intern.dresearch.de (unknown [10.32.0.138])
	by mail.dresearch.de (Postfix) with ESMTP id D6C6149128E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 13:39:27 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 27 Oct 2009 09:26:38 +0100
Message-ID: <4AE6AE15.4080206@dresearch.de>
Date: Tue, 27 Oct 2009 09:23:49 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1256566659-32412-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 27 Oct 2009 08:26:39.0000 (UTC)
	FILETIME=[3461C980:01CA56DF]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] glibc_2.9: disable parallel make
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
X-List-Received-Date: Tue, 27 Oct 2009 12:40:34 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Parallel make for glibc_2.9.bb fails on different multi-cpu build hosts
> (e.g. AMD Phenom(tm) 9150e Quad-Core Processor running openSUSE 11.1)
> with various errors. :(
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ...

BTW: It is the first time i proposed a patch this way and i expected
to see it in the patchwork queue but it doesn't. :(

Steffen




