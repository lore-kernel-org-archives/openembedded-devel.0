Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QKtvC-0007gF-Ee for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 17:04:54 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx04.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QKta3-0006sb-37
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 16:43:03 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id C3BED7ECA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 16:43:03 +0200 (CEST)
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2011 16:43:02 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <201105131210.17952.sgh@sgh.dk> <4DCD2FE5.6090801@gravedo.de>
In-Reply-To: <4DCD2FE5.6090801@gravedo.de>
MIME-Version: 1.0
Message-Id: <201105131643.03086.sgh@sgh.dk>
Subject: Re: qt-x11-free_7.7.2 fail configure missing qmake
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
X-List-Received-Date: Fri, 13 May 2011 15:04:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Angstrom, i686

Have you tried compiling qt4-x11-free?

I can send you a buildlog if you'd like.


=46redag den 13. maj 2011 15:19:33 skrev Simon Busch:
> On 13.05.2011 12:10, S=F8ren Holm wrote:
> >=20
> > Hi
> >=20
> > Commit 5a6efd58cdc85d08ab9e106c84bbac5110b5aecd makes qt4 fail during c=
ompilation. It seems like qmake is not compiled or at least not staged.
> > Adding DEPENDS +=3D "qt4-native" does not seem to help since qt4-native=
 is actually build.
> >=20
> > I've tried deleting tmp to get a fresh build but with no luck.
>=20
> I tried compiling qt4-embedded multiply times before commiting the patch
> mentioned above a never get in the situation you desribed. For which
> machine and distro do you try to build qt4?
>=20


