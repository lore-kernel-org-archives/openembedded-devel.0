Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KK7NB-0003Sm-EY
	for openembedded-devel@openembedded.org; Sat, 19 Jul 2008 10:00:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KK7MF-0004Ao-WE
	for openembedded-devel@openembedded.org; Sat, 19 Jul 2008 08:00:00 +0000
Received: from host86-132-148-182.range86-132.btcentralplus.com
	([86.132.148.182]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 19 Jul 2008 07:59:59 +0000
Received: from k.kooi by host86-132-148-182.range86-132.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 19 Jul 2008 07:59:59 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 19 Jul 2008 08:59:49 +0100
Message-ID: <g5s6tl$446$1@ger.gmane.org>
References: <48818A99.2030303@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: host86-132-148-182.range86-132.btcentralplus.com
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <48818A99.2030303@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Working image for AVR32?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 19 Jul 2008 08:00:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> I tried Angstrom/gpe-image and then base-image.
> First with TARGET_OS="linux" and then "linux-uclibc".
>
> It hangs in the glibc do_configure.
>
> What is the best DISTRO/image combination for the AVR32?

DISTRO=angstrom-2008.1 ANGSTROM_MODE=uclibc bitbake foo


>
> BR
> Ulf Samuelsson
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.4-svn0 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iD8DBQFIgYqYAyRRH5cXxqwRAmwIAJ9bV1UYYFMux+WfZ8FqLl/jlR/l3wCfRr5c
> +A2QxRmN4NfP9+td6DJGBFI=
> =KtDZ
> -----END PGP SIGNATURE-----




