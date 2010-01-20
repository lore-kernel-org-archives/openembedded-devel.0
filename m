Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NXVYZ-0003BS-SA
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 09:04:54 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 649091D3607A; Wed, 20 Jan 2010 09:02:35 +0100 (CET)
Date: Wed, 20 Jan 2010 09:02:35 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100120080235.GI18793@ibawizard.net>
References: <hj5604g6@ger.gmane.org>
	<1263935073-12359-1-git-send-email-ynezz@true.cz>
	<201001200756.02141.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <201001200756.02141.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH v2] xinput_calibrator: switch to autotools
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
X-List-Received-Date: Wed, 20 Jan 2010 08:04:55 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> [2010-01-20 07:56:01]:

> Dnia wtorek, 19 stycznia 2010 o 22:04:33 Petr =A9tetiar napisa=B3(a):
> > Signed-off-by: Petr =A9tetiar <ynezz@true.cz>
>=20
> imported, build tested, acked, pushed

Thanks.

Now it builds and packages only X11 frontend and I see no reason to
build/package gtkmm frontend if they're almost the same. Well gtkmm one d=
rags
in gtkmm dependency. Or do you think, that we need both frontends package=
d?

-- ynezz


