Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcos@2mi.com.br>) id 1LjFUb-00005V-JM
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Mar 2009 17:16:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 7046E50277F0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 13:21:12 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Svedezcy24zb
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 13:21:08 -0300 (BRT)
Received: from [192.168.15.101] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 60A28502762D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2009 13:21:08 -0300 (BRT)
From: Marcos Amorim <marcos@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1236890935.6250.26.camel@northpole>
References: <1236890935.6250.26.camel@northpole>
Organization: 2MI Tecnologia
Date: Mon, 16 Mar 2009 13:16:11 -0300
Message-Id: <1237220171.4020.4.camel@faraday>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: marcos@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,HTML_MESSAGE,
	RDNS_NONE,SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: calibrateproto git tag
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
X-List-Received-Date: Mon, 16 Mar 2009 16:16:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

libxcalibrate_git add tag=20


git diff packages/xorg-lib/libxcalibrate_git.bb
diff --git a/packages/xorg-lib/libxcalibrate_git.bb
b/packages/xorg-lib/libxcalibrate_git.bb
index f9e1587..7f889df 100644
--- a/packages/xorg-lib/libxcalibrate_git.bb
+++ b/packages/xorg-lib/libxcalibrate_git.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "virtual/libx11 calibrateproto libxext"
 PV =3D "0.0+gitr${SRCREV}"
 PE =3D "1"
=20
-SRC_URI =3D
"git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3Dgit"
+SRC_URI =3D
"git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=3Dgit;=
tag=3Dmaster"
=20
 S =3D "${WORKDIR}/git"



Em Qui, 2009-03-12 =C3=A0s 17:48 -0300, Jader H. Silva escreveu:

> xorg proto calibrateproto git tag added.
>=20
> ---
>  packages/xorg-proto/calibrateproto_git.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/packages/xorg-proto/calibrateproto_git.bb
> b/packages/xorg-proto/calibrateproto_git.bb
> index fe9e1a4..08cefa3 100644
> --- a/packages/xorg-proto/calibrateproto_git.bb
> +++ b/packages/xorg-proto/calibrateproto_git.bb
> @@ -6,5 +6,5 @@ PV =3D "0.0+gitr${SRCREV}"
>  PR =3D "r1"
>  PE =3D "1"
> =20
> -SRC_URI =3D
> "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto;protocol=3D=
git"
> +SRC_URI =3D
> "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto;protocol=3D=
git;tag=3Dmaster"
>  S =3D "${WORKDIR}/git"

