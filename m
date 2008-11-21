Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L3Z4T-0001Po-2x
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 17:41:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L3Z1u-0007Ui-F4
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 16:38:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 16:38:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 16:38:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 21 Nov 2008 17:38:41 +0100
Message-ID: <gg6o6h$pqd$1@ger.gmane.org>
References: <gg6aes$5vf$1@ger.gmane.org>
	<4926D1D1.6030204@dresearch.de>	<gg6km4$c2d$1@ger.gmane.org>
	<1227284043.6981.3.camel@aquilonia>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <1227284043.6981.3.camel@aquilonia>
Sender: news <news@ger.gmane.org>
Subject: Re: Revert "busybox: Disable busybox shadow support for Angstrom"
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
X-List-Received-Date: Fri, 21 Nov 2008 16:41:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-11-08 17:14, Graeme Gregory wrote:
>>> 2. install /etc/shadow and fully support it (i believe ther is something more to do here)
>> 2) is what is wanted for the angstrom 2008 release.
>>
>> regards,
>>
>
> Yes it seems the devices we are using Angstrom on now are becoming more
> like laptops every day. So we should be following security procedures
> for big machines much more.
>
> I mean the latest set of omap3 devices are quite defineately eeePC
> competitors.

It's scary that something as big and fat like a standard ubuntu desktop 
is now a serious competitor in the omap3 space.
But regardless of that, shadow passwords and PAM give better security 
that is transaparent for the user, so if for images >8MB we can support 
things like shadow passwds, PAM, encrypted homedirs, etc.

regards,

KOen



