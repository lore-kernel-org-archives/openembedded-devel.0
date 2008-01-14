Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JENNu-0003Lr-EP
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2008 12:21:42 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JENmu-0005PE-GV
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2008 12:47:32 +0100
Message-ID: <478B45A8.906@kernelconcepts.de>
Date: Mon, 14 Jan 2008 12:21:12 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47871C71.5020800@student.utwente.nl>	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>	<fm86uh$qa8$1@ger.gmane.org>	<fm8dm0$ikl$1@ger.gmane.org>	<4787C194.4060907@student.utwente.nl>	<fm8g7r$r27$1@ger.gmane.org>	<1200093760.6074.2.camel@HD>	<fma5d5$5k5$1@ger.gmane.org>	<1200229756.6056.4.camel@HD>
	<fmd9ej$nt$1@ger.gmane.org> <478A3CA8.6000705@student.utwente.nl>
In-Reply-To: <478A3CA8.6000705@student.utwente.nl>
X-Enigmail-Version: 0.95.0
Subject: Re: mtn disapprove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2008 11:21:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:

> I suspect spamassassin.

I don't think so. It is installed on the box but is not hooked up into the mail
system.

> | From the commit message
> |
> | conf/machine/: fix configuration for Strongarm devices
> | * replace erroneous TARGET_CC_ARCH line optimising for xscale instead of
> |   strongarm
> | * remove inclusion of tune-strongarm.inc from collie.conf and replace it
> |   with the correct TARGET_CC_ARCH.  Collie is the only Strongarm 1110
> |   device in OE and thus needs special treatment
> 
> Is it? Wikipedia[2] Tells a different story, and AFAIK simpad and
> htcwallaby are sa1110 as well.

Yes right, same for all iPAQ h36xx, h37xx and h38xx and some Jornada models.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


