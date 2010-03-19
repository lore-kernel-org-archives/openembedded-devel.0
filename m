Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NsbmX-0001Dx-Vs
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 13:58:30 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id F1E72491286
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 13:55:25 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 19 Mar 2010 13:55:37 +0100
Message-ID: <4BA3744C.3060607@dresearch.de>
Date: Fri, 19 Mar 2010 13:55:40 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268857354-30377-1-git-send-email-sledz@dresearch.de>	<1268990986.3893.5.camel@mattotaupa>
	<hnviha$nf1$1@dough.gmane.org>
In-Reply-To: <hnviha$nf1$1@dough.gmane.org>
X-OriginalArrivalTime: 19 Mar 2010 12:55:37.0549 (UTC)
	FILETIME=[78C72FD0:01CAC763]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: new recipe
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
X-List-Received-Date: Fri, 19 Mar 2010 12:58:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
>>> +DEPENDS = ""
>> Remove this empty variable?
> 
> I think that's meant to do what INHIBIT_DEFAULT_DEPS does, but I'm not sure.

This was not meant here.

If this is the meaning i've to prepare a patch which removes
this line immediately because the recipe was pushed yesterday
to dev.

Steffen



