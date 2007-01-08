Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H42t6-0004WE-6l
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 23:22:40 +0100
Received: (qmail 4011 invoked by uid 813007); 8 Jan 2007 22:20:59 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 8 Jan 2007 22:20:59 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: Paul Sokolovsky <pmiscml@gmail.com>,
	openembedded-devel@lists.openembedded.org
User-Agent: KMail/1.9.5
References: <200701082227.08898.openembedded@hrw.one.pl>
	<837928192.20070108234054@gmail.com>
In-Reply-To: <837928192.20070108234054@gmail.com>
MIME-Version: 1.0
Date: Mon, 8 Jan 2007 23:20:58 +0100
Message-Id: <200701082320.59702.openembedded@hrw.one.pl>
Subject: Re: RFC: get rid of virtual/libsdl
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
X-List-Received-Date: Mon, 08 Jan 2007 22:22:40 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=B3ek, 8 stycznia 2007 22:40, Paul Sokolovsky napisa=B3:
> =A0 Well, that was one of questions I had in mind: why there're separate
> builds of SDL apps for GPE and OPIE - it would be kinda natural to
> expect SDL ABI to be the same on both.

ABI is same - backends differ. libsdl-x11 is normal pure upstream version=20
configured for X11 backend. libsdl-qpe is overhacked version configured=20
for QT/E 2.x - and in current .dev it gives too many linking problems.

> But of course it would be nice if this RFC would let for some time
> to do such testing.

Which kind of testing you suggest? I can run build and provide results.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           time is what keeps things from happening all at once




