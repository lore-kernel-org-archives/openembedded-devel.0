Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7237E6074F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 04:56:40 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so7152067pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 20:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:subject:date:references:to:in-reply-to:message-id; 
	bh=sInfjrh9zg6j2AAe1kaFPmeQIlk1aao2nQ+6r5Da/nw=;
	b=ylXVtInV1WtUvKf2uzyXm9G/E2ihD+bikNF5d58tXDHZsvF4vjJI5eHgxnYxo2mz/P
	BZ86O4W/5wHAQLmNEjtUVvv2Qu9UgkJnMGNviNBgspUREjRGnxAWdfiVZjIV12gW6Xr5
	X9C9HEKSfBgkgM++E9kgbXwZDHM198W+zXHuMVCnzuoHc6TOsyIoZ2PlEZIp0lPe81op
	eWYYCaXcnGwcJLJxAznTDSXthdzUHv9rPmIOsdYa1kW5YH0BFmE7B/Poxlk1oIzFCpH/
	xeTy1Kh/vU6H0GhkEITpEwtEBYNi2HZuBcOSHrIwgCp/gud8lL3EEnrByvztCgwznzjc
	s2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:subject:date:references:to
	:in-reply-to:message-id;
	bh=sInfjrh9zg6j2AAe1kaFPmeQIlk1aao2nQ+6r5Da/nw=;
	b=NJA5pnA1mhoa5BYw5pLC1MyxKPhGQddxp/6MirGQQKNDbTYWEnTmRB4CO0Ix34o1RT
	j0TC1bXy0yay5v48W7v584HB1BNp32+m72PqCAj+EWMMlfXRCc40uj1CC2lIu1Cl9XnX
	yyKHFdYKp28BNywyiD4rn7J8kLogs2xyNorwu1GhfS8vz791vLIR8Bi+dzIF4U2oWhOw
	2o/AYA/7Iop5NqvYu7qPg1rfexMjwWky/rXmAI33M/htys8vhDYlzmkr/IFxFdF2/xSk
	PpXZkBh1JiJjqG92fCjOkdKLv/zP+XGze93Ui7IYBHvM61jW1y5jljpKmbVkJXpRFY7Q
	6Cog==
X-Gm-Message-State: AKaTC01NIqgvSNAqsoadbCRUl2VazYV4lnhr3QdnLgFMglwGdpbWkB+bTf5Y1UtINBRpBA==
X-Received: by 10.98.150.88 with SMTP id c85mr11351117pfe.68.1480136201341;
	Fri, 25 Nov 2016 20:56:41 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:e574:db7a:d1a9:c4a6?
	([2601:646:8882:b8c:e574:db7a:d1a9:c4a6])
	by smtp.gmail.com with ESMTPSA id
	u78sm69581019pfa.53.2016.11.25.20.56.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 20:56:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Fri, 25 Nov 2016 20:56:39 -0800
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-46-raj.khem@gmail.com>
	<20161126001808.GF8369@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20161126001808.GF8369@jama>
Message-Id: <A8166375-9995-48F1-98A6-9E6F1C7BF0DC@gmail.com>
X-Mailer: Apple Mail (2.3251)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH 46/49] tvheadend: Update to 4.0.9
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
X-List-Received-Date: Sat, 26 Nov 2016 04:56:41 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 25, 2016, at 4:18 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 23, 2016 at 01:22:06AM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../tvheadend/0001-Fix-checks-for-sse2-mmx.patch   | 40 ++++++++++
>> ...efile-Ignore-warning-about-wrong-includes.patch | 31 ++++++++
>> ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 92 =
----------------------
>> .../0001-disable-varargs-warning-on-clang.patch    | 32 ++++++++
>> .../0001-dvr-Use-labs-instead-of-abs.patch         | 37 +++++++++
>> ...verride-forced-overrdiing-og-CC-STRIP-and.patch | 40 ++++++++++
>> .../tvheadend/0002-fix-issues-with-gcc6.patch      | 46 -----------
>> .../recipes-dvb/tvheadend/tvheadend_git.bb         | 15 ++--
>> 8 files changed, 189 insertions(+), 144 deletions(-)
>> create mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Fix-checks-for-sse2-m=
mx.patch
>> create mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Makefile-Ignore-warni=
ng-about-wrong-includes.patch
>> delete mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specif=
ic-LD-CFLAGS-into-a-helper-vari.patch
>> create mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-disable-varargs-warni=
ng-on-clang.patch
>> create mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-dvr-Use-labs-instead-=
of-abs.patch
>> create mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-hdhomerun-Override-fo=
rced-overrdiing-og-CC-STRIP-and.patch
>> delete mode 100644 =
meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.=
patch
>=20
> tvheadend-4.0.9+git64fec8120158de585e18be705055259484518d94:
> /usr/bin/tvheadend contained in package tvheadend requires libucsi.so,
> but no providers found in RDEPENDS_tvheadend? [file-rdeps]
>=20
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html =
<http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110050.html>

will send v2 fixing it.

>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>

