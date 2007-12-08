Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J0vDf-0000iD-8F
	for openembedded-devel@openembedded.org; Sat, 08 Dec 2007 09:39:31 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB88ZViq029744 for <openembedded-devel@lists.openembedded.org>;
	Sat, 8 Dec 2007 09:35:32 +0100
Message-ID: <475A5753.3020601@student.utwente.nl>
Date: Sat, 08 Dec 2007 09:35:31 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47594E40.2090201@student.utwente.nl>
	<841689643.20071207232147@gmail.com>
In-Reply-To: <841689643.20071207232147@gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [Angstrom-devel] RFC: ipv6 support in angstrom
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
X-List-Received-Date: Sat, 08 Dec 2007 08:39:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Friday, December 7, 2007, 3:44:32 PM, you wrote:
> 
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
> 
>> The following RFC was accepted by all angstrom developers, so moving it
>> to OE now:
> 
> 
>> I want to propose the following:
> 
>> * enabling the ipv6 kernel module on all network capable devices
>> angstrom wants to support.
>> * enabling the mip6 kernel module on capable kernels (afaik vanilla
>> 2.6.23 or patches 2.6.x)
>> * have ipv6 support enabled in the c library and busybox
> 
>> Some machines already do all this, but afaik we don't have a policy for
>> it yet.
> 
>   Just one note - ipv6 is set for autoload in kernel.bbclass, not sure
> this is good idea for such circumstances.

That doesn't matter, since the kernel-module won't be shipped by
default, only enabled in the defconfig.

regards,

Koen


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHWldSMkyGM64RGpERAi41AJ4tUq308n5ofk7agjZZ+pNu3Q/dwgCgikEI
MpjPBM01kSWv4LkjWtGLZqU=
=Gbwi
-----END PGP SIGNATURE-----


