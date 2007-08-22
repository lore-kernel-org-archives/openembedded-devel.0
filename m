Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1INsu9-0005V6-3R
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 18:18:02 +0200
Received: (qmail 28466 invoked by uid 813007); 22 Aug 2007 16:16:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 22 Aug 2007 16:16:55 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2007 18:16:52 +0200
User-Agent: KMail/1.9.7
References: <E1IIPXa-0005bT-C3@linuxtogo.org>
	<1186499800.5653.62.camel@localhost.localdomain>
	<200708201332.29985.openembedded@hrw.one.pl>
In-Reply-To: <200708201332.29985.openembedded@hrw.one.pl>
MIME-Version: 1.0
Message-Id: <200708221816.52772.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev linux 2.6.22: Alix boards use bzImage	kernels
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
X-List-Received-Date: Wed, 22 Aug 2007 16:18:03 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 20 sierpnia 2007, Marcin Juszkiewicz napisa=B3:
> Right - I looked at it and prepared patch. It removes
> KERNEL_IMAGETYPE =3D "zImage" entries from kernel recipes and also sets
> this variable into bzImage for x86 machines which already use that type
> of kernels. Rest of machines are untouched (yet) - I can convert them
> if we reach consensus about it.
>
> Please review and comment.

pushed

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

         Computers are not intelligent. They only think they are.




