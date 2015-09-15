Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id CFE1C6E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 20:17:49 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so185621628pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=rd6AX2XLZnKLKZOPyTrxvfUZl+tdUuVOjZqtPINgxlU=;
	b=Yk6xdyB9o32bRvbcQPFwot5KeCQYFAExckjcNMntaQ4xkpZjckmEmujrzHTTx80rbD
	gUdoeVlYmbekC5Kuq6QxCzI5u3AZMyi/VBOXoPbvOKYU4oz2fW2+a+OiqYructvWyNhh
	KNVLgsTBZDFe+nEjdIOLZ/HDCrlatH8J0bnLQ4bUHe0aTuCFzIdfKEIy9w7KTMDlioLg
	PzngkuiaQqhmBRBfj4u/YYxG2LSntw14M1+tbt/dvuavpFF7Z7LIM7T/Z90kTFcCdIbZ
	QbUdHfSIHODFWguFM5lwJdGkYLg6YzUhZcHY9cJ/T0tyScBjm/7gX9iZg01h6tJFDNHR
	6vRw==
X-Received: by 10.66.136.102 with SMTP id pz6mr51506366pab.52.1442348269555;
	Tue, 15 Sep 2015 13:17:49 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:3049:1b18:c641:536c?
	([2601:647:4c02:370d:3049:1b18:c641:536c])
	by smtp.gmail.com with ESMTPSA id
	uh10sm23727830pab.41.2015.09.15.13.17.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Sep 2015 13:17:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150915172429.GJ8885@mentor.com>
Date: Tue, 15 Sep 2015 13:17:47 -0700
Message-Id: <46D89522-87AA-48C1-9B6C-5408B26BA3BB@gmail.com>
References: <1441863496-7668-1-git-send-email-kai.kang@windriver.com>
	<20150914193728.GA8885@mentor.com> <55F7DC58.1050001@windriver.com>
	<CAMKF1sqP6OZbL+8-HrqMjV7FWz0+RPOSad8fO_+c7AgzvaCnuQ@mail.gmail.com>
	<20150915172429.GJ8885@mentor.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
X-Mailer: Apple Mail (2.3094)
Cc: Martin Jansa <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4
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
X-List-Received-Date: Tue, 15 Sep 2015 20:17:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 15, 2015, at 10:24 AM, Joe MacDonald <Joe_MacDonald@mentor.com> =
wrote:
>=20
> [Re: [oe] [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4] On =
15.09.15 (Tue 09:52) Khem Raj wrote:
>=20
>> On Tue, Sep 15, 2015 at 1:52 AM, Kang Kai <Kai.Kang@windriver.com> =
wrote:
>>> Got it.
>>>=20
>>> For for iftop, it just update licensing text.
>>>=20
>>> ----------------------------
>>> revision 1.3
>>> date: 2014/01/01 14:50:05;  author: pdw;  state: Exp;  lines: +7 -8
>>> Update to licensing text.  Patch by Robert Scheck =
<robert@fedoraproject.org>
>>> ----------------------------
>>>=20
>>=20
>> what was updated in essence is important here not logs
>=20
> Yeah, I had hoped that would've come through in either the earlier =
link
> or my referencing it here.  I inspected the change myself and the
> changes are limited to replacing 'library' with 'lesser' and the =
street
> address of the FSF in the GPL text, which isn't surprising, but that's
> really the information that should have been communicated in the =
commit
> log itself.

=E2=80=98library' GPL ( LGPL ) and =E2=80=98Lesser' GPL ( LGPL ) are =
they same ? I think we need to find more

>=20
> --=20
> -Joe MacDonald.
> :wq


