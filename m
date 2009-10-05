Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MutIr-0003jO-7j
	for openembedded-devel@openembedded.org; Mon, 05 Oct 2009 21:33:04 +0200
Received: (qmail 23242 invoked by uid 813007); 5 Oct 2009 19:32:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Oct 2009 19:32:14 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 5 Oct 2009 21:31:59 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.32-rc2; KDE/4.3.1; x86_64; ; )
References: <1254768733.10712.3.camel@leeloo.somedomain>
In-Reply-To: <1254768733.10712.3.camel@leeloo.somedomain>
MIME-Version: 1.0
Message-Id: <200910052132.00776.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: lighttpd 1.4.18 runtime issue
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
X-List-Received-Date: Mon, 05 Oct 2009 19:33:05 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 5 pa=C5=BAdziernika 2009 o 20:52:13 Michael Lippaut=
z napisa=C5=82(a):
> lighttpd_1.4.18 is installed with a config that should actually load its
> module mod-indexfile.so.
=20
> Since the config is pretty default, I added the module to the runtime
> depends.=20

OK

> (also re-formated recipe, uses tabs now).
=20
There is a tool in contrib/ which handle reformation of recipes.

# _Format guideline #2_:
#   Tabs should not be used (use spaces instead).

You have tab=3D8, I use tab=3D4 for most of formats so we get different vie=
w of=20
recipe code...

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




