Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jluebbe@lasnet.de>) id 1KLNH4-00055h-1V
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jul 2008 21:11:50 +0200
Received: from a061.apm.etc.tu-bs.de ([134.169.172.61])
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KLNFw-0005Mn-Dp by authid <jluebbe@lasnet.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2008 21:10:42 +0200
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jluebbe@lasnet.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200807212346.44576.mickey@vanille-media.de>
References: <g62ve3$baq$1@ger.gmane.org>
	<200807212346.44576.mickey@vanille-media.de>
Date: Tue, 22 Jul 2008 21:10:41 +0200
Message-Id: <1216753841.11524.16.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.3
Subject: Re: please stop updating efl SRCDATE, it breaks builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 22 Jul 2008 19:11:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2008-07-21 at 23:46 +0200, Michael 'Mickey' Lauer wrote:
> > Please think of all this when wanting to bump SRCDATE the next time.
>=20
> Uhm... in all earnest you want to request people to stop updating a softw=
are=20
> because of upstream source fetching problems? Sorry, this won't work.
>=20
> I understand your problem, but I would have expected a more constructive=20
> proposal than a recommendation to stop updating software in OE.

How about fetching the source from their git mirror
(http://staff.get-e.org/)?

--=20
Jan L=C3=BCbbe <jluebbe@lasnet.de>            http://sicherheitsschwankung.=
de
 gpg-key      1024D/D8480F2E 2002-03-20
 fingerprint  1B25 F91F 9E7B 5D4F 1282  02D6 8A83 8BE4 D848 0F2E



