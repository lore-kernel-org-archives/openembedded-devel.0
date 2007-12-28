Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J8C8h-0003HD-JO
	for openembedded-devel@openembedded.org; Fri, 28 Dec 2007 11:08:27 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBSA2I0k026726; Fri, 28 Dec 2007 11:02:18 +0100
Message-ID: <4774C9AA.8050705@student.utwente.nl>
Date: Fri, 28 Dec 2007 11:02:18 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>, angstrom-distro-devel@linuxtogo.org
References: <4774C182.20501@gmail.com>
In-Reply-To: <4774C182.20501@gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [Angstrom-devel] Tosa kernel bloat
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
X-List-Received-Date: Fri, 28 Dec 2007 10:08:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Junqian Gordon Xu schreef:
> Tosa kernel is bloated with the recent patch and change to defconfig-tosa
> 
> |`/home/gordon/oe/build/tmp/work/tosa-angstrom-linux-gnueabi/linux-rp-2.6.23-r14/linux-2.6.23'
> | Size is 1296464
> | FATAL: This kernel is too big for your PXA Zaurus and will destroy 
> data if you flash it. Please reduce the size of the kernel by making 
> more of it modular.
> 
> Anybody else experience this? I guess kernel size below 1280000 is ok? 
> I'm not sure where I should look to trim it down?

Is that also the case in the angstrom stable branch?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHdMmqMkyGM64RGpERApOTAJwJS0aNs5EWEAfAzZDg/ysIcmbrjACfXYAg
twGk159NAGv4UuScqp1pid0=
=e/cH
-----END PGP SIGNATURE-----


