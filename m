Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q61iO-0007OZ-Ti
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 16:22:13 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q61gO-0001KI-BN from Tom_Rini@mentor.com ;
	Sat, 02 Apr 2011 07:20:08 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sat, 2 Apr 2011 07:18:20 -0700
Received: from [172.30.80.69] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1; Sat, 2 Apr 2011 07:20:06 -0700
Message-ID: <4D97308E.2080309@mentor.com>
Date: Sat, 2 Apr 2011 07:19:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <20110402003223.GA4182@denix.org>
In-Reply-To: <20110402003223.GA4182@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 02 Apr 2011 14:18:20.0584 (UTC)
	FILETIME=[D1897A80:01CBF140]
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for TI edma3lld-sysbios, cgt6x and beagle u-boot changes
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
X-List-Received-Date: Sat, 02 Apr 2011 14:22:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/01/2011 05:32 PM, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull these 5 commits for TI related changes - edma3lld-sysbios mods,
> new cgt6x version and u-boot change for beagleboard xM-C.
> All are cherry picked from oe.dev
> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlzCHAAoJEI4NMjfc3nJxv3YH/RzMyIA1VLbj/ckTb+rwxHsy
HZZIMmXduO7rK+goAAcbW7ltUIE3C7XJeo5fIMHtFRHgJuwn2l7zJ8RRWzkgbyxW
eGq2nTN94p8ZOa3V96EAlXrwz/hOS0cKr2X+qThh8MFXufQiq/5UUOgpY2dqGoWp
xlhl69yLW/9QyTYbdAGAPdAxCknfypN4h0zIpjIeKPDFNVmNm15kmqy+RWFVGh7A
/ACGyHU5URWrsOsyahhJxNmCVOarZLaOWJ9UKSmPchwK+xFY9qVuV+/xN1gfTURO
Il4z1nVlkN9qS7WvV811ABZlZ8zRcynN6B6W48JNcATHWjKcXJVGge8wFBCczJU=
=XRmI
-----END PGP SIGNATURE-----


