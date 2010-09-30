Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P1Kd0-0007n3-Px
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 17:01:04 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7FC04491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 17:00:45 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 30 Sep 2010 17:00:45 +0200
Message-ID: <4CA4A620.6080104@dresearch.de>
Date: Thu, 30 Sep 2010 17:00:48 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA44597.5070300@dresearch.de>	<1285834219-17132-1-git-send-email-sledz@dresearch.de>
	<1285858596.3805.111.camel@mattotaupa>
In-Reply-To: <1285858596.3805.111.camel@mattotaupa>
X-OriginalArrivalTime: 30 Sep 2010 15:00:45.0189 (UTC)
	FILETIME=[423B6350:01CB60B0]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Thu, 30 Sep 2010 15:01:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Am 30.09.2010 16:56, schrieb Paul Menzel:
> Am Donnerstag, den 30.09.2010, 10:10 +0200 schrieb Steffen Sledz:
>> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> 
> What is your build error?
> 
> Building `epiphany-2.30.2-r2` with `MACHINE = "beagleboard"` for minimal
> (eglibc) worked for me.

see <http://tinderbox.openembedded.net/packages/797336/>

> Besides that would PR need to be increased?

Not sure, but i can do that of course.

Steffen



