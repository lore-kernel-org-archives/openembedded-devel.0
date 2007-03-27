Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HW9QI-0007ur-Ri
	for openembedded-devel@openembedded.org; Tue, 27 Mar 2007 13:01:07 +0200
Received: (qmail 3755 invoked by uid 813007); 27 Mar 2007 11:01:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 27 Mar 2007 11:01:05 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2007 13:00:58 +0200
User-Agent: KMail/1.9.6
References: <4608D065.3060205@whitby.id.au>
In-Reply-To: <4608D065.3060205@whitby.id.au>
MIME-Version: 1.0
Message-Id: <200703271300.59292.openembedded@hrw.one.pl>
Subject: Re: Alternatives handling for cpio (cpio vs busybox)
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
X-List-Received-Date: Tue, 27 Mar 2007 11:01:11 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 27 marca 2007, Rod Whitby napisa=B3:

> I propose to change the cpio package such that it installs cpio in /bin
> instead of /usr/bin, and then uses update-alternatives to select it
> ahead of busybox.

+1 from me - Debian store cpio in /bin/

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

      I don't know. I don't care. And it doesn't make any difference.




