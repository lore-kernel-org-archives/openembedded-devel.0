Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SV39U-00032B-VM
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 18:02:09 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 0D2DFA6223
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 17:52:03 +0200 (CEST)
Date: Thu, 17 May 2012 17:52:02 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120517175202.105cf8cd@eb-e6520>
In-Reply-To: <4FB50F30.7000906@mlbassoc.com>
References: <4FB508C7.4070808@mlbassoc.com> <3003401.DA8hFehsbE@helios>
	<4FB50F30.7000906@mlbassoc.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: meta-browser
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
X-List-Received-Date: Thu, 17 May 2012 16:02:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 17 May 2012 08:46:08 -0600,
Gary Thomas <gary@mlbassoc.com> a =E9crit :
> Of course, but that's a result of the fetcher code - the recipe does not
> have such:
>    SRC_URI =3D "http://commondatastorage.googleapis.com/chromium-browser-=
official/${P}.tar.bz2"
>=20
it seems that changing the SRC_URI to :
SRC_URI =3D
"http://v2.cache2.c.bigcache.googleapis.com/chromium-browser-official/${P}.=
tar.bz2"

could help as the fetch is finaly redirected to v2.cacheX...

Eric


