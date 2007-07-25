Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1IDdxG-0001PE-Mx; Wed, 25 Jul 2007 12:18:54 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1IDe2j-0002FR-OJ; Wed, 25 Jul 2007 12:24:33 +0200
Message-ID: <46A7230E.6000707@kernelconcepts.de>
Date: Wed, 25 Jul 2007 12:16:46 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.12 (X11/20070604)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1IDL1e-0002ro-9i@linuxtogo.org>
	<46A60832.30203@dominion.kabel.utwente.nl>
In-Reply-To: <46A60832.30203@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.2.0
Cc: openembedded-devel@openembedded.org
Subject: Re: mtn disapprove d7758e2637918ff4035244d64fb7227f6cf833ad, was Re: [oe-commits] org.oe.dev phoneserver: Add patch for FIC GTA01	support.
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
X-List-Received-Date: Wed, 25 Jul 2007 10:18:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,


Koen Kooi schrieb:
> florian commit schreef:
> 
>> +PACKAGE_ARCH = "${MACHINE}"
> 
> This has to stop, OE is usable without setting MACHINE. The correct form is either
> 
> PACKAGE_ARCH = "${MACHINE_ARCH}"

thanks for the hint.

For these trivial changes that do not break much I would really like to see if
people do not disapprove    the whole patch but just go ahead and fix the
problem - that is way more productive.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


