Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Kst81-0002QO-Mq
	for openembedded-devel@openembedded.org; Thu, 23 Oct 2008 07:53:02 +0200
Received: (qmail 6628 invoked by uid 813007); 23 Oct 2008 05:52:31 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Oct 2008 05:52:31 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Oct 2008 07:52:43 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.27; KDE/4.1.2; x86_64; ; )
References: <bdb0025f0810222159ka9b7ab7q4088bd6a241e477a@mail.gmail.com>
In-Reply-To: <bdb0025f0810222159ka9b7ab7q4088bd6a241e477a@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200810230752.44580.openembedded@haerwu.biz>
Subject: Re: pushing mamona things upstream
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
X-List-Received-Date: Thu, 23 Oct 2008 05:53:02 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thursday 23 of October 2008 06:59:11 Rodrigo Vivi napisa=C5=82(a):
> Hi guys,
>
> I'm afraid we from Mamona are in debit with OE. It has been passed
> long time without sending our things back upstream.
>
> But now that git migration has finished it will be easy to work
> closer.
>
> My plan is to send directly all patches that change mamona packages,
> tasks and configuration. This shouldn't break anyone's build. (Get
> prepared for an avalanche of commits :) )

This should fix some builds even - mamona tasks lack deps now iirc.

> After that it will be easy for us to see what we have different.
> We'll put these differences in a table and ask for permission by
> email or reporting a bug.

You can also push to own branch and ask for reviewing it.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




