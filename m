Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QUNlE-0004Dx-6w
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 20:45:48 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QUNi1-0001Ex-70 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 11:42:29 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 8 Jun 2011 11:42:28 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 8 Jun 2011 11:42:28 -0700
Message-ID: <4DEFC28F.70002@mentor.com>
Date: Wed, 8 Jun 2011 11:42:23 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <iskpst$avh$1@dough.gmane.org>
In-Reply-To: <iskpst$avh$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Jun 2011 18:42:28.0472 (UTC)
	FILETIME=[D14A8780:01CC260B]
Subject: Re: [2011.03-maintenance] Pull request #20
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
X-List-Received-Date: Wed, 08 Jun 2011 18:45:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/07/2011 02:09 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 9 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Chris Larson (4):
>       sourceipk: allow override of the section
>       sourceipk: use tar to get the files copied, rather than cp
>       sourceipk: deal with compileconfigs only when it exists
>       sourceipk: exclude temp dirs when S == WORKDIR
> 
> Koen Kooi (3):
>       linux-omap 2.6.39: sync with meta-texasinstruments for bootup fixe
>       linux-omap 2.6.39: sync with meta-texasinstruments again
>       libxaw: fix depchains
> 
> These are all cherry-picks from .dev

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN78KJAAoJEI4NMjfc3nJxLAMH/iiHpFT5Pc4USkFKFbNBSq8d
YMnF6yezFfrp3PcceB1tM9gPRaQYN6s1JhKTtXFVxEeZ2i9ZUhrFiIP/Kxta0G0V
Z99IqCjMV7KF9uvQTYat7xCKHOgkId5V19/wHJOX/BQrZxAw8VmM8RqeKxOAM1Jt
S6obYnKCMg1GHQO7daauP6xBmbgLTdea9gCj8wdoKsVAi4F2NyZAD80+HQ2yZHx+
OSXVzbsQ9N2vpyodxO7RS6AVFlV7nsUfK7fBN6gZCejxrMPX4FxfwIgrkdrFWUdB
N0cpcXPYgmxjRZa3Swdg1I4bwhBYvsWRqzAYph8sWshBYGLqOzPxyH5QFrYGvNo=
=NjJe
-----END PGP SIGNATURE-----


