Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q77VJ-0002nD-Cl
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 16:45:13 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q77TG-0000AZ-Dy from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 07:43:06 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 5 Apr 2011 07:41:03 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 5 Apr 2011 07:43:05 -0700
Message-ID: <4D9B2A72.1030703@mentor.com>
Date: Tue, 5 Apr 2011 07:42:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <inerpl$g3o$2@dough.gmane.org>
In-Reply-To: <inerpl$g3o$2@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 05 Apr 2011 14:41:03.0146 (UTC)
	FILETIME=[7CED30A0:01CBF39F]
Subject: Re: [2011.03-maintenance] Pull request #12
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
X-List-Received-Date: Tue, 05 Apr 2011 14:45:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/05/2011 03:44 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 4 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Koen Kooi (4):
>       networkmanager git: bump to 0.8.3.999
>       network-manager-applet git: move to 0.8.3.999
>       angstrom: remove networkmanager pinnings
>       angstrom 2011.03: remove networkmanager pinnings
> 
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
> 
> The first 3 are straight cherry-picks, the 4th one is a change to the
> angstrom 2011.03 file that is gone from .dev.
> 
> Runtime tested on hawkboard/angstrom and beagleboard/angstrom

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNmyptAAoJEI4NMjfc3nJxlmAH/iyFKssNIpo2JnfRQ976qK8l
zPYew8++bdDKhAgKdfHUe44pevFBa8VtCUCjaWUOEAZDTcTYSp9jhRLq19zh8FbF
jCgk11aVs64mvUSjqbzuAW2YpxnK/tIXRabWNmLbl6xFQQXtiXNbbRvW6DHQZI1L
h/css9OuV2Iy98FMkd/GgYwQyVVMvVmd/YW4IyAPmYKeWRkFB/pQ5vbtggNRmxrq
0HxSbE9tg0feP8/XqBRF+HMondC72/i68lvDRA9tzPYsuwNcNvbLFk7Y2D3G3tol
/OlZuqBYx8rtHTP1U1pMjtG+nviLpquF749/IM+AYxZL/krH5qYZ7HLmgYO3l1M=
=MXJS
-----END PGP SIGNATURE-----


