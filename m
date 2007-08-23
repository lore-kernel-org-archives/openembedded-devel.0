Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IOADj-0005gl-2L
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 12:47:23 +0200
Received: from pd953a869.dip0.t-ipconnect.de ([217.83.168.105]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>)
	id 1IOACZ-0003VX-3M; Thu, 23 Aug 2007 12:46:11 +0200
Message-ID: <46CD6554.6020405@klever.net>
Date: Thu, 23 Aug 2007 12:45:40 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.6 (X11/20070815)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, koen@dominion.kabel.utwente.nl
References: <E1IO9Sp-0000Q0-N9@linuxtogo.org>
	<46CD5C96.7010608@dominion.kabel.utwente.nl>
In-Reply-To: <46CD5C96.7010608@dominion.kabel.utwente.nl>
Subject: Re: [oe-commits] org.oe.dev fbreader: Add libiconv depencency
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
X-List-Received-Date: Thu, 23 Aug 2007 10:47:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Moreover,

http://bugs.openembedded.org/show_bug.cgi?id=2772

  ;-)

while we're at it. What would be the clean way to detect whether to pass 
  -liconv or not? Check staging dir for its presence?

Love,
H

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> florian commit schreef:
>> fbreader: Add libiconv depencency
> 
> AAAAAAAAAAAAAAAAAAAAAAARGH!!!!!
> 
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-July/002448.html
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> 
> iD8DBQFGzVyWMkyGM64RGpERAkd+AJkB3HtpH6NKUYPixG3ZX874cO/aZgCgqCcE
> 2Nh6gTLHTS5QFDbQF1dI+qM=
> =snzR
> -----END PGP SIGNATURE-----
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits


