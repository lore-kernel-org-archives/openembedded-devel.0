Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QV4ci-0008H6-IH
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 18:31:52 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QV4ZU-0001v0-Fk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 09:28:32 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 10 Jun 2011 09:28:32 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 10 Jun 2011 09:28:31 -0700
Message-ID: <4DF24629.3090909@mentor.com>
Date: Fri, 10 Jun 2011 09:28:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110608213541.GB29476@denix.org>
In-Reply-To: <20110608213541.GB29476@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 10 Jun 2011 16:28:32.0297 (UTC)
	FILETIME=[702F0990:01CC278B]
Subject: Re: [2011.03-maintenance] Pull request 20110608
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
X-List-Received-Date: Fri, 10 Jun 2011 16:31:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/08/2011 02:35 PM, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull these 15 commits for various bug fixes and enhancements.
> All, except one, are cherry picked from oe.dev. The qt-4.6.3 one instead
> of moving the patch from 4.7.3 just adds it, as there is no 4.7.3 version
> available in the maintenance branch.
> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN8kYhAAoJEI4NMjfc3nJx1UcIAKp4WyF4xD5jl9QWV6/5X7dy
lLqaPBpa5Q/PGPdTiSItKB+RBUdZIK39zyUEQeryjsKe5gXLM1iuaPNZcwonVqI9
lJyppy1UytmYDC/1eIY3N364JvsJ/sNklTo+kVCVed6omp0aXwKagQQH6SM53jRl
1rn+256nInziSIouUpeHwjHFx3Vg9oNUK/RtCaTdELd0LqNiH6sGcxG69kINMX+k
p3fdJ+wG+ExykEu8V+yQK/5aID4deXhJxwX9xTO/+ys8L2jcFwNj8e42vJSOre/j
LMtpysdfR3/vH5BBp+3UTh+GugsziYAYXXVEbHUxQrV8eS+kdZDBH45SEDqZUIk=
=Zrr4
-----END PGP SIGNATURE-----


