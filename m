Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUB5n-0006Fj-QO
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 07:14:11 +0200
Received: by bwz5 with SMTP id 5so135105bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 22:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=wXZs5V2wTb/hphSyMY6TFMSGONLLSUMA8s4Qu9ihOTI=;
	b=DmHHQt+NYW33EcnDwDlO1sBvvdBpc6/P7imYvyQuYVvrl1Xeelp4oHK7NRnB8IHIjK
	4VlGuvCCb7NcRZxZXtvccuisuUl8JSMH/tlMq7VxScdW2bVmK7P2iw+Wn7lWk4/CQpU8
	jLPuyUUV+y4SZCI9umXAgEyBupr9Prfnvhyng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=C1UNKin+CyViC5FIqhUBreDzjv8JcwloInvbXmVtzkJrNc3Te2h3W6aHet42zI/kOY
	juHUbCsZ7a2XF8w5d1ZldTXmCyA0ZJGwFw3VIiXSvyL23QXJWzD2P5s4F3VPSmU8KF8I
	0LQZ9CMXmxVVN1bOhqmd5NK7MgTZUxj1GbR38=
Received: by 10.204.233.11 with SMTP id jw11mr232052bkb.32.1307509853356;
	Tue, 07 Jun 2011 22:10:53 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id j7sm166588bka.20.2011.06.07.22.10.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 22:10:52 -0700 (PDT)
Date: Wed, 8 Jun 2011 07:10:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110608051050.GE23137@jama.jama.net>
References: <iskpst$avh$1@dough.gmane.org>
 <20110607185320.GB2512@denix.org>
MIME-Version: 1.0
In-Reply-To: <20110607185320.GB2512@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance] Pull request #20
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
X-List-Received-Date: Wed, 08 Jun 2011 05:14:11 -0000
X-Groupsio-MsgNum: 32563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline

--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2011 at 02:53:20PM -0400, Denys Dmytriyenko wrote:
> And one more question, not directly related to this pull request - has an=
yone=20
> else seen cgit.oe.org showing the last commit instead of the log of all t=
he=20
> commits in a branch? From time to time I keep seeing this odd behavior...

Yes I've noticed it few times too.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3vBFoACgkQN1Ujt2V2gBz36ACdHgo4D89a4KkFS6jSEjzfnq+W
YWEAoJ6x9wCHi3qvx7h3k3H/DObZUxMV
=Sz9Q
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--
