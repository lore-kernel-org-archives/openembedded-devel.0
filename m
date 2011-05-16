Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QM2k7-0008AD-Vd
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 20:42:12 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QM2hM-00074K-WB from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 11:39:21 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 16 May 2011 11:39:20 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 16 May 2011 11:39:20 -0700
Message-ID: <4DD16F53.1040003@mentor.com>
Date: Mon, 16 May 2011 11:39:15 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110513225811.GB21433@denix.org>
In-Reply-To: <20110513225811.GB21433@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 16 May 2011 18:39:20.0627 (UTC)
	FILETIME=[91D36830:01CC13F8]
Subject: Re: [2011.03-maintenance] Pull request for libsndfile update
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
X-List-Received-Date: Mon, 16 May 2011 18:42:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/13/2011 03:58 PM, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull this 1 commit for libsndfile version update - older versions
> are no longer downloadable from upstream.
> It's a cherry pick from oe.dev, where it's been for several days now.
> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>

This has been applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN0W9LAAoJEI4NMjfc3nJxFfIIAM5t3pVd6zMAzrPYF9oLDHqW
NDhLzJ+JWiNo20kPYb2flymGzWxcvIu5LBDpxzI8AON+MxpS9wLuYY2ifFFIl/vj
FEYbEP11BIimxiN0dibkPoTEO0gkbuXpEgTcZhakxkZwRQfDuspzVG3l7XFCv62s
2Sft5MgnyfLv9lEMxVfCFSA8YdLvengPwzUyuWDJuo2pV7yZHnVeFj7UNnUOV+Bh
IGg+A3ziInOanXwG9jC6MlRbyJZpgNRfJuYGkDeGDasq77NAeGiVJymCHENwcFI0
4l0kVWzg1UcRVKylU2U98s6Df5jlojlc2mGGFmFi5OYgNcjRy5k8e8SoCWEVth8=
=oZ3D
-----END PGP SIGNATURE-----


