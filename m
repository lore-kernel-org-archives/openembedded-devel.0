Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1INtvI-0006YX-Br
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 19:23:16 +0200
Received: (qmail 6323 invoked by uid 813007); 22 Aug 2007 17:22:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 22 Aug 2007 17:22:10 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2007 19:22:05 +0200
User-Agent: KMail/1.9.7
References: <19c1b8a90708220852p5ed75070wa0a78dd002fe112c@mail.gmail.com>
	<46CC697F.8040306@balister.org>
In-Reply-To: <46CC697F.8040306@balister.org>
MIME-Version: 1.0
Message-Id: <200708221922.06978.openembedded@hrw.one.pl>
Subject: Re: RFC: Fix for bug 1744 and some restructuring of omap kernel bb	files.
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
X-List-Received-Date: Wed, 22 Aug 2007 17:23:18 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 22 sierpnia 2007, Philip Balister napisa=B3:
> I have given it a quick look, and it looks reasonable. It appears to
> drop OABI support, which I think is OK, except for the celinux distro
> (not sure).
>
> The only real concern I have is that we would like to move to the
> linux.inc/linux_2.6.x.bb style of kernel bb files. Should we push this,
> or wait until we can convert the omap/davinci kernels to linux.inc? I
> shouldn't even look at this until September ...

Merging linux-omap kernel recipes into linux_2.6.xx ones would be nice. It=
=20
also gives OABI/EABI switch for any ARM distros.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Don't personalize computers. They hate that.




