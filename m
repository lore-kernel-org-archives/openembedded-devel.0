Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3590571A5D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Oct 2016 15:46:00 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id e6so34023119pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Oct 2016 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=HTRka7yUZqTo8S6vFYD+9XH4ec73m5JD5Cz3t7xCm00=;
	b=pwJGNmcZy9DVbDVDccB5h/JUUvjSLYPUv3nTyzdeb0FIRnOCNekMFdKiRVkkeMcCae
	+A2hG5A22DiKTZXnSJW/eVYwX3mKd6Ex/hw98OZvtRVqboRG+Xt6HRe9JWZ3Ab2aKHbE
	/d2DJP4zoMp3nlSDd0uvDIpL2QaTyLvVRkohgKeH3wT+O8dPj/gw5094nDa6D955sGBv
	bm5zlyt9rpjpOWqSp12YSLwwWD8hkPpfyHDqo5Us6VNUylbspRoyJUGmunecWmVtx9sw
	EsZ81O2ufXAOucCn9EIJJ2QB4ZrlvEEa2n//0y6kUBvi4S5egrktBff8xErUkNFXnnuC
	DL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=HTRka7yUZqTo8S6vFYD+9XH4ec73m5JD5Cz3t7xCm00=;
	b=fgBsTtTLyaiLReQnUrjRHRBux6KoqL2g/Y3WU+0F3IrC/RU69sshVxiltno2WDkBoG
	1iJ8zBeSHs8TxnQZ2Bu0XpmO+Lil/S4Z95YoT1r8BE6OkHE9C4/sd2BgmopPwth7Swji
	LpdpcP3MvAOMHLMgn63L5zcYpiuV5v91pGTxZ1Owbu0gOGG0nwVdQq1xNlO16PL3XkYk
	qIkoKF6HhLDFE+z4vvzFDgaOtMKlxkOBgJ8G8y2CmYQ2z1hs5VooRi6n+rqbQ2XIJK/+
	mfaxWlXXN9rtxn3tdhpHj+/OxcLlPemX+TlwekG1bkd0s1JfaHXsIV/tz+Z5jZFj6cKm
	/3FQ==
X-Gm-Message-State: AA6/9Rmy9/mqhkHqaZkspkG3Myi4z/LfXiaI8xv+w1AbliVguFqDynVzbaiil4wQDVqtow==
X-Received: by 10.98.222.3 with SMTP id h3mr7948931pfg.168.1475682362000;
	Wed, 05 Oct 2016 08:46:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2889:3f0b:1a74:f67a?
	([2601:202:4001:9ea0:2889:3f0b:1a74:f67a])
	by smtp.gmail.com with ESMTPSA id
	s29sm21801999pfi.55.2016.10.05.08.46.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Oct 2016 08:46:01 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1473387111-23110-1-git-send-email-akuster808@gmail.com>
	<B8D42A36-5D39-4F04-9A13-7A9507505170@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <fe098cdc-efa2-7823-afb1-9deb0a9657a9@gmail.com>
Date: Wed, 5 Oct 2016 08:46:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <B8D42A36-5D39-4F04-9A13-7A9507505170@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] wireshark: update to 2.2
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
X-List-Received-Date: Wed, 05 Oct 2016 15:46:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 10/02/2016 04:13 PM, Khem Raj wrote:
>> On Sep 8, 2016, at 7:11 PM, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> remove unused config params.
>> Drop PE
> Thats going to cause problem for feeds
k. There is a an new update was just release. I will restore the PE when 
I send the update.

- armin
>
>> Drop do_configure_prepend
>> update PACKAGECONFIG's for graphics
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>> .../{wireshark_2.0.5.bb => wireshark_2.2.0.bb}     | 24 ++++++----------------
>> 1 file changed, 6 insertions(+), 18 deletions(-)
>> rename meta-networking/recipes-support/wireshark/{wireshark_2.0.5.bb => wireshark_2.2.0.bb} (69%)
>>
>> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
>> similarity index 69%
>> rename from meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
>> rename to meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
>> index 31ca4d2..dca3be6 100644
>> --- a/meta-networking/recipes-support/wireshark/wireshark_2.0.5.bb
>> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
>> @@ -8,21 +8,16 @@ DEPENDS = "pcre expat glib-2.0 sbc"
>>
>> SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
>>
>> -SRC_URI[md5sum] = "627b5fc6cf0aeca196c75debd5e69b14"
>> -SRC_URI[sha256sum] = "0ce0241330828973f5b4efee422a3760cab8ce0b41e7721c4b9fd185be1bb10b"
>> -
>> -PE = "1"
>> +SRC_URI[md5sum] = "c7de0997f74934f25b456846cf75cb81"
>> +SRC_URI[sha256sum] = "a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f80d4388ad2f3f1104"
>>
>> inherit autotools pkgconfig perlnative
>>
>> ARM_INSTRUCTION_SET = "arm"
>>
>> -# Works with either gtk+ or gtk3.
>> -WHICH_GTK = "gtk+"
>>
>> PACKAGECONFIG ?= "libpcap gnutls libnl libcap"
>> PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk2 graphics", "", d)}"
>> -PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)}"
>> #PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "gtk3", "", d)}"
>>
>> PACKAGECONFIG[libcap] = "--with-libcap=${STAGING_LIBDIR}, --with-libcap=no --enable-pcap-ng-default , libcap"
>> @@ -30,10 +25,9 @@ PACKAGECONFIG[libpcap] = "--with-pcap=${STAGING_LIBDIR} --with-pcap-remote, --wi
>> PACKAGECONFIG[libsmi] = "--with-libsmi=yes, --with-libsmi=no, libsmi"
>> PACKAGECONFIG[libnl] = "--with-libnl=yes, --with-libnl=no, libnl"
>> PACKAGECONFIG[portaudio] = "--with-portaudio=yes, --with-portaudio=no, portaudio-v19"
>> -PACKAGECONFIG[gtk2] = "--with-gtk2=yes, --with-gtk2=no, gtk+"
>> -PACKAGECONFIG[gtk3] = "--with-gtk3=yes, --with-gtk3=no, gtk+3"
>> -PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
>> -PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
>> +PACKAGECONFIG[gtk2] = "--with-gtk=2, , gtk+"
>> +PACKAGECONFIG[gtk3] = "--with-gtk=3, , gtk+3"
>> +PACKAGECONFIG[graphics] = "--enable-wireshark, --with-gtk=no --disable-wireshark,"
>> PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
>> PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
>> PACKAGECONFIG[ssl] = "--with-ssl=yes, --with-ssl=no, openssl"
>> @@ -44,15 +38,9 @@ PACKAGECONFIG[geoip] = "--with-geoip=yes, --with-geoip=no, geoip"
>> PACKAGECONFIG[plugins] = "--with-plugins=yes, --with-plugins=no"
>>
>> # these next two options require addional layers
>> -PACKAGECONFIG[adns] = "--with-adns=yes, --with-adns=no, adns"
>> PACKAGECONFIG[c-ares] = "--with-c-ares=yes, --with-c-ares=no, c-ares"
>>
>> -EXTRA_OECONF += "--with-qt=no --enable-usr-local=no --enable-tshark --enable-rawshark"
>> -
>> -do_configure_prepend() {
>> -    # force to use fallback
>> -    sed -i -e '/^glib_prefix/s/=.*$/=""/' ${S}/aclocal-flags
>> -}
>> +EXTRA_OECONF += "--with-qt=no --enable-tshark --enable-rawshark"
>>
>> ALLOW_EMPTY_${PN} = "1"
>> INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


