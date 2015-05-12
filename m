Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5150073F4E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 12:17:32 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so8690179pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=6k5bYooAMMQFkPzSAx8CHBgMrD0YZjSITiAxMrjK168=;
	b=uIleebj4uBFNtjpmlgq5UP0akhBIdOIdNiZcafymDwlpbKlMq1bAFXUhCRnvyaV1Zt
	9qkUxJKvAXFDukiGncC3NW5rCPqoC3YK7asNz4m5a7OBdsmltrsruGhxI6ofPJLyJX/Q
	mTjYws+l+rioD+dmSEjaANNOfncqeEd9pxrFr9x5qspFcenYoPFV/i4pJsztMS0jm4UO
	jSXmustXImIB5i5yFmC6OvVPYD5+l/9T9iKaAMBhpug4rxdheFB0wqwrEMBi/gsYfdD0
	C1Uj+udCj3Vj06fcXYBKh3W49b3riAoHsDDNhn7J251D7mq6oWfBWySD9IgC2OxwiVQf
	mDgQ==
MIME-Version: 1.0
X-Received: by 10.66.222.103 with SMTP id ql7mr27420991pac.144.1431433054410; 
	Tue, 12 May 2015 05:17:34 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 12 May 2015 05:17:34 -0700 (PDT)
In-Reply-To: <20150512120949.GB2714@jama>
References: <1430928646-2007-1-git-send-email-schnitzeltony@googlemail.com>
	<20150512120949.GB2714@jama>
Date: Tue, 12 May 2015 14:17:34 +0200
Message-ID: <CALbNGRQnEAC9t314fy16+Tm8=u4Q049_MtqeYygx9AgQnDxXkw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/8] xfce updates + udisks2
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
X-List-Received-Date: Tue, 12 May 2015 12:17:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 2:09 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, May 06, 2015 at 06:10:38PM +0200, Andreas M=C3=BCller wrote:
>> The following changes since commit 2080f15e86d3d8e1e1f65e16b014545fe5381=
14c:
>>
>>   pcsc-lite_1.8.6: Modified the license for libpcscspy. (2015-04-24 15:1=
1:37 +0200)
>
> One of the changes is causing xfce4-screenshooter-1.8.2 to fail
> http://errors.yoctoproject.org/Errors/Details/10729/
>
> Can you please check that?
>
From the first glance I would say the error reported is unrelated to
the patches. I'll look for that.

Andreas

