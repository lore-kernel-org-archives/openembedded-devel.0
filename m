Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id E445A60111
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 12:22:12 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id bc4so28994672lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 05:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3O6y8fLda6Mhzf4DpfUDqNNRPzcXF+sVF2OujMKq4ys=;
	b=h8RHTr4H51Cw4QcQM3GFZ+7GKtRwfBS3eBQdLaJFdILmMRqlC4HCWTgM31TV5r3XIo
	qmKwomWzlRZ6bTOMA3e5rL4sDcUtr6wZU+kj0a0421PSyHJH+A9PHgZS83PCVo1TD/Fa
	C52KNeLa3wtB+O4vsCO2onANghjZQZFPzwVEECIzgi9L5FpOMn7O9ACHKzGyEDz/VdJ8
	ZM2LcgHAGIcFgv8exvenSth9uXwE+NKly/kWTTnyiYtTTEgFE6wr+tEihWDYCYexnEl4
	6u2ZBqfQR+Vjz/Zz5UGS6Nxd3WapFM+Bq1Ex6cSlhKWm8OjVQh8fDRgHTIrcWKZsNXUa
	EsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3O6y8fLda6Mhzf4DpfUDqNNRPzcXF+sVF2OujMKq4ys=;
	b=Qo5RVbI42VNSoqzbfarp5HMens/dEzlIvfbxYi49zrHE3kaWbNAyp3tbOykHtgiw9W
	QgNZ/kG2Xc/qIRWMSSht4FmMxy/u7KVupQDlgubQNgQatezhVjPiI8gtk13kFnKd2hoA
	kaAvLhLH3n3wTZAThVoalB9Anaz3znC+jax3ywMptJi8z045KUuNF9MxvX5dfyTIvF7b
	oal/rp6XuTctg2y1vi/cGIWRnkjELpd9IhhlY9/YMkU3BfGhUgJ5FY62KQPXdjze6szX
	V8JX8f38GU5qsy4SXtaf4b4mdev0m5ZinjTSHSriGEIE+r+VXFWaeXky5cluyXukU3KZ
	OdaA==
X-Gm-Message-State: AD7BkJLNbYA6zlKkdTlR2/WMsJ/BZKzDm8MScQjwphWvxn7ZlGta9OxqvrZ4/2sa2ZWRx8wg+eVntsZ9wHe57g==
X-Received: by 10.112.163.102 with SMTP id yh6mr3212900lbb.4.1458822132506;
	Thu, 24 Mar 2016 05:22:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.11.40 with HTTP; Thu, 24 Mar 2016 05:21:52 -0700 (PDT)
In-Reply-To: <CA+chaQeCmuDayR--vozAToONS5ct_eHW6jd+Qytt0FkwS4+Lag@mail.gmail.com>
References: <1458556296-2809-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160323101240.GA2565@jama>
	<CAPybu_1-CCqMjSRC5it6nLL+SWzP7WfJEL6S5dY=Wjn4unon3g@mail.gmail.com>
	<20160323143422.GC2565@jama>
	<CA+chaQeCmuDayR--vozAToONS5ct_eHW6jd+Qytt0FkwS4+Lag@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 24 Mar 2016 13:21:52 +0100
Message-ID: <CAPybu_0i2evFqM4W8FVJM9wwsTR-SxZEeCFH7z6L3c2YfcF2QA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: Add missing dependencies
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
X-List-Received-Date: Thu, 24 Mar 2016 12:22:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

I will take a look to this next week


Thanks!!

On Wed, Mar 23, 2016 at 9:53 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> It's also downloading something during do_configure which isn't acceptable:
> http://errors.yoctoproject.org/Errors/Details/57094/
>
> Everything should go through bitbake fetcher and premirror, so that builds
> are reproducible (even after upstream sites are gone) or when user
> explicitly disables network access.
>
> Regards,
>
> On Wed, Mar 23, 2016 at 3:34 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>>
>> On Wed, Mar 23, 2016 at 02:05:41PM +0100, Ricardo Ribalda Delgado wrote:
>> > Hi Martin
>> >
>> > On Wed, Mar 23, 2016 at 11:12 AM, Martin Jansa <martin.jansa@gmail.com>
>> > wrote:
>> >
>> >
>> > > Still shows:
>> > > WARN: opencv: libopencv-dnn rdepends on protobuf, but it isn't a build
>> > > dependency?
>> > >
>> > > protobuf support in dnn probably depends on something else which is
>> > > also autodetected.
>> >
>> > if I just clone a clean version of meta-oe and meta-core and do a
>> > bitbake opencv i cannot replicate the error.
>> >
>> > Any idea of how to replicate it without having to do a bitbake world
>> > before bitbake opencv?
>>
>> Check temp/log.do_package if you see protobuf dependency being added for
>> libopencv-dnn package.
>>
>> If not then read configure script or sources to see what in
>> libopencv-dnn is being autodetected -> then build these autodetected
>> dependencies before rebuilding opencv and re-check the log.do_package
>> file.
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>



-- 
Ricardo Ribalda

