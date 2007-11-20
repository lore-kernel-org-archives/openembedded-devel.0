Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Iucwg-0000f2-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 00:55:59 +0100
Received: from [78.48.36.226] (helo=[192.168.1.6])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1IuchZ-0005DG-9Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 00:40:21 +0100
Message-ID: <47436BA4.1040104@kernelconcepts.de>
Date: Wed, 21 Nov 2007 00:20:04 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>
	<4742AFCC.1060000@student.utwente.nl>
In-Reply-To: <4742AFCC.1060000@student.utwente.nl>
X-Enigmail-Version: 0.95.0
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 23:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

HiKoen Kooi schrieb:
> No need for seperate build areas. If you use angstrom you can even
> switch C library ([e]glibc vs uclibc), as outlined in
> http://www.angstrom-distribution.org/building-angstrom
> You can even have per distro tweaks using include statements, but I'll
> leave that as an exercise to the reader. No need for seperate build
> areas. At all.

as soon as you are working with multiple builds in parallel or you want to
specify versions you need multiple build directories.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


