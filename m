Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OOUmZ-0006WJ-67
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 13:58:31 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 5647D491283
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jun 2010 13:53:48 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 15 Jun 2010 13:53:48 +0200
Message-ID: <4C1769D5.4020601@dresearch.de>
Date: Tue, 15 Jun 2010 13:53:57 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>
	<1276584950-22168-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1276584950-22168-1-git-send-email-sledz@dresearch.de>
X-OriginalArrivalTime: 15 Jun 2010 11:53:48.0403 (UTC)
	FILETIME=[6A4E6C30:01CB0C81]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Tue, 15 Jun 2010 11:58:31 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Am 15.06.2010 08:55, schrieb Steffen Sledz:
> * The former default behaviour was to exit with failure if lease is not
>   immediately obtained. This results in permanent network disconnect if DHCP
>   server is (accidentally) not available at boot time. :(
> 
> * Since bb 1.14 this is no longer hardcoded and can be configured.

Some more ACKs?

Or NAKs (i hope not)?



