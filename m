Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QISln-0000KH-4g for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 23:41:07 +0200
Received: from smtp06.msg.oleane.net (smtp06.mail.priv [172.17.20.115]) 
	by smtp-out06.msg.oleane.net with ESMTP id p46LcQCX032169
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 May 2011 23:38:27 +0200
Received: from [192.168.1.106] (AMarseille-551-1-71-241.w80-9.abo.wanadoo.fr
	[80.9.126.241]) (authenticated)
	by smtp06.msg.oleane.net (MTA) with ESMTP id p46LIFR5011421
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 May 2011 23:18:16 +0200
X-Oleane-Rep: REPA
Message-ID: <4DC46597.90606@cioinfoindus.fr>
Date: Fri, 06 May 2011 23:18:15 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DC2C5DA.10909@cioinfoindus.fr>
	<1304621939.18082.6.camel@mattotaupa>
In-Reply-To: <1304621939.18082.6.camel@mattotaupa>
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.6.210316 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: Re: [PATCH v4] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Fri, 06 May 2011 21:41:07 -0000
X-Groupsio-MsgNum: 31668
Content-Type: multipart/mixed; boundary="------------040502040006030400020808"

--------------040502040006030400020808
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out06.msg.oleane.net id p46LcQCX032169

Dear Paul,

Le 05/05/2011 20:58, Paul Menzel a =C3=A9crit :


[...]

> I guess that information would be enough.
>
> I would think that the following printed by `bitbake mypaint` would be
> enough. Maybe add the OE repository revision your distribution is based
> on.
>
>          Build Configuration:
>          BB_VERSION        =3D "1.12.0"
>          METADATA_BRANCH   =3D "73593c5"
>          METADATA_REVISION =3D "7f22ddc"
>          TARGET_ARCH       =3D "arm"
>          TARGET_OS         =3D "linux-gnueabi"
>          MACHINE           =3D "beagleboard"
>          DISTRO            =3D "angstrom"
>          DISTRO_VERSION    =3D "v20110505"
>          TARGET_FPU        =3D "hard"
>
I'm using bitbake 1.8, that's the reason why these informations are not=20
printed when I execute the recipe.
Can I safely swap to bitbake 1.12.0 with recipes and classes quite old=20
in my workspace ?
Thanks for your advise on this point.

--------------040502040006030400020808
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"
Content-Transfer-Encoding: base64

YmVnaW46dmNhcmQNCmZuOkNocmlzdGlhbiAgQ2hhcnJleXJlDQpuOkNoYXJyZXlyZTtDaHJpc3Rp
YW4gDQpvcmc6Q0lPIEluZm9ybWF0aXF1ZSBJbmR1c3RyaWVsbGUNCmFkcjtkb206OzsxMSBBdmVu
dWUgTWFyaWdueTtNYXJzZWlsbGU7OzEzMDE0DQplbWFpbDtpbnRlcm5ldDpjaHJpc3RpYW4uY2hh
cnJleXJlQGNpb2luZm9pbmR1cy5mcg0KdGVsO3dvcms6MDQgOTUgMDUgMTkgNDENCnVybDpodHRw
Oi8vd3d3LmNpb2luZm9pbmR1cy5mcg0KdmVyc2lvbjoyLjENCmVuZDp2Y2FyZA0KDQo=

--------------040502040006030400020808--
