Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1K0tu3-0007g9-HX
	for openembedded-devel@openembedded.org; Tue, 27 May 2008 09:47:27 +0200
Received: (qmail 17566 invoked by uid 813007); 27 May 2008 07:44:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO maluch.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 May 2008 07:44:05 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2008 09:44:04 +0200
User-Agent: KMail/1.9.9
References: <g1eulp$skn$1@ger.gmane.org>
In-Reply-To: <g1eulp$skn$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200805270944.04922.openembedded@haerwu.biz>
Subject: Re: RFC: restart wiki from scratch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 27 May 2008 07:47:27 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Monday 26 of May 2008, Rolf Leggewie napisa=B3:

> the openembedded website is in rather bad shape lately.  This includes
> the wiki which has both technical and content problems.  I suggest to
> start anew.
>
> I'd like to go with mediawiki instead this time for the simple reason
> that there are more of us who are actually familiar with this software
> both from an admin and a user perspective.  Mediawiki was the software
> for the OZ wiki which at its time wasn't doing too badly.
>
> Whatever we do, I think we should not allow the current state to exist
> much longer.

Agree - what we have now is hard to maintain and require Drupal experience=
=20
which many people lack (I am one of them). Every time when I have to edit=20
current OE wiki I feel that this is too complicated and too many options=20
are present. Also there is always a problem with creating new pages as=20
current situation looks like only registered users can create new pages=20
but anyone can edit them.

Will it be MediaWiki or ikiwiki does not matter too much for me. We need=20
system which has:

=2D spam protection
=2D protecting pages (so only admins can edit)
=2D registering users (I would prefer to not have anonymous edits)
=2D blocking users (spammers)
=2D sane syntax for content

We have to decide which way we will go. One wiki for website and=20
documentation or website (drupal, wordpress) + documentation in wiki.




