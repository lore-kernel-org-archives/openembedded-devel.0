Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Om1VH-00071H-1G
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 11:33:43 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Om1ag-0003Q9-8I
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 11:39:18 +0200
Message-ID: <4C6CFA65.3000604@kernelconcepts.de>
Date: Thu, 19 Aug 2010 11:33:25 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
In-Reply-To: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev
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
X-List-Received-Date: Thu, 19 Aug 2010 09:33:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Cliff Brake schrieb:
>> So something like Debian's stable, testing and unstable[1]?
> 
> That sounds good to me -- so how about org.openembedded.dev and
> org.openembedded.testing branches?

great to see this finally happen, I remember we discussed this years ago.

> I'll plan to start doing a clean build of dev every Monday for the
> Beagleboard, and then merge to testing once it builds.  Initial
> targets:
> 
> Angstrom Distro
> beagleboard/beagleboard-linuxtag2010-demo-image
> x86/minimal-image

I would start to make use of it right now. Starting with builds for armv6 and
armv4t. I would use a different distribution (minimal maybe) for one of the
builds at least to see how this behaves.

> My workstation runs a 64-bit OS, so that is probably worst case
> (compared to i686).

Did you ever build on a PowerPC? :-)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


