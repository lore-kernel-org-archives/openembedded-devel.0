Received: from pasmtpb.tele.dk ([80.160.77.98])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <sgh@sgh.dk>)
	id 1NXEVF-0000uG-Es for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 14:52:20 +0100
Received: from mail.mikrofyn.com (cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk
	[93.167.193.22])
	by pasmtpB.tele.dk (Postfix) with ESMTP id 6692BE30A10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 14:49:34 +0100 (CET)
Received: from koontz.localnet ([10.0.1.94]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 19 Jan 2010 14:50:07 +0100
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jan 2010 14:49:31 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-020633rc4-generic; KDE/4.3.4; i686; ; )
References: <1263904767-23489-1-git-send-email-sgh@sgh.dk>
	<1263908226.10980.105.camel@mattotaupa.wohnung.familie-menzel.net>
In-Reply-To: <1263908226.10980.105.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
Message-Id: <201001191449.31769.sgh@sgh.dk>
X-OriginalArrivalTime: 19 Jan 2010 13:50:07.0468 (UTC)
	FILETIME=[4F6DFAC0:01CA990E]
X-SA-Exim-Connect-IP: 80.160.77.98
X-SA-Exim-Mail-From: sgh@sgh.dk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Make perl-native_* depend on make-native.
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
X-List-Received-Date: Tue, 19 Jan 2010 13:52:20 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tirsdag 19 januar 2010 14:37:06 skrev Paul Menzel:
>=20
> Please read [1] and especially =BBInclude a Signed-off-by:=AB (also possi=
ble
> in a reply to this message). What error gets fixed with your patch.
> `perl-native_*` seem such needed packages, that it is strange nobody
> else experienced this.

Apparently make-native is not in the dependency tree of perl-native.
Therefore the compilation fails.

Sorry. I did not notice perl.inc

=2D-=20
Mvh./ Best regards

S=F8ren Holm


