Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0591865D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 07:10:03 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id le20so465783vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 00:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Lb4DhG6BHbaehrGNikJ+qykMRz0dqqsdPloisA3lBcI=;
	b=iRqOijeoSTJsxuDx0P8e1kEy5FLFeoLajB++nghY9r5xV3Kzy8j9cC+OcPQh55kZ55
	sw1c+VWYaZaMVH0Yc1SwWBtgwox2Kh7RCeUBeqNm+COfFNgQUFO5KtphBN+ErPWXoTA9
	XuXYvWKcqPxFEn39UXmCmuMCemLP8T91dsixBjjTFh7EmJ6p0vicgQP35cEL+0bdPT4P
	UmXG/kkXpBLxuNlxWKZyiuz0QKnXBnwYOHsFCUYEKRYC65gKEgC5LSpsaOa4JkrVoAM3
	Zdd+9Lo6sVbrFhrRv1aK5MhcsYYZ4k0yfPnT2DMZodGtc6jS/XhM/dfFHj1A2LpOXlSe
	Bg1Q==
MIME-Version: 1.0
X-Received: by 10.52.0.98 with SMTP id 2mr8520777vdd.28.1413357004391; Wed, 15
	Oct 2014 00:10:04 -0700 (PDT)
Received: by 10.52.102.204 with HTTP; Wed, 15 Oct 2014 00:10:04 -0700 (PDT)
In-Reply-To: <20141014222048.GN3000@jama>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
	<20141014222048.GN3000@jama>
Date: Wed, 15 Oct 2014 09:10:04 +0200
Message-ID: <CALbNGRSXnLHqxig26y_bpCe2TQgHcVgL4rh3ObN3Dfw8GoHZnw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 00/15] updates and qa fixes
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
X-List-Received-Date: Wed, 15 Oct 2014 07:10:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2014 at 12:20 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Oct 15, 2014 at 12:14:13AM +0200, Andreas M=C3=BCller wrote:
> > The following changes since commit
> d1951db22a9971a1bb7cf25810ec3bdc9669a6f1:
> >
> >   modphp: using PKGCONFIG and PACKAGECONFIG for libxml and soap
> (2014-10-14 11:48:58 +0200)
>
> You want this in dizzy right? I'm happy to see QA fixes, thanks a lot!
>
> Would be fine if these survive autobuilder and find the way into dizzy

Andreas

