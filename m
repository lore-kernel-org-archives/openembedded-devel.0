Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 64EB178DD5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 18:34:02 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id t79-v6so8512132qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 11:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d7KtsbYA9+XB6ifPqHhVOGqGagdNy2TnWfZuGeCRajA=;
	b=TtxEqrIy+zL4Rgx3JJsJVP3rep42BAjjmcb1kjd0+1xxNA1/tpdN2J5fxX8zxwuqqY
	vZaoW1TK7CwPdIe6weXeZsN9Nki7z19xlW4anEWiburoE7f7mgYGItNvshgY1dw2ZeD/
	LO+WkZcse0v4bKkd/mC7UjNiSiD5/IMTlyzYEn5im6AWRiHVzdABcgrrGpMsxo1FfivY
	9l11louwqgvX1/yNp/wlraVijdbz7ZpEh3YDKL/kpsf5wj0DZzIH3js5Vdpr6frPHzHw
	0/Ql/GD8F2KYLp+f9LLZQJt7GVN9y+gqF+dG+cGDwSgvfh0pitvAVw2CQLfr45dNZsvf
	tdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d7KtsbYA9+XB6ifPqHhVOGqGagdNy2TnWfZuGeCRajA=;
	b=CzsIR3b23C96glkGFvlf5zweiFb/+cKj2Ft8ryOPCGkO8v7Jwmw7HJ5dUL40hz080T
	Z3+ZoMxh4glo4XcO4f2bNStn1IyyVySnG5DB8OePSwCWLJ8iW2vWUJopS+oPRhBI928o
	zOJCbmXvNiJdqFXBKqPYYllmNKZaac9XAB6rvEHxMCu+AYnCS4oqOI6hhRkTAn/Y5p/W
	bP0aGC82U5Km4cfzutA0cvxi9Frthmp85dpavUK11ifa7w72Ff++tdjumA52m7/qi3wy
	gJYyn/YzBPrA/6PJ8VTOnsnZklpbXoi6iMwdtrfmEeXN648DYD45ZqCE8e2HNTIuiHqf
	l2Ag==
X-Gm-Message-State: AOUpUlFjKqGDzq9SXjgeBF/Jm7qTFlLqbYt4Zk3HPkA4jzL2eg2ziFeu
	Y85SQsBv/Gt1xC0TqWGuXPXF10IKxJJPg0+mZvo=
X-Google-Smtp-Source: AAOMgpdYjNpR3V19Yq5kBHo3pE6a66LiGRKtkRDvl7tymZ+sXD/al0rby6RhLHS0V6YoUUxFmpxLahLjcrgKnWk/Bcw=
X-Received: by 2002:a37:a24f:: with SMTP id
	l76-v6mr16187247qke.406.1532975643086; 
	Mon, 30 Jul 2018 11:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <1532882465-3210-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spEi6G+gJMo1Wd-EpaY=-+KokOBcKjgjQp8ND7WOipwhg@mail.gmail.com>
	<bb053f36-0099-802b-b891-9302c6e90cbe@gmail.com>
In-Reply-To: <bb053f36-0099-802b-b891-9302c6e90cbe@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 11:33:52 -0700
Message-ID: <CAMKF1sqT5B1jia+=5+SemfM-jcRNnw9XGsJhED9QsUABjqZ6_Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][v3][PATCH] wireshark: update to 2.6.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 18:34:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Arm64 or mips64 or both is just fine

