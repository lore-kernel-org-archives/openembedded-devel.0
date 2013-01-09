Received: from mail-bk0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TsuQB-000789-NP
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 13:06:18 +0100
Received: by mail-bk0-f44.google.com with SMTP id w11so856988bku.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2013 03:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=SgvHyyarNXtV4gM8nmd01vGuhwtFRHGHZg8uCv4DpQk=;
	b=GQQs4IVXnEbzI0wzxB8iIS7toRDgs42lKsM7iSX5S2NbfnxxdVbvJeOCDKcIY8DLD/
	w4M2re77FNKKDjxuxRATNhsnnNFj1/aEVIvktUg1zBZsjrARk8w16lUTurBi7T7sEYOW
	dBAgVkwcRZT4XyksCsqkMj8LZlYNWKlM42+8UyKHfzKcJ9GL/R3drlGvLpOlkRaRQldd
	TskH3xSIzssXS+wbSUZ7nae3umGLJsLTr+QeiZpl2ggDKIVEuSFtFWghXnz0RV9OuJFO
	APXq+pcO3vTn/QSpfvdd8cN27w5NIllgbsoGFD/m8ZLb+3ANdm8447MOsHtfuqfmPq8n
	5nmw==
X-Received: by 10.204.149.85 with SMTP id s21mr32727274bkv.37.1357732263585;
	Wed, 09 Jan 2013 03:51:03 -0800 (PST)
Received: from ?IPv6:2001:610:612::dc31:ecd3:29e9:cbe2?
	([2001:610:612:0:dc31:ecd3:29e9:cbe2])
	by mx.google.com with ESMTPS id hm8sm48328249bkc.10.2013.01.09.03.51.02
	(version=SSLv3 cipher=OTHER); Wed, 09 Jan 2013 03:51:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130109105232.GH3722@jama.palm1.palmone.com>
Date: Wed, 9 Jan 2013 12:51:02 +0100
Message-Id: <1E683BAA-B513-4486-A48E-817660404DA2@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
	<1356098450-27475-5-git-send-email-koen@dominion.thruhere.net>
	<20130109105232.GH3722@jama.palm1.palmone.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnSXPc6Wp0q1biUUQ2f3lfMalwZnMqF4mMs2ben/SNcF2wr85PVG+4zWke+LWebk8Vj9oP5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-multimedia][PATCH 5/6] wscan: add 20121111
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
X-List-Received-Date: Wed, 09 Jan 2013 12:06:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jan. 2013, om 11:52 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Fri, Dec 21, 2012 at 03:00:49PM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../recipes-dvb/wscan/wscan_20121111.bb            |   16 =
++++++++++++++++
>> 1 files changed, 16 insertions(+), 0 deletions(-)
>> create mode 100644 =
meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
>>=20
>> diff --git a/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb =
b/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
>> new file mode 100644
>> index 0000000..9254c43
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY =3D "Wscan is an ATSC/DVB-C/S/T channel scanner that doesn't =
require an initial frequency table"
>> +HOMEPAGE =3D "http://wirbel.htpc-forum.de/w_scan/index2.html"
>> +
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa63a"
>> +
>> +SRC_URI =3D =
"http://wirbel.htpc-forum.de/w_scan/w_scan-${PV}.tar.bz2"
>> +SRC_URI[md5sum] =3D "30da05747fed9988e11ebc7745f5e71f"
>> +SRC_URI[sha256sum] =3D =
"5e51e5f1c124a8ed70608b4dbf7376adb2b1bf6a48a65b746076263b2589afe5"
>> +
>> +S =3D "${WORKDIR}/w_scan-${PV}"
>> +
>> +inherit autotools
>> +
>> +FILES_${PN} +=3D "${datadir}"
>=20
> Some other changes in oe-core/meta-oe broke this wscan version too :/
> | scan.c: In function 'set_frontend':
> | scan.c:1819:44: error: 'DTV_DVBT2_PLP_ID' undeclared (first use in =
this function)
> | scan.c:1819:44: note: each undeclared identifier is reported only =
once for each function it appears in
> | make[1]: *** [scan.o] Error 1
>=20
> Complete log:
> =
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/qemuarm/2013=
0109091926.log

It's likely to be a mismatch with the DVB api version from the kernel =
headers. I hope to have some time to clean up these patches next week :/

regards,

Koen=


