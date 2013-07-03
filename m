Return-Path: <subscribemehere@yahoo.co.in>
Received: from nm31-vm7.bullet.mail.sg3.yahoo.com
	(nm31-vm7.bullet.mail.sg3.yahoo.com [106.10.151.198])
	by mail.openembedded.org (Postfix) with ESMTP id A76E161485
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 14:33:23 +0000 (UTC)
Received: from [106.10.166.123] by nm31.bullet.mail.sg3.yahoo.com with NNFMP;
	03 Jul 2013 14:33:23 -0000
Received: from [106.10.151.239] by tm12.bullet.mail.sg3.yahoo.com with NNFMP;
	03 Jul 2013 14:33:23 -0000
Received: from [127.0.0.1] by omp1023.mail.sg3.yahoo.com with NNFMP;
	03 Jul 2013 14:33:23 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 441735.93566.bm@omp1023.mail.sg3.yahoo.com
Received: (qmail 61369 invoked by uid 60001); 3 Jul 2013 14:33:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1372862003; bh=x44gNluHQ8am04dIvqnwGKo946sVuxJaT71xv64k76Y=;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=2nJBvyl8f3TG9A8xaoxDYgM0bzO//qwo2sYL3am5c5zoH0o+XS3F7XcOsDWVIlLie3T7MLaZySHeT4PMpYeXDChraxuJAJjtiY2RyFw503Xdo/zaJEDxgcahHwDTSzd1k8n4GXUb+Tnp8M7qzNL3zFs7a6tJdC7sSGuw/Yho5w4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.co.in;
	h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=oG6SAbYrnEvAnxb9KaayZieYLVvR120RXwsCw9zjCqttF4KWf4wHZdE50n3yLRVe2/I+rDkuTBaFKEi4hbkCS0lfUIqXLf45dWyZCmD7qbbGqvgsWQLVKdia7Ubs4DopahKPkBsrkmeJpg9GVIGXXrvpIEUmR+BJvjT1Z3vLcSg=
	; 
X-YMail-OSG: L6snZr8VM1l09ypRKEJo4lptWCVOPZ_kyQSWiqFo.KetkCm
	k0AF0heozUjIBqqtJSz7765znxsFeZ64pCKqsR3q5gtdfmdHv6FR11wTjKh3
	koN4DYYE7Ck0TLp8UcoPe05F70uE26DvzSnN.ldjlV7LsKL6gouJQ3o58dyU
	QP_kHIsucYkYJqHLBXRqLrKbLM5qAN2Wm4pZ0uwnSYJU1ITB6M9cjnUszByN
	2z5qq0QDW1KvqfcHUyber8FvbxJWNXfgGc52q.q6vSX6ABZSv6kBq2yp1pw4
	UCU3bY_1EHXgGLLfLKnjObz.DUzybpIbPq7g9JR591AJnWXgy3OYFY5B0TiM
	fhechEYOPzdwUFS.hQ.vo3i_TttIAokd4IPwfuVqNVCmFB5sOghk6R2E6WJQ
	gcdJOu_A9ffa1W3lW2TIVQBC7JPlvK7qGypxG.m21FuVNhc5p2TIBQERRmzl
	qXA3WDso4J4gA6yDwzX_NqhAhX.uYVRdXsaR63l7HF8I1PhkuqoqwPg5.X5i
	_g_4vGRkcLFR_QWW00UFi43P4b.8vjVaDdN4yzw350OfojfFOGZf0gmwB.8y
	cHXiUl1U-
Received: from [115.115.74.130] by web192504.mail.sg3.yahoo.com via HTTP;
	Wed, 03 Jul 2013 22:33:23 SGT
X-Rocket-MIMEInfo: 002.001,
	SGksCgpJIGFtIHRyeWluZyB0byB1c2UgcHJlYnVpdCBleHRlcm5hbCAobWlwczY0KSB0b29sY2hhaW4uCkxvb2tpbmcgYXQgdGNtb2RlLWV4dGVybmFsLXNvdXJjZXJ5LmluYyBhcyBhbiBleGFtcGxlIC0gd2hpY2ggaW52b2x2ZXMgZXh0ZXJuYWwtc291cmNlcnkgcmVjaXBlIHRvby4KT0UgdXNlcm1hbnVhbCBkb2VzIGhhdmUgYSBzZWN0aW9uIG9uIHVzaW5nIGV4dGVybmFsIHRvb2NoYWlucyBidXQgc2VlbXMgdG8gYmUgb3V0ZGF0ZWQuClRoZSB0b29sY2hhaW4gSSBhbSB1c2luZyBpcyB2ZXJ5IHNwZWNpZmkBMAEBAQE-
X-Mailer: YahooMailWebService/0.8.148.557
Message-ID: <1372862003.57853.YahooMailNeo@web192504.mail.sg3.yahoo.com>
Date: Wed, 3 Jul 2013 22:33:23 +0800 (SGT)
From: balaji venkatesh <subscribemehere@yahoo.co.in>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Using external prebuit toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 14:33:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to use prebuit external (mips64) toolchain.
Looking at tcmode-external-sourcery.inc as an example - which involves ext=
ernal-sourcery recipe too.
OE usermanual does have a section on using external toochains but seems to=
 be outdated.
The toolchain I am using is very specific to mips64 alone.

Is there a simpler way or example for doing this?
For now, I am targetting creating independent packages not (kernel-rfs) im=
ages.
Anyway I am going through external-sourcery, but since I am too well verse=
d with OE, guess will take time.

Thanks
Balaji
From otavio.salvador@gmail.com  Wed Jul  3 15:22:29 2013
Return-Path: <otavio.salvador@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-gh0-f179.google.com (mail-gh0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id D753961485
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 15:22:28 +0000 (UTC)
Received: by mail-gh0-f179.google.com with SMTP id f16so71668ghb.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2013 08:22:29 -0700 (PDT)
DKIM-Signature: v
