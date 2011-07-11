Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QgHjT-0001V1-Cf
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 16:45:15 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QgHfe-0001ln-CQ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 07:41:14 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 11 Jul 2011 07:41:14 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 11 Jul 2011 07:41:13 -0700
Message-ID: <4E1B0B75.2050201@mentor.com>
Date: Mon, 11 Jul 2011 07:40:53 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
	<iv97gr$d22$2@dough.gmane.org>
In-Reply-To: <iv97gr$d22$2@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 11 Jul 2011 14:41:14.0236 (UTC)
	FILETIME=[959B23C0:01CC3FD8]
Subject: Re: [2011.03-maintenance] Re: [PATCH] pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03
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
X-List-Received-Date: Mon, 11 Jul 2011 14:45:15 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/09/2011 02:37 AM, Koen Kooi wrote:
> Op 09-07-11 02:21, Joel A Fernandes schreef:
>> This fixes all the issues noticed earlier with pulseaudio 0.9.15: *
>> Pulseaudio keeping audio devices busy when run as per-user instance *
>> Failure of pactl, pacmd etc to connect to the pulseaudio server
> 
>> Signed-off-by: Joel A Fernandes
>> <agnel.joel@gmail.com>
> 
> Acked-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> Tom, do you want to take this directly or should I do a pull request
> with this in it?

I was going to grab this Sunday but got distracted.  I see you put it in
your current request, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOGwtrAAoJEI4NMjfc3nJxMqUH/jl0RRrar1O+W6xfBNWYpwOu
1ws4Dht+RpCjiv2arS/4cBsTpzAD+l/AhkOVR4oHRoeXoMwrOQ8OAN7YG5BjqCFR
XrDY4ZSxxECLZSWzsaRIOz8JuBO4R9d7F5C8/IuLc0arXX6nsDdTDQV7ClrRmqxG
2JpG4D1w/YDhiehyWJ6yTRvq9d1nfXaRo8PskdsDirX9wNzS5spad7ovyABOlNxe
6PmU0R4ypTUSkXDSd/3sSXLhufQ3JXoLKeDeSv0mqPI3ztXRNgNDDox1H8jL6A5D
5noz7liM31MOvbhDTFzQiu3qKylVCtPiChK/hA+9hI04OSQDrxd44J7e7xLHR5M=
=lBGp
-----END PGP SIGNATURE-----


