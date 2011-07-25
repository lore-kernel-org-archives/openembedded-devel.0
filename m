Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlOQU-0001Hs-5Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 18:54:42 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QlOA0-0002rv-4w from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jul 2011 09:37:40 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Jul 2011 09:37:39 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 25 Jul 2011 09:37:39 -0700
Message-ID: <4E2D9BD1.4040206@mentor.com>
Date: Mon, 25 Jul 2011 09:37:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <j0gpgh$97a$1@dough.gmane.org>
In-Reply-To: <j0gpgh$97a$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Jul 2011 16:37:39.0961 (UTC)
	FILETIME=[2B34AE90:01CC4AE9]
Subject: Re: [2011.03-maintenance] Pull request #23
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
X-List-Received-Date: Mon, 25 Jul 2011 16:54:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/24/2011 02:43 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 2 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Khem Raj (1):
>       gcc: Package libstdc++ gdb python helpers into dev package
> 
> Koen Kooi (1):
>       pulseaudio: make it work out of the box * reuse 'audio' group as access group
> 
> 2 cherry-picks from .dev

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOLZvMAAoJEI4NMjfc3nJxhPoIAKQF8TPczT9x5IHmumaBT/RM
R+E4PyhPsC2OyIcEJQAuDL64Ucbr4hffxflOaQJWVljs/w7sqeOfxeD8jzVDzd1t
Yp84p9k2+Kw4xd26zAkyg6Ugy1DAKJYJRQMQpMHrsIXs9Vvho9TIJLxaVcjBv1H7
RIgGOUadbyt1gVSUeO+5kGf1LP8meayfirr0ITGNwNW6OV4jhNwaFfq5HWTWjn4o
18oOhgwzPS/LRA19pmbv8Nqlo2BoAuEBsfLEybIFI03Djr7VSOf1Vv5KZmhgxGGs
m3oVDennTIpuaRl2st6PpdLwXjA422Rsfa4KMZrihtXT4qtqueVp0Rrq5i1edX8=
=FepC
-----END PGP SIGNATURE-----


