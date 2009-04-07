Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lr6Sn-0004kt-Oq
	for openembedded-devel@openembedded.org; Tue, 07 Apr 2009 10:15:28 +0200
Received: (qmail 9449 invoked by uid 813007); 7 Apr 2009 08:12:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Apr 2009 08:12:26 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Apr 2009 10:12:21 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
References: <200904032354.43251.khimov@altell.ru>
	<1239026948-12471-1-git-send-email-khimov@altell.ru>
	<19c1b8a90904061445o242b7eb9td783505faf876089@mail.gmail.com>
In-Reply-To: <19c1b8a90904061445o242b7eb9td783505faf876089@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200904071012.28361.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ace: New recipe for ACE 5.6.8
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
X-List-Received-Date: Tue, 07 Apr 2009 08:15:32 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 6 kwietnia 2009 o 23:45:03 Khem Raj napisa=C5=82(a):
> you could use the url =C2=A0in the license field. if there is one

You can not. src_distribute.bbclass uses LICENSE field to group archives=20
of sources and is enabled by default in =C3=85ngstr=C3=B6m. If package has =
own=20
license then LICENSE =3D "ace" will be enough - if someone wants to check=20
it then it is in archive with sources.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




