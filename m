Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HXwzD-0000aZ-5g
	for openembedded-devel@openembedded.org; Sun, 01 Apr 2007 12:08:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l31A8Y6s009728
	for <openembedded-devel@openembedded.org>;
	Sun, 1 Apr 2007 11:08:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08911-09 for <openembedded-devel@openembedded.org>;
	Sun,  1 Apr 2007 11:08:31 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l31A8NP9009715
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 1 Apr 2007 11:08:23 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200704011159.52186.repvik@kynisk.com>
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>
	<460F5F87.3060403@dominion.kabel.utwente.nl>
	<200704011159.52186.repvik@kynisk.com>
Date: Sun, 01 Apr 2007 11:08:22 +0100
Message-Id: <1175422103.5829.0.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	l31A8Y6s009728
Subject: Re: [oe-commits] org.oe.dev prismstumbler: add 0.7.4pre1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Apr 2007 10:08:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, 2007-04-01 at 11:59 +0200, =D8yvind Repvik wrote:
> On Sunday 01 April 2007 09:30, Koen Kooi wrote:
> > florian commit schreef:
> > > prismstumbler: add 0.7.4pre1
> > >
> > >
> > > packages/prismstumbler/prismstumbler_0.7.4pre1.bb
> >
> > That is against our versioning policy, this way you can't upgrade to =
0.7.4
> > when it gets released[1]. Use _0.7.3+0.7.4pre1 instead.
>=20
> A semi-related question. Where is this policy? There is apparently a bu=
nch of=20
> policies that I am unaware of, and I'd like a pointer to them.

http://www.openembedded.org/wiki/Policies

The version policy is there at least. The aim was simply to try and
standardise things so package upgrades always work.

Cheers,

Richard



