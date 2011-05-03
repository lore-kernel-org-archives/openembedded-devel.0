Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QHHLj-0002mu-6m
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 17:17:19 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QHHJC-0006tG-ME from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 08:14:42 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 3 May 2011 08:14:42 -0700
Received: from [172.30.12.156] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Tue, 3 May 2011 08:14:42 -0700
Message-ID: <4DC01BD9.8000304@mentor.com>
Date: Tue, 3 May 2011 08:14:33 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <iplshp$vse$1@dough.gmane.org>
In-Reply-To: <iplshp$vse$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 03 May 2011 15:14:42.0502 (UTC)
	FILETIME=[D41F7660:01CC09A4]
Subject: Re: [2011.03-maintenance] Pull request #16
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
X-List-Received-Date: Tue, 03 May 2011 15:17:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/02/2011 02:12 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 5 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Jeff Lance (1):
>       am-benchmarks: add return values
> 
> Koen Kooi (3):
>       opencv 2.2: fix opencv-dev dependency chain
>       opencv 2.2: include actual headers in the -dev package
>       linux-omap-psp 2.6.32: add support for 5MP camera board
> 
> Michael 'Mickey' Lauer (1):
>       qt4-embedded: enable support for the built-in LinuxInput keyboard
> 
> Philip Balister (1):
>       uhd : Update to latest release. Both source and fpga images.
> 
> These are all cherry-picks from .dev.

(Aside: I'm going to start giving all pull requests a day or so to
settle before I pull them, to make sure anyone that wants to comment on
them can, wiki updated).

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNwBvTAAoJEI4NMjfc3nJx+NEH/RDRNg4b1z96nllxsfTODM35
Drz5a1UDonygY6dUQkakeiC40TJ+mYhK+4jQ4UsoUPvgLmjy0cjWAH2uetSyIhF6
xuRUerZAwdhBjKAS0qboUtVfQa7qID8L9EGFdODWomZO4XSoYfBdPrCd8zgzFi2q
tx99iKDzsrijIO87WPJ7mJFIIzsbavbNwH2uaz7HY51bWUT+StcmXTV/RlGz/tJd
BJ5N/Q0l4T9ozvk3yVoUobidXqLDxxqFK+whPrqZOVFr/m8X69xFbg19gLMZt1qS
deUl7bt8zLttlV3Pc1WTN8GBeW21vF28eFYTdAhuei3yG4mKun1fpiV7OtI2nRs=
=FSpy
-----END PGP SIGNATURE-----


