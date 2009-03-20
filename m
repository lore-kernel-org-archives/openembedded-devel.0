Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lkd8D-000412-QS
	for openembedded-devel@openembedded.org; Fri, 20 Mar 2009 12:43:21 +0100
Received: (qmail 26445 invoked by uid 813007); 20 Mar 2009 11:42:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Mar 2009 11:42:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2009 12:42:07 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc7-00188-gebdcc81-dirty; KDE/4.2.1;
	x86_64; ; )
References: <alpine.DEB.1.00.0903191522200.10548@localhost.localdomain>
In-Reply-To: <alpine.DEB.1.00.0903191522200.10548@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200903201242.13150.marcin@juszkiewicz.com.pl>
Subject: Re: rpm-native problem?
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
X-List-Received-Date: Fri, 20 Mar 2009 11:43:22 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 19 marca 2009 o 23:30:29 Theodore A. Roth napisa=C5=82(a):

> I just did a pull this morning and am getting this failure when
> parsing BitBake files:

> NOTE: Handling BitBake files: \ (0697/6606) [10 %]__builtin__:6:
> DeprecationWarning: raising a string exception is deprecated
> NOTE: No Python in STAGING_INCDIR. Forgot to build python-native
> ?

> Is this problem related to the following patch?

Show me your local.conf - I think that you have python-native in=20
ASSUME_PROVIDED which is wrong.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




