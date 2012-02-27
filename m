Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1S1xqY-0002rz-Dg
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 11:30:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 33C962C812
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:20:08 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftRvVbWOQOUh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:19:56 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 580132C793
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2012 10:19:56 +0000 (UTC)
Message-ID: <4F4B5938.7000908@gmail.com>
Date: Mon, 27 Feb 2012 11:21:44 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F4A68FE.2020109@gmail.com> <20120226183711.312b7e58@eb-e6520>
In-Reply-To: <20120226183711.312b7e58@eb-e6520>
Subject: Re: angstrom site down, where to find mirrors
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
X-List-Received-Date: Mon, 27 Feb 2012 10:30:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Eric B=C3=A9nard ha scritto, Il 26/02/2012 18:37:

> you can remove angstrom mirrors by editing :
> sources/meta-angstrom/conf/distro/include/angstrom.inc
> and commentting out line 96 :
> # INHERIT +=3D "angstrom-mirrors"=20
>=20
> Even when angstrom mirror is up it can be quite slow so you may save
> some time by not using the mirror (but some downloads may fail if the
> original source is no more available online).
>=20

Eric
Where alre defined the URLs used by "angstrom-mirrors" ?


--
Marco


