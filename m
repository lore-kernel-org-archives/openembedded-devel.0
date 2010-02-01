Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NbyeT-00024n-9W
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Feb 2010 16:57:28 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 395D7491264
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2010 16:55:01 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 1 Feb 2010 16:55:32 +0100
Message-ID: <4B66F963.4020605@dresearch.de>
Date: Mon, 01 Feb 2010 16:55:15 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <op.u7dydnc4mn1qzu@camelguo>
	<201002011019.29557.marcin@juszkiewicz.com.pl>
In-Reply-To: <201002011019.29557.marcin@juszkiewicz.com.pl>
X-OriginalArrivalTime: 01 Feb 2010 15:55:32.0491 (UTC)
	FILETIME=[FC101DB0:01CAA356]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: failed to apply oxnas.diff when building linux_2.6.24.bb for oxnas machine
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
X-List-Received-Date: Mon, 01 Feb 2010 15:57:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
>> But when building linux_2.6.24 for oxnas, the oxnas.diff can not be
>> applied to the kernel with plenty of hunks failed.
> 
> Please prepare patch which will remove oxnas support from this recipe. It is 
> not building since October and Steffen wrote:
> 
>>> hipox is my job. oxnas too, but may be we can finish the support for this.

I'll do that for myself.

Steffen




