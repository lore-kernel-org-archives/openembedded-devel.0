Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JICH0-0006fq-Oo
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2008 01:18:22 +0100
Received: from [78.48.68.35] (helo=[192.168.1.152])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JIChh-0003vF-Ic
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2008 01:45:57 +0100
Message-ID: <47992AD2.7040805@kernelconcepts.de>
Date: Fri, 25 Jan 2008 01:18:26 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <47977B09.2060107@dominion.kabel.utwente.nl>
In-Reply-To: <47977B09.2060107@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.0
Subject: Re: AVR32 branch merged
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
X-List-Received-Date: Fri, 25 Jan 2008 00:18:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi wrote:
> The avr32 branch Stelios and I have worked on for the past year or so
> has been merged to .dev.

cool - that's great news. Many thanks to you guys!

> Known problems:
> 
> ~ * kernel fails to link (workaround: use ld from atmel binary toolchain)

Uh nasty, we do not have the sources of that toolchain, right?

> This merge includes an avr32 optimized mplayer and a patched
> xserver-kdrive for people with an lcd attached to their avr32 boards.

Even better, I guess its time to get my LCD working :)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76





