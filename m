Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UIfU3-0002ry-9N
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 14:24:44 +0100
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 307C94B0045;
	Thu, 21 Mar 2013 14:07:46 +0100 (CET)
Date: Thu, 21 Mar 2013 14:07:45 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130321140745.4a0683c8@e6520eb>
In-Reply-To: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
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
X-List-Received-Date: Thu, 21 Mar 2013 13:24:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Thu, 21 Mar 2013 09:48:59 +0000,
Ross Burton <ross.burton@intel.com> a =C3=A9crit :

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/guile/guile-1.8.7/18.diff  | 1743 --------------=
------
>  .../guile/guile-1.8.7/configure-fix.patch          |   10 -
>  .../guile/guile-native-1.8.7/cpp-linemarkers.patch |    8 -
>  .../guile/guile-native-1.8.7/reloc.patch           |   22 -
>  meta-oe/recipes-support/guile/guile-native.inc     |   13 -
>  .../recipes-support/guile/guile-native_1.8.7.bb    |   13 -
>  meta-oe/recipes-support/guile/guile.inc            |   47 -
>  meta-oe/recipes-support/guile/guile_1.8.7.bb       |   14 -
>  8 files changed, 1870 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/guile/guile-1.8.7/18.diff
>  delete mode 100644 meta-oe/recipes-support/guile/guile-1.8.7/configure-f=
ix.patch
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native-1.8.7/cpp-=
linemarkers.patch
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native-1.8.7/relo=
c.patch
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native.inc
>  delete mode 100644 meta-oe/recipes-support/guile/guile-native_1.8.7.bb
>  delete mode 100644 meta-oe/recipes-support/guile/guile.inc
>  delete mode 100644 meta-oe/recipes-support/guile/guile_1.8.7.bb
>=20
pushed to danny-next

Thanks,
Eric


