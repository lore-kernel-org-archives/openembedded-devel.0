Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NWn0N-0000g3-6Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 09:30:38 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NWmyD-0003Fg-5e for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 03:28:21 -0500
Date: Mon, 18 Jan 2010 03:27:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001180921.20366.marcin@juszkiewicz.com.pl>
Message-ID: <alpine.LFD.2.00.1001180322430.24941@localhost>
References: <alpine.LFD.2.00.1001170412460.4070@localhost>
	<1263764794.5353.33.camel@mattotaupa.wohnung.familie-menzel.net>
	<hj0a4i$km$2@ger.gmane.org>
	<201001180921.20366.marcin@juszkiewicz.com.pl>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: move marvell firmware tarballs out of OE repo?
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
X-List-Received-Date: Mon, 18 Jan 2010 08:30:38 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1817871224-1263803258=:24941"

--8323328-1817871224-1263803258=:24941
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 18 Jan 2010, Marcin Juszkiewicz wrote:

> Dnia poniedzia=C5=82ek, 18 stycznia 2010 o 01:31:13 Rolf Leggewie napisa=
=C5=82(a):
> > Paul Menzel wrote:
> > > Anyways looking at the relevant commit
>
> > > it does not explicitly say, why the firmware cannot be made public
> > > somewhere or if it ever will be available.
>
> > No, nobody was suggesting it would.  But it does list Marcin's address.
> >  So, he can be contacted directly instead of needlessly bothering
> > everybody on this list with this.
>
> And Robert took the worst timing for such mails - I do not know how
> others but I do not read all mails during weekend.

  slacker.  :-)

> On Sunday morning I sent mail with info why several tarballs are
> present in metadata. He was probably sleeping at that time. I just
> hope that in 6 hours from now Robert will be able to reply to this
> mail.

  or sooner.  in any event, i did post earlier that i understand there
will be rare and unusual circumstances where content will have to be
incorporated with the OE repo.  in cases like that, it would be handy
to have a short README file in the corresponding recipes directory
explaining the rationale for it, and perhaps even the circumstances
under which that content might someday be removed and actually
downloaded, just so anyone else might recognize when that can be done.

  that's entirely up to the people responsible for those tarballs.

  movin' on ...

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323328-1817871224-1263803258=:24941--
