Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1Gjxpm-0003IH-CQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 13:56:14 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1GjyJa-0000hP-78
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 14:27:02 +0100
Message-ID: <4559BC71.6050506@kernelconcepts.de>
Date: Tue, 14 Nov 2006 13:54:09 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
Organization: kernel concepts
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45566FBC.1030206@kernelconcepts.de>	<45586AF5.8060800@kernelconcepts.de>	<45589A63.9030808@kernelconcepts.de>	<200611131725.11432.openembedded@hrw.one.pl>	<4558B5D3.2090609@kernelconcepts.de>
	<4558DA84.5030003@dominion.kabel.utwente.nl>
In-Reply-To: <4558DA84.5030003@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.0.0
Subject: Re: ARM EABI SDK build
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
X-List-Received-Date: Tue, 14 Nov 2006 12:56:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> Nils Faerber schreef:
>>> OK, that was indeed fixed.
>>> But I still have the problem that gcc-cross-sdk-4.1.1 fails to compile
>>> due to problems with sys/types.h
>>> This is really strange since this originates from glibc.
>>> Koen: Didn't you build an EABI-softfloat toolchain already?
> Riku did:
> http://dominion.kabel.utwente.nl/koen/cms/using-openembedded-toolchains-in-scratchbox

Hmm... the hpowto does not help much since it does not mention which
distribution he used or how his local.conf looked like...

> regards,
> Koen
Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--