On Mon, Jul 30, 2018 at 8:08 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 07/29/2018 02:50 PM, Khem Raj wrote:
>
> Can you also validate if it=E2=80=99s building ok on musl
>
>
> Sure. any particular arch ? I have arm, arm64 and mips64  boards at home
> plus the normal qemu ones.
>
>
>
> On Sun, Jul 29, 2018 at 9:41 AM Armin Kuster <akuster808@gmail.com> wrote=
:
>
>> [v3]
>> Get  wireshark-gtk building again
>> split tshark, wireshark-gtk into their own pkgs
>>
>> [v2]
>> Fix native build, lemon is the only one needed natively
>>
>> [v1]
>> includes security fixes:
>>
>> wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
>> wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
>> wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675.
>> CVE-2018-14340.
>> wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
>> wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339=
.
>> wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
>> wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841.
>> CVE-2018-14368.
>> wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
>> wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../{wireshark_2.6.1.bb =3D> wireshark_2.6.2.bb}     | 34
>> +++++++++++++++-------
>>  1 file changed, 24 insertions(+), 10 deletions(-)
>>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb =
=3D>
>> wireshark_2.6.2.bb} (70%)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.b=
b
>> b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>> similarity index 70%
>> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>> rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>> index 91c5e96..1735ae7 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>> @@ -14,8 +14,8 @@ SRC_URI =3D "
>> https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
>>
>>  UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/src"
>>
>> -SRC_URI[md5sum] =3D "b0e9e5fe22e96d9fdfad18f750fa8f55"
>> -SRC_URI[sha256sum] =3D
>> "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
>> +SRC_URI[md5sum] =3D "086d235509717190d06554b2ab870209"
>> +SRC_URI[sha256sum] =3D
>> "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
>>
>>  PE =3D "1"
>>
>> @@ -23,8 +23,11 @@ inherit cmake pkgconfig pythonnative perlnative
>> upstream-version-is-even
>>
>>  ARM_INSTRUCTION_SET =3D "arm"
>>
>> +# Options: gtk+, gtk+3 and qt5
>> +GTK =3D "gtk+3"
>> +
>>  PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap sbc"
>> -PACKAGECONFIG_append_class-target =3D "
>> ${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk3 graphics ", "", d)=
}"
>> +PACKAGECONFIG_append_class-target =3D "
>> ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
>>
>>  PACKAGECONFIG_class-native =3D "libpcap gnutls ssl libssh"
>>
>> @@ -33,10 +36,8 @@ PACKAGECONFIG[libpcap] =3D
>> "-DENABLE_PCAP=3DON,-DENABLE_PCAP=3DOFF -DENABLE_PCAP_NG_DE
>>  PACKAGECONFIG[libsmi] =3D "-DENABLE_SMI=3DON,-DENABLE_SMI=3DOFF,libsmi"
>>  PACKAGECONFIG[libnl] =3D ",,libnl"
>>  PACKAGECONFIG[portaudio] =3D
>> "-DENABLE_PORTAUDIO=3DON,-DENABLE_PORTAUDIO=3DOFF, portaudio-v19"
>> -PACKAGECONFIG[gtk2] =3D "-DENABLE_GTK=3DON,-DENABLE_GTK=3DOFF, gtk+"
>> -PACKAGECONFIG[gtk3] =3D "-DENABLE_GTK3=3DON,-DENABLE_GTK3=3DOFF, gtk+3"
>> -PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON,-DENABLE_QT5=3DOFF
>> -DBUILD_wireshark=3DOFF, qtbase"
>> -PACKAGECONFIG[graphics] =3D ",-DENABLE_GTK=3DOFF,"
>> +PACKAGECONFIG[gtk+] =3D "-DENABLE_GTK=3DON -DBUILD_wireshark_gtk=3DON,
>> -DENABLE_GTK=3DOFF, gtk+"
>> +PACKAGECONFIG[gtk+3] =3D "-DENABLE_GTK3=3DON -DBUILD_wireshark_gtk=3DON=
,
>> -DENABLE_GTK3=3DOFF, gtk+3"
>>  PACKAGECONFIG[gnutls] =3D "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF, =
gnutls"
>>  PACKAGECONFIG[ssl] =3D ",,openssl"
>>  PACKAGECONFIG[krb5] =3D "-DENABLE_KRB5=3DON,-DENABLE_KRB5=3DOFF, krb5"
>> @@ -50,9 +51,9 @@ PACKAGECONFIG[lz4] =3D "-DENABLE_LZ4=3DON,-DENABLE_LZ4=
=3DOFF,
>> lz4"
>>
>>  # these next two options require addional layers
>>  PACKAGECONFIG[c-ares] =3D "-DENABLE_CARES=3DON,-DENABLE_CARES=3DOFF, c-=
ares"
>> +PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON -DBUILD_wireshark=3DON,
>> -DENABLE_QT5=3DOFF -DBUILD_wireshark=3DOFF, qtbase"
>>
>> -EXTRA_OECMAKE +=3D "-DBUILD_wireshark=3DON \
>> -                  -DENABLE_NETLINK=3DON \
>> +EXTRA_OECMAKE +=3D "-DENABLE_NETLINK=3DON \
>>                    -DBUILD_mmdbresolve=3DOFF \
>>                    -DBUILD_randpktdump=3DOFF \
>>                    -DBUILD_androiddump=3DOFF \
>> @@ -60,9 +61,11 @@ EXTRA_OECMAKE +=3D "-DBUILD_wireshark=3DON \
>>                    -DM_INCLUDE_DIR=3D${includedir} \
>>                    -DM_LIBRARY=3D${libdir} \
>>                   "
>> +CFLAGS_append =3D " -lm"
>> +
>>  do_install_append_class-native() {
>>         install -d ${D}${bindir}
>> -       for f in make-dissectors lemon make-taps
>> +       for f in lemon
>>         do
>>                 install -m 0755 ${B}/run/$f ${D}${bindir}
>>         done
>> @@ -75,6 +78,17 @@ do_install_append_class-target() {
>>         done
>>  }
>>
>> +PACKAGE_BEFORE_PN +=3D "tshark"
>> +PACKAGE_BEFORE_PN +=3D "${PN}-gtk"
>> +
>> +FILES_tshark =3D "${bindir}/tshark ${mandir}/man1/tshark.*"
>> +FILES_${PN}-gtk =3D "${bindir}/wireshark-gtk ${datadir}/icons
>> ${datadir}/appdata \
>> +                   ${datadir}/applications ${datadir}/wireshark
>> ${datadir}/mime \
>> +                   ${mandir}/man1/wireshark.* "
>> +
>>  FILES_${PN} +=3D "${datadir}*"
>>
>> +RDEPENDS_tshark =3D "wireshark"
>> +RDEPENDS_${PN}-gtk =3D "${@bb.utils.contains(" <$%7B@bb.utils.contains(=
>DISTRO_FEATURES",
>> "x11", "${GTK}", "", d)} wireshark"
>> +
>>  BBCLASSEXTEND =3D "native"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

