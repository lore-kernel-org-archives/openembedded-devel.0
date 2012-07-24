Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1StadI-0005RD-4K
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:38:20 +0200
Received: from localhost (unknown [91.224.149.44])
	by ms.seketeli.net (Postfix) with ESMTP id 28DD9EA040
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 10:30:10 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 206CB202B9; Tue, 24 Jul 2012 10:26:53 +0200 (CEST)
Date: Tue, 24 Jul 2012 10:26:53 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120724082652.GG2966@kilowog>
References: <cover.1343104879.git.denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <cover.1343104879.git.denys@ti.com>
X-Operating-System: Debian GNU/Linux 6.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [2011.03-maintenance][PATCH 0/1] Pull request 20110723
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
X-List-Received-Date: Tue, 24 Jul 2012 08:38:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 24-Jul-12 =E0 00:52:28 -0400, Denys Dmytriyenko a =E9crit:
> Tom,
>=20
> Please pull this commit that fixes opkg-utils when generating pkg index
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=3Ddenix/openembedded.g=
it;a=3Dshortlog;h=3Drefs/heads/2011.03-maintenance
>=20
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>
> ---
>=20
> The following changes since commit f9611c025109a3e0d6cebf12f49ae24c9775=
9c09:
>=20
>   psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07=
-04 22:34:04 +0200)
>=20
> are available in the git repository at:
>   git://arago-project.org/git/people/denix/openembedded 2011.03-mainten=
ance
>=20
> Denys Dmytriyenko (1):
>   opkg-utils: bump SRCREV to pick up subprocess.check_output fixes
>=20
>  recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> --=20
> 1.7.8.6

Thanks for fixing this. I wasn't aware of that last commit, 49cc78, on
the yocto tree when I did my pull request.

Cheers.
--=20
        Apelete


