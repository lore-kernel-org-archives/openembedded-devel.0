Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L54Kp-0004FA-AU
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 21:16:35 +0100
Received: (qmail 29816 invoked by uid 813007); 25 Nov 2008 20:13:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Nov 2008 20:13:39 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Nov 2008 21:13:49 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.28-rc4; KDE/4.1.3; x86_64; ; )
References: <gghjh1$dg1$1@ger.gmane.org>
In-Reply-To: <gghjh1$dg1$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200811252113.50363.openembedded@haerwu.biz>
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Tue, 25 Nov 2008 20:16:35 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Tuesday 25 of November 2008 20:26:24 Koen Kooi napisa=C5=82(a):

> Jason Kridner pointed out that we don't actually put the license in
> the resulting packages, making it hard for finding the license if you
> only have a bunch or packages.

Ugly we are.

> Now the RFC part:
>
> Allow URLs in the LICENSE field for lesser know licenses and/or
> click-through licenses.

> Related to that: a class that would take a text file and generate a
> preinsts that shows the textfile and prompts to accept it (or not)
> would be awesome as well.

Only if there will be a place on storage where informations which=20
licenses user accepted would be kept - I do not like to click "Yes, I=20
accept this license" 6 times on each system update.

You also have to think about graphical package managers here.

> Back to the point: what do you think of allowing URLs in the LICENSE
> field?

Show me code which will make use of it first? Why not add license to=20
SRC_URI?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




