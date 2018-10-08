Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id B6F4C7869E
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 04:56:02 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id v19-v6so19741549qtg.2
	for <Openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2018 21:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=i0kF0ATYiQ9YpxTzX1I1BcBKYMJjf9c9O0gfCaKkCkQ=;
	b=df+jpOlDKjqY/GXQP3CwQ9AgRtorH9uAxaAl3XYxau/HmpY9r7KswMspdGggscTyIl
	/AgZ7G1fm+T8GdyPgtqfQ9s2uh1j9U5DLUh4NYg+E43mRs5dgCzeyFI5/onN04tnkC6m
	PpQVMCJa5f+HIKtAa3m5a9CB/geqmHToSFq5hTlghn8udZWnfR8fzQE92Sv6PbBiiMhm
	vGm0TEXihccY20X8eO1p6xA+66A1hOVEjJOONiasYYDhjGH3xfY6A1VzFWAcL7EIqBk6
	Jl4x0XbT3i4fxVaFWfRspPtceJ37NfpRVajjQBoZk4AtPFaUNeKvr0Dkn/oRIZDoAvc+
	xKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=i0kF0ATYiQ9YpxTzX1I1BcBKYMJjf9c9O0gfCaKkCkQ=;
	b=MZO4MzYdCpJXqpJnuamXsDWvg9ymIlHnZWbur+n6KErQ6HBGKnmMgpo5NzAP789Td3
	crlJ3lrcuID3g40Tseyc2cd9FVwVfzxROeCRO5iAAZaKJXAWHdblkomMzhuluuq6M6ms
	cIYIAbwGjsup5ApsAl3DwhSM74itHFO49BpPnFRyFve1P1i5VdkBwdnm5xQ61RXYlMau
	t8Y1ox71ApX/Tcd+PhgezC7q7ih4B6h87DXoNhsemJEhkGR9is1QGqWrHxmiZDZ4BGkP
	ebQZOpwhw7ALyD538Vyf4EyxoQTxBkbM0MxTDTHdZu4mtP2KFY18ShxSrQOrDCXCZBnj
	QboA==
X-Gm-Message-State: ABuFfojo0hMSctD19+bYsldTWDT0JrACY1+wZKHMyV+w0HtcFCLK7KZC
	FhLg6dmheD6gbXClEC4UgJ244p53+E4Far3tdI1s3w==
X-Google-Smtp-Source: ACcGV631V8KlJKoePWqiT15aeKiVD3ZLJxeMwrqHaoqAoM9v9U+MvTAsYssUHT0Gocfj+dmao4CRE5d74ly/Y0Madpg=
X-Received: by 2002:a0c:d585:: with SMTP id
	g5-v6mr18082262qvi.50.1538974563257; 
	Sun, 07 Oct 2018 21:56:03 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Oct 2018 21:55:37 -0700
Message-ID: <CAMKF1sr8XFvPcu-jU=hssJCEyBkP0GeZGYLT+F71ZMPD=Ve7Uw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: meta-openembedded thud release branching
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
X-List-Received-Date: Mon, 08 Oct 2018 04:56:03 -0000
Content-Type: text/plain; charset="UTF-8"

Hi All,

I plan to branch out for thud really soon, and it will happen in sync
with OE-Core, once branched
I will maintain thud and master in sync until final GA release for
thud and then release for more
invasive changes.

At this time I am also looking for release branch maintainer for thud,
so if you have interest and time, please sign up.

If you have changes that you plan to include in thud, please send them
as soon as you can, if the changes are invasive then we might have to
wait until 2.7 development opens.

All feedback is appreciated.

Thanks
-Khem

