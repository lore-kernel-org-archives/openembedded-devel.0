Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 98BEB7156E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 17:45:16 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so5409214wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 10:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=AoaA/C7d4qnHlp+0PwElAs7ZwoHBfmv4XCCXWQ2Ot58=;
	b=aHg+vxoxgshS0wnLQSSjjotdO7MNgnmQIQ8z3W7rd1xN3EUeBzcJZTGOoONZl7yQSG
	LYq6EZPCTCMF4S5B0IuvcgzRUDEtmt3spd96pqkmlYI2lavGmj3Ervl2H0ZkT//GNA+l
	pytIEyuZ9t0lkpMdp3eEJd2zohiR+PsTppdFCCCAu7KiLuKk+F+LVsnSqtDXS+lO/Ttx
	qUGhnu9Ue2p6i2ZeYZEk2/u8Sr8w7XaUqaWoFlVkuijJnPOE/SeEGwbGv2mFC4ZnEbmf
	4lnpLRaPJiZvICmCQEgvLDGChTYgqWrDOniHDeNp0PQPiN91DAMhRqkUetGnjemg1mG0
	ST5w==
X-Received: by 10.180.74.227 with SMTP id x3mr5273436wiv.80.1411494317625;
	Tue, 23 Sep 2014 10:45:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ll20sm3053808wic.14.2014.09.23.10.45.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 10:45:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 19:46:02 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923174602.GG25706@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Patches from patchwork queued in master-next for jenkins build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Sep 2014 17:45:18 -0000
X-Groupsio-MsgNum: 52196
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bFsKbPszpzYNtEU6"
Content-Disposition: inline

--bFsKbPszpzYNtEU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

all pending changes should be now in master-next, please verify that
I haven't missed any.

I've replied on few which didn't apply and will probably reply on few more
after the build verification (if failures are detected).

Especially after long windows like this, it would be really helpful if
more contributors update status of patches on patchwork. There was a lot
of superseeded patches I had to manually find and mark as such.

Also it's safer to send vN patch every time you update the branch with
your whole pull request, I've noticed it 2 times in the e-mails, so I've
fetched them from repo instead of patchwork, but patchwork is my primary
tool to track the changes, so PATCHvN sent in e-mail is safer way for me
to notice that I need to refresh some patch.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bFsKbPszpzYNtEU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhsdoACgkQN1Ujt2V2gBxU2wCgkPwnP6a0xzNSrORr3YlGwSFL
TqsAn0wBesumkJ190xRtyJU0wdQmb3EO
=tW4g
-----END PGP SIGNATURE-----

--bFsKbPszpzYNtEU6--
