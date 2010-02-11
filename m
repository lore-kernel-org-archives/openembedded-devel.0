Received: from mail2.zera.de ([62.225.102.139])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.mueller@zera.de>) id 1NfUge-0005u4-41
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:46:15 +0100
Received: from s-zera-ex01.zera.local ([192.168.7.1]) by
	s-zera-ex01.zera.local ([192.168.7.1]) with mapi;
	Thu, 11 Feb 2010 09:43:30 +0100
From: =?iso-8859-1?Q?M=FCller=2C_Andreas?= <a.mueller@zera.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Feb 2010 09:43:28 +0100
Thread-Topic: [oe] xfwm4 themes from xfwm4-themes are not packed
Thread-Index: Acqq9fbfm8j/tBSoR2uJsyL428HinAAABXQA
Message-ID: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2DE@s-zera-ex01.zera.local>
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
	<001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
	<B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
	<hl0fnq$nio$2@ger.gmane.org>
In-Reply-To: <hl0fnq$nio$2@ger.gmane.org>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.225.102.139
X-SA-Exim-Mail-From: a.mueller@zera.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xfwm4 themes from xfwm4-themes are not packed
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
X-List-Received-Date: Thu, 11 Feb 2010 08:46:15 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Koen

I did but for some reason it is not copied after adduser..

Regards

Andreas

-----Urspr=FCngliche Nachricht-----
Von: Koen Kooi [mailto:k.kooi@student.utwente.nl]
Gesendet: Donnerstag, 11. Februar 2010 09:39
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] xfwm4 themes from xfwm4-themes are not packed

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-02-10 09:29, M=FCller, Andreas wrote:
> Hi John,
>
> Thanks for support.
>
> While you are working on that (you offered support -> I ask for more :-):
>
> How about adding recipes for slim also? I stole the recipe&patches from g=
it://git.openpandora.org/openpandoraoe.git. The only modifications to get i=
t work was
> 1. Add sessreg in my recipe (although it is part RDEPEND within slim_1.3.=
1.bb ?)
> 2. On the target I need to cp /etc/xdg/xfce4/xinitrc /home/<LoginUser>/.x=
initrc. I wanted to modify the recipe in that way that login_cmd links dire=
ctly to the file /etc/xdg/xfce4/xinitrc but...

For 2. you should be able to add said .xinitrc to /etc/skel/ so every
new user will get it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLc8I7MkyGM64RGpERAh78AKCDE0xaPt8VA3gZ3DnpZTS2pfMN4gCgk4ks
bBEGtoLUfNKfvYpylH7Yb90=3D
=3DODO+
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

http://www.zera.de

ZERA  GmbH, Hauptstrasse 392, 53639 Koenigswinter
Geschaeftsfuehrer:  Dr. Prosper Suwelack, Rainer Otto
Sitz der Gesellschaft:  Koenigswinter; Handelsregister HRB  7073
Registergericht: Amtsgericht Siegburg.

-----------------------------------------------------------------


