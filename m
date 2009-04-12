Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LsqAz-0003Zo-LN
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Apr 2009 05:16:12 +0200
Received: by yx-out-1718.google.com with SMTP id 3so1098401yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Apr 2009 20:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OmulnzJyVTcs5E3UXio/vqGTfbZXhe6O7+/1oi0pEvw=;
	b=E5oLLRwuOtU7y01ljv4cy1ujttEupFSQijtkCXUJbwOggnBH6efzfhfkp6vjIC9Pqu
	cAOaU2RDnIZskKwHwCId6KmpGr84Ce/y0SPldRXNW1mtlxYYaWjS37FcJOoOIy0Wg1e5
	4f1G33sTdEJIHlerqZzhhCBy0pArqleKBt8Fw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=k/Q6pUFiEjBrk+MozXEixdzCxCSScB6IHmPFoh3e4R2OjBWrGJB+NI+zFqidfRKQ82
	0ZdgfKJjOByUiCpoWskJ7y/rVm0CqANhUULDvLI/CHFE/6HfGRTxcGNhF97n9Xdsxv7V
	0bPlZpF38GocISfjs8TURJePnazRtmGI8nbjw=
MIME-Version: 1.0
Received: by 10.100.227.18 with SMTP id z18mr4984104ang.67.1239505963900; Sat, 
	11 Apr 2009 20:12:43 -0700 (PDT)
In-Reply-To: <1239455059.9086.1.camel@port4>
References: <20090407212047.6CF5A1893D2@amethyst.openembedded.net>
	<1239455059.9086.1.camel@port4>
Date: Sat, 11 Apr 2009 20:12:43 -0700
Message-ID: <19c1b8a90904112012j385dff9fn96906875cf2cd032@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.44.158
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Stanislav Brabec : autoconf213-native: Added old autoconf for fennec recipe .
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
X-List-Received-Date: Sun, 12 Apr 2009 03:16:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2009 at 6:04 AM, GNUtoo <GNUtoo@no-log.org> wrote:
> On Tue, 2009-04-07 at 23:20 +0200, GIT User account wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 949728423681eda38e5e34b84cd3281bba71fdf7
>> URL: =C2=A0 =C2=A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=
=3Dcommit;h=3D949728423681eda38e5e34b84cd3281bba71fdf7
>>
>> Author: Stanislav Brabec <utx@penguin.cz>
>> Date: =C2=A0 Tue Apr =C2=A07 21:16:38 2009 +0000
>>
>> autoconf213-native: Added old autoconf for fennec recipe.
>>
>> ---
>>
>> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 ++++
>> =C2=A0recipes/autoconf/autoconf213-native_2.13.bb | =C2=A0 =C2=A09 +++++=
++++
>> =C2=A0recipes/autoconf/autoconf213_2.13.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A05 +++++
>> =C2=A0recipes/mozilla/fennec_hg.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A04 files changed, 19 insertions(+), 1 deletions(-)
>>
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> index 0b05edf..48edc83 100644
>> --- a/conf/checksums.ini
>> +++ b/conf/checksums.ini
>> @@ -1970,6 +1970,10 @@ sha256=3Dfce50bc26351bbbe31154d9a734cb433ec8fb404=
efc5febd50c149e5eaf62449
>> =C2=A0md5=3Ddc3fc7209752207c23e7c94ab886b340
>> =C2=A0sha256=3D636eef7f400c2f3df489c0d2fa21507e88692113561e75a40a26c52bc=
422d7fc
>>
>> +[ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.13.tar.gz]
>> +md5=3D9de56d4a161a723228220b0f425dc711
>> +sha256=3Df0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd79=
1e
>> +
>> =C2=A0[ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.57.tar.bz2]
>> =C2=A0md5=3D407ea53787ce13f5ca427e9a51e05bc2
>> =C2=A0sha256=3De1035aa2c21fae2a934d1ab56c774ce9d22717881dab8a1a5b16d294f=
b793489
>> diff --git a/recipes/autoconf/autoconf213-native_2.13.bb b/recipes/autoc=
onf/autoconf213-native_2.13.bb
>> new file mode 100644
>> index 0000000..3954ef3
>> --- /dev/null
>> +++ b/recipes/autoconf/autoconf213-native_2.13.bb
>> @@ -0,0 +1,9 @@
>> +require autoconf213_${PV}.bb
>> +
>> +DEPENDS =3D "m4-native gnu-config-native"
>> +RDEPENDS_${PN} =3D "m4-native gnu-config-native"
>> +
>> +S =3D "${WORKDIR}/autoconf-${PV}"
>> +FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/autoconf-=
${PV}"
>> +
>> +inherit native
>> diff --git a/recipes/autoconf/autoconf213_2.13.bb b/recipes/autoconf/aut=
oconf213_2.13.bb
>> new file mode 100644
>> index 0000000..022f696
>> --- /dev/null
>> +++ b/recipes/autoconf/autoconf213_2.13.bb
>> @@ -0,0 +1,5 @@
>> +require autoconf.inc
>> +SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
>> +PR =3D "r1"
>> +EXTRA_OECONF =3D "--program-transform-name=3Ds/\$/2.13/"
>> +EXTRA_OEMAKE =3D 'acdatadir=3D"${datadir}/autoconf-${PV}" infodir=3D"${=
datadir}/autoconf-${PV}/info"'
>> diff --git a/recipes/mozilla/fennec_hg.bb b/recipes/mozilla/fennec_hg.bb
>> index fad2203..18286a0 100644
>> --- a/recipes/mozilla/fennec_hg.bb
>> +++ b/recipes/mozilla/fennec_hg.bb
>> @@ -1,5 +1,5 @@
>> =C2=A0DESCRIPTION =3D "Mozilla Mobile browser"
>> -DEPENDS +=3D "cairo alsa-lib "
>> +DEPENDS +=3D "autoconf213-native cairo alsa-lib"
>>
>> =C2=A0PV =3D "0.9+1.0b2pre"
>> =C2=A0MOZPV =3D "1.0b2pre"
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> I've a question about this commit:
> if someone bitbakes autoconf-2.13 does it overwrite the one that there
> was before?

it seems it can coexist with new autotools as it uses
--program-transform-name there might be other problems I dont know.
but that said I think we should try to upgrade whatever package needs
this old autotools
version.

Thx

-Khem


