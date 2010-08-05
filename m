Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Ogv1q-0008Kx-RD
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 09:38:22 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 529554669
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Aug 2010 11:42:44 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Aug 2010 11:38:00 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <E1OguCD-00023v-03@melo.openembedded.org>
	<20100805071201.GB29578@jama>
In-Reply-To: <20100805071201.GB29578@jama>
MIME-Version: 1.0
Message-Id: <201008051138.00510.khimov@altell.ru>
X-Altell-MailScanner-ID: 529554669.1E1B0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Roman I Khimov : bitbake.conf: trust server certificate when doing svn over https
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
X-List-Received-Date: Thu, 05 Aug 2010 07:38:32 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 05 =D0=B0=D0=B2=D0=B3=D1=83=D1=
=81=D1=82=D0=B0 2010 11:12:01 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Martin Jansa =
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Maybe we should add also
> --accept theirs-full (just in case)
> --force (to force overwrite of existing files)
>=20
> ie
> matchbox-panel-2-icon-themes_0.0.1.bb
> matchbox-panel-2_svn.bb
> are checkouting/updating tiwo different SRCREVs and every few builds you
> end up removing svn checkout from downloads dir, just because it
> refuses to upgrade to newer revision (applets dir already exists there).
>=20
> Any objections (someone intentionaly keeping dirty checkouts in his
> DL_DIR)?

No objections here.


