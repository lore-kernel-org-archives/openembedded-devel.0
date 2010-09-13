Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ov9OK-0002uT-5y
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 15:48:18 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id BB39A540C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 17:47:26 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 17:47:25 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1283644814-27013-1-git-send-email-hvontres@gmail.com>
	<201009131631.58835.khimov@altell.ru>
	<AANLkTikFZv53zicF-sUF+WZJdk=WL=_pKQSc6NNBnx7C@mail.gmail.com>
In-Reply-To: <AANLkTikFZv53zicF-sUF+WZJdk=WL=_pKQSc6NNBnx7C@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201009131747.25914.khimov@altell.ru>
X-Altell-MailScanner-ID: BB39A540C.70E48
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dnsmasq: add version 2.55 from upstream
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
X-List-Received-Date: Mon, 13 Sep 2010 13:48:18 -0000
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB 13=
 =D3=C5=CE=D4=D1=C2=D2=D1 2010 17:02:59 =C1=D7=D4=CF=D2 Frans Meulenbroeks=
=20
=CE=C1=D0=C9=D3=C1=CC:
> 2010/9/13 Roman I Khimov <khimov@altell.ru>:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=CF=D3=CB=D2=C5=D3=C5=CE=D8=
=C5 05 =D3=C5=CE=D4=D1=C2=D2=D1 2010 04:00:14 =C1=D7=D4=CF=D2 Henry von
> > Tresckow
> >
> > =CE=C1=D0=C9=D3=C1=CC:
> >> Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
> >> ---
> >>  recipes/dnsmasq/dnsmasq-dbus_2.55.bb |   13 +++++++++++++
> >>  recipes/dnsmasq/dnsmasq_2.55.bb      |    4 ++++
> >>  2 files changed, 17 insertions(+), 0 deletions(-)
> >>  create mode 100644 recipes/dnsmasq/dnsmasq-dbus_2.55.bb
> >>  create mode 100644 recipes/dnsmasq/dnsmasq_2.55.bb
> >
> > Acked-by: Roman I Khimov <khimov@altell.ru>
>=20
> No problem with this version, but is it useful to keep versions like 2.52.
> Please avoid version clutter!

At least it doesn't hurt in this case IMO. Although 2.55 works fine here si=
nce=20
July (with technically exactly the same patch, somehow I've missed it when =
was=20
looking for things to push in OE) it has many various changes compared to=20
2.52, maybe too many for someone.


