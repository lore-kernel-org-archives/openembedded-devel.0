Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzAPg-0000MB-VI
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 17:14:33 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PzAO5-00000f-Ii from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 09:12:53 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 09:12:49 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 09:12:48 -0700
Message-ID: <4D7E3E72.7000605@mentor.com>
Date: Mon, 14 Mar 2011 09:12:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <ill7r3$j5u$1@dough.gmane.org>
In-Reply-To: <ill7r3$j5u$1@dough.gmane.org>
X-OriginalArrivalTime: 14 Mar 2011 16:12:49.0086 (UTC)
	FILETIME=[A9A275E0:01CBE262]
Subject: Re: [2011.03-maintenance] Pull request #2
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
X-List-Received-Date: Mon, 14 Mar 2011 16:14:33 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2011 07:13 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Tom,
>
> Please pull the 3 commits from here:
>
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
>
> Koen Kooi (3):
>        angstrom: name release after branch
>        angstrom contrib: use proper release version on webserver
>        angstrom-version: catch up with release changes in parent commits
>
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
>
> These aren't backports, but distro version housekeeping. The necessary
> symlinks have already been made on the feed servers, so there is no
> impact for existing users, except for getting less confused by the
> versions reported.
>
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNfiKjMkyGM64RGpERAsosAJ9Bj+BnhFTikyuYTX9JPB/IPNHQXQCfd5Tt
> b0FgqARbKJDrCdPhCESUFck=
> =9Zgj
> -----END PGP SIGNATURE-----

Applied, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


