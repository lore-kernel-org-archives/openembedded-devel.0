Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MBpFo-0005jK-16
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 14:07:36 +0200
Received: (qmail 16665 invoked by uid 813007); 3 Jun 2009 11:58:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 3 Jun 2009 11:58:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 3 Jun 2009 13:59:18 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc6-00082-g7aff192-dirty; KDE/4.2.2;
	x86_64; ; )
References: <200906031325.48159.marcin@juszkiewicz.com.pl>
	<h05nok$s93$1@ger.gmane.org>
In-Reply-To: <h05nok$s93$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200906031359.19249.marcin@juszkiewicz.com.pl>
Subject: Re: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Wed, 03 Jun 2009 12:07:36 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 3 czerwca 2009 o 13:45:24 Koen Kooi napisa=C5=82(a):
> On 03-06-09 13:25, Marcin Juszkiewicz wrote:

> > +    pr =3D bb.data.getVar('PR', d, True)
>
> You're not using 'pr' anywhere in the code you add. Looks fine
> otherwise, although I haven't tested it.

Thats leftover from older version of patch.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




