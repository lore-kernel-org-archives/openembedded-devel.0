Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HcF8U-00076d-Bx
	for openembedded-devel@openembedded.org; Fri, 13 Apr 2007 08:19:54 +0200
Received: (qmail 30969 invoked by uid 813007); 13 Apr 2007 06:19:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.local)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 13 Apr 2007 06:19:52 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Apr 2007 08:19:54 +0200
User-Agent: KMail/1.9.6
References: <200703042228.03665.openembedded@hrw.one.pl>
	<200704122035.03980.openembedded@hrw.one.pl>
	<461EB337.7020302@whitby.id.au>
In-Reply-To: <461EB337.7020302@whitby.id.au>
MIME-Version: 1.0
Message-Id: <200704130819.55884.openembedded@hrw.one.pl>
Subject: Re: RFC: Task-base rewrite
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
X-List-Received-Date: Fri, 13 Apr 2007 06:19:54 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 13 kwietnia 2007, Rod Whitby napisa=B3:

> No tests yet, but it has the support of nslu2-linux distros.

;)=20

Idea of splitting into separate packages comes from my discussions with=20
Richard about differencies between Poky task-base and OE task-base.=20
During last Easter I had more time to think about correct implementation=20
and wanted to make small rootfs creation easier then it was before.=20

And nslu2 rootfs is big - Cliff Brake created 1.7M rootfs for his Compulab=
=20
board.

Cliff: can you look at task-boot contents and tell does it need something=20
removed/added to create minimal image?

> I especially like the dropbear/openssh selection capability.

Too many people complain about having dropbear in their rootfs ;)

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I don't know. I don't care. And it doesn't make any difference.




