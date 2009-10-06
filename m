Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mv2Pq-0003ff-JH
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 07:16:53 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KR20013HUMAOXA5@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	06 Oct 2009 00:15:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AF20D14AF60; Tue,
	06 Oct 2009 01:15:45 -0400 (EDT)
Date: Tue, 06 Oct 2009 01:15:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <5f2b60910050029u12068f51w86d3734ffa6bc11c@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091006051545.GD22854@denix.org>
MIME-version: 1.0
References: <5f2b60909290445h117f28f0s807430bcec2176e1@mail.gmail.com>
	<20090929181518.GB12138@denix.org>
	<5f2b60909300139o6222d53do81e90af139d326da@mail.gmail.com>
	<5f2b60910050029u12068f51w86d3734ffa6bc11c@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dm6446-evm kernel broken
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
X-List-Received-Date: Tue, 06 Oct 2009 05:16:53 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Mon, Oct 05, 2009 at 09:29:10AM +0200, Bj??rn Forsman wrote:
> 2009/9/30 Bj??rn Forsman <bjorn.forsman@gmail.com>:
> > Hi Denys,
> >
> > The OE .dev branch from yesterday seems to build
> > recipes/linux/linux-davinci_2.6.30.bb by default.
> > It has the following SRCREV:
> > =A0 =A0SRCREV =3D "5212151f26e688416faac9f6f33ddd958f7de96c"
> > (And my local.conf does not specify any preferred kernel
> > version/provider stuff.)
> >
> > So maybe the question is what kernel *you* are using? :-)
> > Are you building linux-davinci_git.bb? That would explain why you=
 don't
> > see the SRCREV I do.
>=20
> Ping.
>=20
> (New build from yesterday still uses linux-davinci_2.6.30.bb with
>     SRCREV =3D "5212151f26e688416faac9f6f33ddd958f7de96c"
> which fails to boot.)

Please see http://thread.gmane.org/gmane.comp.handhelds.openembedded/=
26691

--=20
Denys



