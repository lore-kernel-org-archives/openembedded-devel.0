Return-Path: <diego.rondini@kynetics.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id DEFBB77E7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:02:28 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id g18so1502526itg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NIAWA2uOZe7zwHD6CPs4j+ERB/zZYJ67joFfnkmSei0=;
	b=q2VQbggE2CwC/oc9u6YmblxIbNIZ7QGOw+LB8GniQTr68GPfPq7+Opngd9VP7vvEUW
	2PZ6XG2JvKYZRy1fAM5lVSmfUzyV64zLBNOlWrzkOMnqDPCyZ1UiOLHNP23J9/A1aoIi
	WjS6GeIf8f68kVgIOL4A75WX/AVeAJbhCL7XO93AvSwl0l2v82Z3Fm/ZlryV9v5RSGz2
	zKFwa4+acqy3yscSykMKRhC4z/o++/Q408G7ZsjGA43sgqR0eAUlB0K2Rwik5jji2XfW
	eH3WHjIk9TIO85xVA+rlYvIFPuEX8K7A3OuPgy22GKSRPq+ehkOrmyov1v8bEIPhlyiA
	gwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NIAWA2uOZe7zwHD6CPs4j+ERB/zZYJ67joFfnkmSei0=;
	b=uIu7RCi4+Cp/mENJaZWRJzYcMeXs6YgOCJ2A26UUBnlIuBj0Z6BAYEoG0oYs+LqFYE
	sv90lvuoab3f5WrSsMSAsGSsetlpbbUItTST3uSmlseDiUTpRCX3buf2ObmFB2VxzAFt
	qMS6c6JXEE2p9odud2w8YhBUL/oc5cb8iASJ4OZ85O/hJ8eb4eAM4x1u3Uv4xy8D+r+M
	G2SrwXFIe2WD5Znz73zfxpZXnHHFhB8qcGP5sxITlyta8f2tiTEJC4hA3lgp8dqI6MY3
	L0f8V+svT0b/8AgxBe+6ojhy6ck3YipM1ghxfElYuScYSCtwxphU/45ld0xZBeUQJmoh
	C0bQ==
X-Gm-Message-State: AHPjjUgH8HzLyiBwnXaAShXfMyw1FLhkd9eUAqbSXDeDqR9LXeIuHX55
	zsh8GiB+cN+fVSCEVXbRSiqJEQj1zDSVmTcSwR5l9w==
X-Google-Smtp-Source: AOwi7QBLvXLG6lwVTTA7VNKd1rSGYt3FxIN1gkPIADjNodcMM2SR3nZksOvKhL6OibYC//XvPZBrqNQqiyukxnmuTFU=
X-Received: by 10.36.69.91 with SMTP id y88mr625478ita.99.1505815349975; Tue,
	19 Sep 2017 03:02:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.138.80 with HTTP; Tue, 19 Sep 2017 03:02:09 -0700 (PDT)
X-Originating-IP: [79.7.224.57]
In-Reply-To: <17a36396-5e99-6d61-3f53-60765981e7f5@gmail.com>
References: <a7f23460-365f-925a-f5cd-6b95159749c9@balister.org>
	<17a36396-5e99-6d61-3f53-60765981e7f5@gmail.com>
From: Diego Rondini <diego.rondini@kynetics.com>
Date: Tue, 19 Sep 2017 12:02:09 +0200
Message-ID: <CAMfw5Yo=9ZMF=60Knr7L_8Gd1fSvXYqJmHt_Z_26ujJacJ3ZHw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][Pyro]Update Sip to 4.19.2 from 4.19
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
X-List-Received-Date: Tue, 19 Sep 2017 10:02:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

On Mon, Sep 18, 2017 at 11:14 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 09/11/2017 11:16 AM, Philip Balister wrote:
>> Armin, can you pull commit 229f824568406df354bc857b31989a7777d778bb that
>> upgrade sip from 4.19 to 4.19.2 into meta-oe/pyro?
> sorry for the late responce.
>
> 4.19.1 added three new abi's or functions
> 4.19.2 was bug fix only.
>
> I suspect 4.19.1 is what fixed QT5 issue and should have been updated
> when QT5 was.
>
> I am still thinking about it.
>

I think that the only current user of sip is python-pyqt5, so my guess
is that upgrading it has no counter-indication, as the only current
known user of sip is broken anyhow.

Bests,
Diego Rondini
Sr. Embedded Engineer

Kynetics
www.kynetics.com

