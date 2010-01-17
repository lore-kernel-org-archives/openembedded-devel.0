Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NWT10-0000D7-0B for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:09:57 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NWSyq-0001fV-Jn
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:07:40 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 12:07:40 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 12:07:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 Jan 2010 12:07:19 +0100
Message-ID: <hiur16$olo$1@ger.gmane.org>
References: <alpine.LFD.2.00.1001170417380.4070@localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <alpine.LFD.2.00.1001170417380.4070@localhost>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: x-loader tarball in OE dev repo
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
X-List-Received-Date: Sun, 17 Jan 2010 11:09:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-01-10 10:19, Robert P. J. Day wrote:
> 
> $ git log recipes/x-load/files/x-loader-03.00.00.01.tar.gz
> commit 7937ed35de6218a955a63d9ce61d992532fdc5e0
> Author: Koen Kooi <k-kooi@ti.com>
> Date:   Wed Sep 9 12:27:50 2009 +0200
> 
>     x-load: add omap3517-evm support
> 
>     * 1.41 still has the volatile bugs when compiled with non CSL stuff
> 
> $
> 
>   is the appropriate x-loader source not downloadable from somewhere?

Internal TI clearcase doesn't qualify as "somewhere", would it? We're
working on getting a git tree available externally, but for the time
being it's freely availably from the 'net.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLUu9nMkyGM64RGpERAmp7AJ99GF/Bx4pJ/aSZD8yfvvTM6ZBLrQCcCUaZ
EKi5ZvVfddXjYoTIvFs+dCE=
=tRXn
-----END PGP SIGNATURE-----



