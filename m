Received: from mx02.stofanet.dk ([212.10.10.12])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <sgh@sgh.dk>)
	id 1QDbc3-0002z6-QH for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 14:06:59 +0200
Received: from 5634f1b4.rev.stofanet.dk ([86.52.241.180] helo=asrock)
	by mx02.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1QDbZj-0004eg-39
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 14:04:35 +0200
Received: from phoenix.localnet (unknown [192.168.0.226])
	by asrock (Postfix) with ESMTPS id 8B54E7F153
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 14:04:35 +0200 (CEST)
From: =?iso-8859-15?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Apr 2011 14:04:34 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <201104201007.04378.sgh@sgh.dk> <201104231308.08992.sgh@sgh.dk>
	<1303559162.4551.15.camel@mattotaupa>
In-Reply-To: <1303559162.4551.15.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104231404.34882.sgh@sgh.dk>
Subject: Re: [PATCH] wvstreams: add patch to add missing header includes
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
X-List-Received-Date: Sat, 23 Apr 2011 12:06:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

L=F8rdag den 23. april 2011 13:46:02 skrev Paul Menzel:
> Am Samstag, den 23.04.2011, 13:08 +0200 schrieb S=F8ren Holm:
> > Fredag den 22. april 2011 21:51:07 skrev Paul Menzel:
> > > 1. S=F8ren, please add your Signed-off-by line in front of mine. This=
 is a demanded by the commit policy [1].
> >=20
> > I kind of novice into this. How do I add my signed-off line ?
>=20
> When committing the change, just add the option `-s` and it is added
> automatically by what you have configured using `git config`.
>=20
> For now, you can just reply to this message and add that line where you
> like.


Signed-off-by: S=F8ren Holm <sgh@sgh.dk>

I rebased my branch at github repo to master. Now ait lso contains a 4.6.1 =
recipe if your would like.
I added my Signed-Off to both commits there also.

>=20
> I will add it to the commit message using `git commit --amend`.
>=20
> > > 2. I am adding Khem, since he seems to be the original author of this=
 patch. It would be great to get his Acked-by too.
> > > 3. S=F8ren, please send your patch upstream.
> > > 4. S=F8ren, when you have a little time it would be great if you coul=
d update WvStreams to 4.6.1 and test it.
> >=20
> > will do
> >=20
> > > 5. S=F8ren, I removed `apply=3Dyes` since that is the default.
> >=20
> > great.
> >=20
> > btw. The emaileaddress mixup won't happen again.
>=20
> Just tell me what the correct one is and I will push your patch.
>=20
>=20
> Thanks,
>=20
> Paul
>=20


