Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HTwKZ-0003No-Vp
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2007 09:38:04 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1HTwa0-0004yj-8s
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2007 09:54:00 +0100
Message-ID: <4600EED5.6020400@kernelconcepts.de>
Date: Wed, 21 Mar 2007 09:37:41 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HTlXW-0008Tg-CR@linuxtogo.org>
	<460053D9.8020008@dominion.kabel.utwente.nl>
In-Reply-To: <460053D9.8020008@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.0.0
Subject: Re: [oe-commits] org.oe.dev angstrom-e: add e-image and tasks for angstrom
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
X-List-Received-Date: Wed, 21 Mar 2007 08:38:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:
> justinp commit schreef:
>>> angstrom-e: add e-image and tasks for angstrom
> 
> And we were trying to stop using deprecated stuff (e.g. gpe-bootsplash) and move them out
> of packages/angstrom/ ....

Wouldn't this be a reason to fix these packages instead of deleting them? We
even have a pile of packages that do not even work and that are not removed.

But anyway why is gpe-bootsplash deprecated?

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


