Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Nq0Rp-0000F1-FW
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 09:42:26 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id B54FC491264
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 09:39:22 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 12 Mar 2010 09:39:42 +0100
Message-ID: <4B99FDBF.5070003@dresearch.de>
Date: Fri, 12 Mar 2010 09:39:27 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B990C32.6000906@dresearch.de>
	<hnb3e4$t8v$1@dough.gmane.org>	<4B99132A.1060608@dresearch.de>
	<hnb4h8$234$1@dough.gmane.org>
In-Reply-To: <hnb4h8$234$1@dough.gmane.org>
X-OriginalArrivalTime: 12 Mar 2010 08:39:42.0479 (UTC)
	FILETIME=[8F8D31F0:01CAC1BF]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Angstrom opkg feed config
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
X-List-Received-Date: Fri, 12 Mar 2010 08:42:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
>> But as mentioned before, wouldn't it be a good idea to create an
>> empty Packages.gz for all OE known machine types which are not
>> officially supported by Angstrom just to avoid this error. That
>> sounds easy to realize.
> 
> Feel free to volunteer to do that for all current and future OE
> machines, for all current and future angstrom releases[1].

Sorry. I do not have the times to this currently.

> [1] Extending contrib/angstrom/sort.sh would go a long way

But at least i added hipox machine there.

Steffen



