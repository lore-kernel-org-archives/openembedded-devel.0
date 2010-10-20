Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P8otO-0001aB-Gk
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 08:44:51 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 5A613491282
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 08:44:12 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 21 Oct 2010 08:44:12 +0200
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 0276A296DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 13:08:06 +0200 (CEST)
Message-ID: <4CBECD95.1050700@dresearch.de>
Date: Wed, 20 Oct 2010 13:08:05 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100914 SUSE/3.0.8 Lightning/1.0b1
	Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
	<DB561678F08F554EB0D9F21B70E268A505AF50@exchange.intern.dresearch.de>
In-Reply-To: <DB561678F08F554EB0D9F21B70E268A505AF50@exchange.intern.dresearch.de>
X-OriginalArrivalTime: 21 Oct 2010 06:44:12.0193 (UTC)
	FILETIME=[5EE5B910:01CB70EB]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-14 - configure epiphany still fails
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
X-List-Received-Date: Thu, 21 Oct 2010 06:44:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/2010 02:27 PM, Sledz, Steffen wrote:
> do_configure still fails with the ca-certificates problem [1]. :(
> 
> If nobody will find a solution for this problem (for my first diagnosis see [2]) until the next testing branch creation, i'll push my original patch which disables the ca-file use [3].
> 
> Steffen
> 
> [1] <http://tinderbox.openembedded.org/packages/859111/>
> [2] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/37925/focus=38034>
> [3] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/37453/focus=37585>

OK, i tried to fix for myself. Patches follow.

Steffen


