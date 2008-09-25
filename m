Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KioxH-0001Sq-GO
	for openembedded-devel@openembedded.org; Thu, 25 Sep 2008 13:24:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kiotg-0001UW-W2
	for openembedded-devel@openembedded.org; Thu, 25 Sep 2008 11:20:37 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 25 Sep 2008 11:20:36 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 25 Sep 2008 11:20:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Sep 2008 13:20:29 +0200
Message-ID: <gbfs5t$umt$1@ger.gmane.org>
References: <20080923110049.B007318806A@amethyst.openembedded.net>	<48D8D5B3.8010708@gmx.de>
	<gbalaq$39s$1@ger.gmane.org>
	<d1b08f940809250312h35eaa66cv2b1a9ec7856994d4@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <d1b08f940809250312h35eaa66cv2b1a9ec7856994d4@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] : zaurus-2.6.inc: a string always is true, so test for the contents of it
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
X-List-Received-Date: Thu, 25 Sep 2008 11:24:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
>> I did not test that yet, since I want to get a 'normal' boot working first
>> on this&*$@*$(@ c700.
>
> You mean even the normal zImage kernel does not boot?

It boots, but the c7x0 machine in OE suffered from massive bitrot. I am 
now able to use installkits built with OE, but the c700 locks up hard 
after a minute or 2.

regards,

Koen

> One user reported this to me about zImage-kexecboot on SL-C700:
>
> /*
> To my knowledge, it does not reboot. It says "Rebooting the system..."
> and then nothing happens. When I do a full power cycle (battery
> removal because it ignores the battery switch), I just get a dark
> screen and nothing indicating that it is in some sort of boot process.
>
> So, no, I don't see a boot menu.
>
> I'm betting that this is based on a difference between the C700 and the C860.
> */




