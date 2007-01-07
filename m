Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H3ci8-0008SE-T3
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 19:25:36 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l07INvox007785 for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jan 2007 19:24:00 +0100
Message-ID: <45A13ABB.4030705@dominion.kabel.utwente.nl>
Date: Sun, 07 Jan 2007 19:23:55 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <781416379.20070107183215@vanille-media.de>
In-Reply-To: <781416379.20070107183215@vanille-media.de>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: OpenAlchemy ready to be included in OE
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
X-List-Received-Date: Sun, 07 Jan 2007 18:25:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> Cheers devels,
> 
> since a couple of months I knew that the Alchemy user interface would
> become open source in the near future. Having seen this UI and its
> applications on a relatively low power hardware I was very impressed
> about the speed and efficiency. I think this UI could be a strong
> contender for Opie and GPE on the handheld-type devices OE supports.
> 
> http://openalchemy.org/pipermail/openalchemy-general/2007-January/000005.html
> indicates that there is now a public SVN. It'd be cool if anyone of
> you guys could have a go at adding OpenAlchemy to OE. I'd do it
> myself, but you know... pretty busy with other important things that
> need to get done soon :)

The configure.in files are littered with:

if test "$host" != arm-linux-gnu -a "$host_alias" != arm-linux-gnu; then
 <foo>
else
 <bar>
fi

That doesn't instill much confidence :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFoTq7MkyGM64RGpERAqkRAJ9W3sozJsy6cezCsfvo+4EtzNUnZwCfRmux
9Y4XNBCIgQV+ENGtCwJkiQE=
=++Sm
-----END PGP SIGNATURE-----


