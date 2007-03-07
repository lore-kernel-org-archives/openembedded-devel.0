Received: from [89.149.220.217] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1HOvNH-0004np-2q
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Mar 2007 13:36:07 +0100
Received: from [192.168.1.21] (54.84-48-194.nextgentel.com [84.48.194.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 7CFDC1BF29F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2007 13:36:07 +0100 (CET)
From: =?iso-8859-1?q?=D8yvind_Repvik?= <repvik@kynisk.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Mar 2007 13:36:18 +0100
User-Agent: KMail/1.9.5
References: <E1HOvGE-0004Zn-Tg@linuxtogo.org>
	<45EEB07E.5@dominion.kabel.utwente.nl>
In-Reply-To: <45EEB07E.5@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200703071336.18336.repvik@kynisk.com>
Subject: Re: [oe-commits] org.oe.dev turbostation: Add a kernel-feed for the turbostation
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
X-List-Received-Date: Wed, 07 Mar 2007 12:36:07 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 07 March 2007 13:30, Koen Kooi wrote:
> nail commit schreef:
> > turbostation: Add a kernel-feed for the turbostation
> >
> >
> > ---
> > conf/machine/turbostation.conf	6f726b010d35f1dca1dfb881904353cbda8d1e85
> > +++
> > conf/machine/turbostation.conf	d117d9cf3f641f7635130a1cff259c3c26fe96e7
> >
> > +FEED_URIS +=3D
> > "turbostation##http://ipkg.kynisk.com/opents/cross/1.0-dev/"
>
> Don't do that, feeds are a distro thing, not a machine thing. So that
> should go into conf/distro/$yourdistro.conf
>

Yeah, but since I won't touch the distro in question, I'll just clone it an=
d=20
make it my own.=20

=D8yvind


