Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H29Hk-0001Jw-Vb
	for openembedded-devel@openembedded.org; Wed, 03 Jan 2007 17:48:17 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l03GkpLr025117; Wed, 3 Jan 2007 17:46:51 +0100
Message-ID: <459BDDF9.3080001@dominion.kabel.utwente.nl>
Date: Wed, 03 Jan 2007 17:46:49 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: angstrom-distro-devel@linuxtogo.org
References: <200701031425.00509.openembedded@hrw.one.pl>
In-Reply-To: <200701031425.00509.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: openembedded-devel@openembedded.org
Subject: Re: [Angstrom-devel] Results of my mass build of all OE targets for Angstrom
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
X-List-Received-Date: Wed, 03 Jan 2007 16:48:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Before X-mas break I started one big build running on build machine offered 
> to me by CELF. It was build of 'task-base' (ALL machines) 
> and 'bootstrap-image' (most of machines - building them now) for ALL OE 
> machines and Angstrom-2007.1 distribution.

Thanks for doing this. One small niggle: 'bootstrap-image' is unsupported by angstrom.
Right not only 'angstrom-bootstrap-image' and 'angstrom-gpe-image' (soon to be replaced
with angstrom-x11-base-image) are supported.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFm934MkyGM64RGpERAlawAJ9RlBeMqdlLIq9/i+FPSr1w1skI+ACbBxob
t6o8zFwkmZ3IYv9dfQsZWGU=
=h5Ym
-----END PGP SIGNATURE-----


