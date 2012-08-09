Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SzWTX-00054v-Bz
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Aug 2012 19:24:47 +0200
Received: from mail156-va3-R.bigfish.com (10.7.14.247) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Thu, 9 Aug 2012 17:12:58 +0000
Received: from mail156-va3 (localhost [127.0.0.1])	by
	mail156-va3-R.bigfish.com (Postfix) with ESMTP id 5EC972E0246	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2012 17:12:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -11
X-BigFish: VS-11(zz98dI154cP9371I936eIc85dh1432Izz1202hzz8275ch8275bh8275dhf542ehz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail156-va3 (localhost.localdomain [127.0.0.1]) by mail156-va3
	(MessageSwitch) id 1344532376808243_3947;
	Thu,  9 Aug 2012 17:12:56 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.253])	by
	mail156-va3.bigfish.com (Postfix) with ESMTP id B7CDA18012B	for
	<openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2012 17:12:56 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 9 Aug 2012 17:12:56 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0298.005; Thu, 9 Aug 2012 12:12:55 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-openembedded patch queue
Thread-Index: AQHNdlI2KDuQskuQ1Ue8oLnJbMgMLw==
Date: Thu, 9 Aug 2012 17:12:54 +0000
Message-ID: <CAEsOVNeC4VwGfDExNF+2+AqDv9RFaA89nxkB2M_PjLdMvHo7yQ@mail.gmail.com>
References: <jvqqs2$tn3$1@dough.gmane.org>
	<CAEsOVNc1onWY2n27Gk8O-H5NsKq_yUARxo9NXPuGdZQToR9mTw@mail.gmail.com>
	<jvt345$dms$2@dough.gmane.org>
	<CAEsOVNenouzNawgZ=1cbBf1WksGDDmuCH-V+-1JafEjn9HdWGg@mail.gmail.com>
	<jvvk8e$seb$1@dough.gmane.org>
In-Reply-To: <jvvk8e$seb$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: meta-openembedded patch queue
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
X-List-Received-Date: Thu, 09 Aug 2012 17:24:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


On Aug 9, 2012 1:11 AM, "Koen Kooi" <koen@dominion.thruhere.net<mailto:koen=
@dominion.thruhere.net>> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 08-08-12 21:42, McClintock Matthew-B29882 schreef:
> > On Wed, Aug 8, 2012 at 2:06 AM, Koen Kooi <koen@dominion.thruhere.net<m=
ailto:koen@dominion.thruhere.net>>
> > wrote: Op 07-08-12 19:53, McClintock Matthew-B29882 schreef:
> >>>> On Tue, Aug 7, 2012 at 5:32 AM, Koen Kooi
> >>>> <koen@dominion.thruhere.net<mailto:koen@dominion.thruhere.net>> wrot=
e: Hi,
> >>>>
> >>>> I've applied a bunch of patches and hopefully commented on all the
> >>>> ones I didn't apply. I also cleared the meta-oe patchwork so it's
> >>>> nice and empty now:
> >>>> http://patchwork.openembedded.org/project/oe/list/?q=3Dmeta-oe
> >>>>
> >>>> If your patch hasn't been applied yet into meta-openembedded master
> >>>> and is lacking comments, please resubmit it as [meta-oe][PATCH
> >>>> v(N+1)] (substitute N please).
> >>>>
> >>>> There are a few big deadlines coming up at work, so everything will
> >>>> have a few days of delay but if you haven't seen any feedback after
> >>>> a week and the patch is still sitting in patchwork, please send a
> >>>> reminder. Replying to the patch with 'ping' is usually enough and
> >>>> most people know where to find me on IRC.
> >>>>
> >>>>> I have this:
> >>>>
> >>>>> http://patchwork.openembedded.org/patch/32957/
> >
> > Ah right, I did try that one, but forgot to actually send the feedback:
> >
> > koen@dominion:/OE/tentacle/sources/meta-openembedded$ sh contrib/pw-am.=
sh
> > 32957 2012-08-08 09:04:45
> > URL:http://patches.openembedded.org/patch/32957/mbox/ [1299] ->
> > "pw-am-32957.patch" [1] Applying: cramfs_cvs.bb<http://cramfs_cvs.bb>: =
fix compile step so it
> > can be rerun without failing error: patch failed:
> > meta-oe/recipes-support/cramfs/cramfs_cvs.bb:4<http://cramfs_cvs.bb:4> =
error:
> > meta-oe/recipes-support/cramfs/cramfs_cvs.bb<http://cramfs_cvs.bb>: pat=
ch does not apply Patch
> > failed at 0001 cramfs_cvs.bb<http://cramfs_cvs.bb>: fix compile step so=
 it can be rerun without
> > failing When you have resolved this problem run "git am --resolved". If
> > you would prefer to skip this patch, instead run "git am --skip". To
> > restore the original branch and stop patching run "git am --abort".
> >
> >> This is working fine for me, you are applying to denzil branch right?
>
> No master, Eric is in charge of denzil :)

In that case its already applied to master. Sorry.

-M

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFQI1RQMkyGM64RGpERAnL+AKCCjeRxG4ji3G/POYT0s7uzgkVVFQCghawo
> MIqlHeSHIh+jzf1m4fkYVYk=3D
> =3D0ug3
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists=
.openembedded.org>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

