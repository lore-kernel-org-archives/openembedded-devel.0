Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBD76DF3C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2013 14:12:11 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so16869581wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2013 06:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=+XTxNV/61b79E48E+tvtRA87bHR7blWzxFDHkhm/JY8=;
	b=GMdNiTXkPwJWdO7x2SkGUgd1UK68BHU7T2UQR6t1+Fnfr8LNtxagyOVedeel8BUSxG
	pY6OMDzoUni+ImwODVQbpnp9mFVBfBlFLG4wJFhS1twB/h38DlZAIPhyNjJx47MsXrhZ
	Ss5dr3eubd5/PTUp/Zy8rip71ItLQNmkfRnWLZmo9t2tGpUGpPiwrs6IeCbwmBdhXXSS
	iMUQAyJia2G0TlYRy5TtNS/YQtWK0gIhvmWxjbRIHclwGbM/MZiglOq9EOXcAEGvfyTy
	1tisRembEVuvjysDgQhna9JO0/eRME5FjJbqps40lYrN85g2D/aP0OhgBJyJJXwFQiHs
	r1ow==
X-Gm-Message-State: ALoCoQnPhK/aGmk01fxqYFimlv6WrM/bJoA8NrJAVSuZ/c9/gamOWpDkoCs5OD5yuG9XBx1OKvMh
X-Received: by 10.180.160.212 with SMTP id xm20mr11980262wib.33.1386252729889; 
	Thu, 05 Dec 2013 06:12:09 -0800 (PST)
Received: from ?IPv6:2001:610:612::fda7:47e:b3e:6aa2?
	([2001:610:612:0:fda7:47e:b3e:6aa2])
	by mx.google.com with ESMTPSA id d2sm6607028wik.11.2013.12.05.06.12.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Dec 2013 06:12:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <52A075E3.5020707@opendreambox.org>
Date: Thu, 5 Dec 2013 15:12:08 +0100
Message-Id: <644C5C58-7C6F-4D66-AAB0-BA7C3A0099A2@dominion.thruhere.net>
References: <1382009929-6537-1-git-send-email-obi@opendreambox.org>
	<1382010620-6944-1-git-send-email-obi@opendreambox.org>
	<52A075E3.5020707@opendreambox.org>
To: Andreas Oberritter <obi@opendreambox.org>
X-Mailer: Apple Mail (2.1822)
Cc: "openembedded-devel@lists.openembedded.org List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH v2] xfsprogs: change DESCRIPTION to SUMMARY
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
X-List-Received-Date: Thu, 05 Dec 2013 14:12:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

Op 5 dec. 2013, om 13:47 heeft Andreas Oberritter <obi@opendreambox.org> =
het volgende geschreven:

> Ping.
>=20
> On 17.10.2013 13:50, Andreas Oberritter wrote:
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git =
a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb =
b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
>> index ceb0ddf..1dc6f09 100644
>> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
>> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
>> @@ -1,4 +1,4 @@
>> -DESCRIPTION =3D "XFS Filesystem Utilities"
>> +SUMMARY =3D "XFS Filesystem Utilities"
>> HOMEPAGE =3D "http://oss.sgi.com/projects/xfs"
>> SECTION =3D "base"
>> LICENSE =3D "GPLv2"
>>=20
>=20
>=20


