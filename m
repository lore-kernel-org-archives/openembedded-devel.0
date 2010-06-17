Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OPF3f-0002MJ-AV
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 15:23:14 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id D936449127F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 15:18:30 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 17 Jun 2010 15:18:30 +0200
Message-ID: <4C1A20CF.60302@dresearch.de>
Date: Thu, 17 Jun 2010 15:19:11 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
In-Reply-To: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
X-OriginalArrivalTime: 17 Jun 2010 13:18:30.0752 (UTC)
	FILETIME=[9472D600:01CB0E1F]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Thu, 17 Jun 2010 13:23:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 17.06.2010 14:24, schrieb Andrea Adami:
> Which machines apart some Zaurus are needing older 2.6.2x kernels?
> 
> If it's only about Zaurus I'd *only* keep an older version (still to
> decide if 2.6.24 or 2.6.26) for a while and the latest 2.6.34.

hipox needs 2.6.24. :(



