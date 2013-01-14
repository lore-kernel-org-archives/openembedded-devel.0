Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TukQ9-0006ow-JD
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 14:49:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jan 2013 05:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,468,1355126400"; d="scan'208";a="273498294"
Received: from unknown (HELO helios.localnet) ([10.252.123.116])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2013 05:34:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Mon, 14 Jan 2013 13:34:13 +0000
Message-ID: <2159085.vty0yDIBH9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-21-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
References: <1357693239-13210-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe/meta-multimedia 0/2] games preparations
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
X-List-Received-Date: Mon, 14 Jan 2013 13:49:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 09 January 2013 02:00:37 Andreas M=FCller wrote:
> While preparing / testing some games I would like to see these in com=
mon
> layers
>=20
> Andreas M=FCller (2):
>   openal-soft: initial add 1.15.1
>   physfs: initial add 2.0.3
>=20
>  .../openal/openal-soft_1.15.1.bb                   |   20
> ++++++++++++++++++++ meta-oe/recipes-support/physfs/physfs_2.0.3.bb  =
   | =20
> 11 +++++++++++ 2 files changed, 31 insertions(+), 0 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb creat=
e mode
> 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb

There is a meta-games FYI, I think this is possibly where these recipes=
 ought=20
to have gone.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


