Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JY1I1-0004GS-NI
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Mar 2008 16:48:51 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JY1lR-0007o6-M0
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Mar 2008 17:19:13 +0100
Message-ID: <47D2B500.4040709@kernelconcepts.de>
Date: Sat, 08 Mar 2008 16:47:12 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1204740661.8110.135.camel@dax.rpnet.com>	<c384c5ea0803051106he199460k7c9eaf232977e564@mail.gmail.com>	<1204748655.8110.174.camel@dax.rpnet.com>
	<47D1C285.2000703@gmail.com>
In-Reply-To: <47D1C285.2000703@gmail.com>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sdk.bbclass and gcc-cross-sdk
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
X-List-Received-Date: Sat, 08 Mar 2008 15:48:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Esben Haabendal schrieb:

> I would love to see canadian cross support in OE. It would save me the 
> effort maintaining an OE hacked up to build a standard meta-toolchain 
> target.

that would be a good feature. It might be useful for solving a similar situation
I ran into several times: Building more compatible toolchains. This solution
could be used to build a toolchain that runs on multiple distributions without
the need to choose a particular distribution on the build machine.

> If there is interest in it, I wouldn't mind working on this issue.  And 
> if I am the only one interested in it, I might want to do it anyway. 
> Just for fun :-)

I'm quite sure that there are quite some people out there who would appreciate
this. These poor guys who have to develop for Linux devices using Windows just
come to my mind - I guess they would love to see others building shiny new
crosstoolchains for their Windows :-)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


