Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1QBoO0-0001Fy-Rv
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 15:21:05 +0200
Received: by fxm19 with SMTP id 19so3345631fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 06:18:41 -0700 (PDT)
Received: by 10.223.75.146 with SMTP id y18mr4909398faj.61.1303132721041;
	Mon, 18 Apr 2011 06:18:41 -0700 (PDT)
Received: from risca-hp.localnet ([130.236.133.98])
	by mx.google.com with ESMTPS id 21sm1669160fav.41.2011.04.18.06.18.40
	(version=SSLv3 cipher=OTHER); Mon, 18 Apr 2011 06:18:40 -0700 (PDT)
From: "Patrik =?utf-8?q?Dahlstr=C3=B6m?= (student)" <patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 15:18:46 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.37-sabayon; KDE/4.6.2; x86_64; ; )
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302900059.3534.1.camel@gnutoo-desktop>
In-Reply-To: <1302900059.3534.1.camel@gnutoo-desktop>
MIME-Version: 1.0
Message-Id: <201104181518.46681.patda293@student.liu.se>
Subject: Re: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Mon, 18 Apr 2011 13:21:05 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

fredag 15 april 2011 22.40.59 skrev  Denis 'GNUtoo' Carikli:
> On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
> >=20
> >   patch sets the appropriate flags in autoconf.mk.in for
> >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
>=20
> What error did you get?
> Maybe you could add something like:
>  This patch fixes the following error:
>  [ERROR here]
> To the commit message.
When I have some time over I will look into this. Right now, school takes u=
p=20
most of my time.
>=20
> By the way, thanks a lot for the fix.
My pleasure.
>=20
> Denis.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
=2D-=20
MvH / with best regards
Patrik Dahlstr=C3=B6m


