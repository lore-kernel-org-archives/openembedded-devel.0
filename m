Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1Iplaa-0001lO-0n
	for openembedded-devel@openembedded.org; Wed, 07 Nov 2007 15:09:05 +0100
Received: (qmail 29241 invoked by uid 813007); 7 Nov 2007 14:08:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Nov 2007 14:08:10 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Nov 2007 15:07:51 +0100
User-Agent: KMail/1.9.7
References: <20071107112319.GA20128@thegnar.org>
In-Reply-To: <20071107112319.GA20128@thegnar.org>
MIME-Version: 1.0
Message-Id: <200711071507.52756.openembedded@haerwu.biz>
Subject: Re: fectch checker task?
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
X-List-Received-Date: Wed, 07 Nov 2007 14:09:10 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 7 listopada 2007, mark gross napisa=B3:
> would it be easy to create a task to do a quick sanity check on all the
> packages that need to be downloaded for a build?  The linear search for
> busted fetch calls is quite irritating.
>
> What would such a task look like?
> Is there a way to pass a parameter to the target to just do the fetch
> step?

You mean "bitbake -cfetchall BUILD_TARGET"? This will fetch everything=20
needed to build BUILD_TARGET.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

as it is Free Software, it is done when enough people helped to make it=20
done




