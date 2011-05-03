Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHGef-0004ta-Mv for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 16:32:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHGc9-0004Vq-4L for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 16:30:13 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 16:30:13 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 16:30:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 May 2011 16:29:59 +0200
Message-ID: <ipp3h7$mvb$1@dough.gmane.org>
References: <4DBFC26B.2090006@gmx.net> <ipoo3s$h7c$1@dough.gmane.org>
	<4DC00670.6080601@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DC00670.6080601@gmx.net>
X-Enigmail-Version: 1.0.1
Subject: Re: arduino IDE on beagleboard
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
X-List-Received-Date: Tue, 03 May 2011 14:32:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-05-11 15:43, Robert Schuster wrote:
> Hi,
> 
> Am 03.05.2011 13:15, schrieb Koen Kooi:
>> First you have to fix the included rxtx install:
>> http://dominion.thruhere.net/koen/cms/making-processing-arduino-ide-replicaorg-work-on-arm
> Yep, same story as on an amd64 machine. :)
> 
>>> Could you upload programs to the
>>> arduino and receive stuff through the serial port?
>>
>> That works, and if you download and untar:
>>
>> http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-binutils-2.21.tar.bz2
>> http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-gcc-4.5.2.tar.bz2
>> http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-libc-1.7.1.tar.bz2
> How did you build those? Directly on a BB using gcc? I looked into
> making recipes for OE for this
> but my toolchain-foo is way to small for this.

I built those natively on my beagle, that was faster than figuring out
canadian cross in OE :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNwBFnMkyGM64RGpERAq47AKCWLZ3hCjVSlM/3vMn1Amc+INd/KgCfTcJP
fv7h7p3wQKIsEPxvk8xSFGI=
=yiNr
-----END PGP SIGNATURE-----



