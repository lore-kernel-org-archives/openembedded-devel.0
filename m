Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QEdmJ-0007Ne-Gi
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 10:37:51 +0200
Received: from koontz.localnet ([10.115.0.175]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 26 Apr 2011 10:40:10 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 10:35:23 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <1303760088-28474-1-git-send-email-sgh@sgh.dk>
	<1303805410.4073.15.camel@mattotaupa>
In-Reply-To: <1303805410.4073.15.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201104261035.23415.sgh@sgh.dk>
X-OriginalArrivalTime: 26 Apr 2011 08:40:10.0218 (UTC)
	FILETIME=[8D7354A0:01CC03ED]
Subject: Re: [PATCH] wvstreams: Cleaned up recipe.
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
X-List-Received-Date: Tue, 26 Apr 2011 08:37:51 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tirsdag 26 april 2011 10:10:10 skrev Paul Menzel:
>=20
> at least the addition DBus support is not a clean up in my opinion and
> should be an extra patch.

True, but then again adding it as three patches would yield the same result=
 in=20
the end, so it might have been better to keep wvstreams_4.6.0 also, for cas=
es=20
when 4.6.1+dbus would hurt.

>=20
> > * Made PAM-support conditional.
>=20
> I would make a commit/patch for each change, but other developers
> disagree with me in that point.

I see your point.

>=20
> Can you think of a reason, why Khem did not use the default autotools
> configure when adding the recipe? I am adding him to CC.
>=20

No.

=2D-=20
S=F8ren Holm


