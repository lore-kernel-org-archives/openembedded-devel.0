Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hfu4R-0007Ox-Of
	for openembedded-devel@openembedded.org; Mon, 23 Apr 2007 10:38:53 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3N7xeLr005371; Mon, 23 Apr 2007 09:59:40 +0200
Message-ID: <462C676C.3070305@dominion.kabel.utwente.nl>
Date: Mon, 23 Apr 2007 09:59:40 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1597775703.20070405182752@gmail.com>	<46156BCD.6060407@whitby.id.au>
	<02429232.20070410152736@gmail.com>	<461C85D6.1010105@whitby.id.au>
	<1363913311.20070423101551@gmail.com>
In-Reply-To: <1363913311.20070423101551@gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [RFC] Adding sanity to OE startup process
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2007 08:38:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:

>         Also, confirmed that file log rotation works at least with
> busybox 1.2.1. Cleaned up syslogd.conf fixed to not contain confusing
> statements this is not supported, committed. Koen, what do you think
> about switching Angstrom's default setting to /var/log/messages after
> this, to make it easier for non-busybox people? After all, main
> trouble with file logging is now fixed - it cannot grow unlimited in
> size.

Sounds ok to me.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGLGdrMkyGM64RGpERAkElAJ9RHcBJaaY9CKMRE1jeGyrswP+x8wCgn6xk
I4VGuh+YvrpQGCKlOaT/ufA=
=Msq4
-----END PGP SIGNATURE-----


