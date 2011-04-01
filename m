Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5g25-0002PG-1e
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 17:13:05 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5g09-0005Rj-AC from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 08:11:05 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 1 Apr 2011 08:11:04 -0700
Received: from [172.30.80.69] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1; Fri, 1 Apr 2011 08:11:03 -0700
Message-ID: <4D95EB06.2060906@mentor.com>
Date: Fri, 1 Apr 2011 08:11:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <in4ph2$ru6$1@dough.gmane.org>
In-Reply-To: <in4ph2$ru6$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Apr 2011 15:11:04.0554 (UTC)
	FILETIME=[04FF3CA0:01CBF07F]
Subject: Re: [2011.03-maintenance] Pull request #11
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
X-List-Received-Date: Fri, 01 Apr 2011 15:13:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/01/2011 08:04 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 4 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
> 
> Tom Rini (4):
>       tcl: Rework mips-tclstrtod.patch
>       tcl: Switch to patchdir rather than applying in do_configure
>       tk 8.4.19: Rework disable-xim.patch
>       tk 8.4.19: Switch to patchdir rather than applying in do_configure
> 
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlesCAAoJEI4NMjfc3nJxEg8H/2TqcABrpuaa1bB7amrAnZDl
zLHkNX7s1m6TzSS1sMtIF8mGdgkDHa3YE0gwt0NmHjvQy32DclgUtylMQCUDVsY3
COoiFg/HKsrk/Tmabh04XnZeSDyp5xDUJjzpp8kbq5syer1BgY8cQ56k6EwHBPPt
vOw7HojtVNbKYZlEkoIW75d8Chorh7Ipx6I/f+MoATKDedFDtCa68EmSgMChVDxu
Fa3iLvwMoGnFJ0BBO14gSQX5PY1oY7HHbPGwD6uUd2E5fEm/l6RrVmRUMZKqBGr3
7/3FM0D/OeddTe1tWolfCqQBjV7nfE08bxX9BEuVzHHqLPkAs8MVEJm60c4z+v8=
=hkT3
-----END PGP SIGNATURE-----


