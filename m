Return-Path: <jefro.net@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 44EEA6059F;
	Sat, 23 Sep 2017 01:31:43 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id z39so1989808wrb.8;
	Fri, 22 Sep 2017 18:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=L9UQ6PQlfmb4PQ1fQM0lvimJpvazpLPR4HHjnaCf9VQ=;
	b=jenoN7Qo923yGDKhTOybPLUmNu3sCwou2sS5QKUY+TC7I20mjYgJ19tOXrigrBG1x1
	AfjJImG+hOBNLwhrZSMRIVofvPPQMPNE6+vApoydR6KBNYjaMCm6SBOfP7mXas/wZ9uj
	hiJ0dukuID2o0gwfkIV7IBg6cTEBCvfmCcUGiUrgQNhyu7eS8zn85wIWjnJ6It43c+tI
	47zoOE8+JabYRA4Bjagu6CHfN20mwIoHeB1mIdLEmhQbX5RSEHNlJAMf5fx5UY9Pk51g
	ZC3R4CUa7j+9HXSrwT8RXXCAuvRHCvEmOFmRRTVVk2Iv9adQFU07yeOWtVkRePP/24sH
	J0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=L9UQ6PQlfmb4PQ1fQM0lvimJpvazpLPR4HHjnaCf9VQ=;
	b=k6WWu/cTpjFjJ8z8xg5NEGaC0vicsISH6zeXlEzXfqyAvdKmTZoWywSYewD1dYjHoR
	79QiaG+LAJlaPDmzkdXqL/9JBtC5aP+qVSOpFoFbC/cjQulzwNXgdu40QQgo9E7NzoE/
	PYbNSV3r4tzbuHEsrD02rFwpVMM5HyDlwxDhU6zS0fIaUbhPl3q839kA4ezm770+bR0T
	BWu4CwYY6fP1DZUUOn3G1OtsCu9MPDtU4aPUqF3qHX7WwbrN89zNeDB/qSZVM1htVRHo
	2fj0pPQgi3Xt7GzvUdfDHvhpcO7JI7hdYz1ip0c6Vb7+2omyCVHyV3j6KF7dGQABPASP
	LHHw==
X-Gm-Message-State: AHPjjUhNLUPLnMqhYbjAp8Sf4gDwjYRmLI9PcR+0zTYf/kRDZG9Qz8o5
	yUxB8sG1nY/425l0WfeDgTSzmyl1P1rXPcGQIifhyXgd
X-Google-Smtp-Source: AOwi7QBWqxMXa7ySCHHyinzDQeihvu+QWNp4ac91OhYl+mCzEBZUBES3orJuaXcT1pxp5LifPbDGwsDUTYg+YKHZbIs=
X-Received: by 10.223.147.195 with SMTP id 61mr619115wrp.119.1506130304491;
	Fri, 22 Sep 2017 18:31:44 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.180 with HTTP; Fri, 22 Sep 2017 18:31:23 -0700 (PDT)
In-Reply-To: <01e52917-81d7-74c0-c899-b242e80d363c@gmail.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
	<CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
	<CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
	<8eedf692-5a12-f5a6-b9da-8184849a7a50@gmail.com>
	<CA+YB3rZd0P6eVimXD5jN0UZMB=dH2h2mdScmeB8PtjSWLZNMfg@mail.gmail.com>
	<01e52917-81d7-74c0-c899-b242e80d363c@gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 22 Sep 2017 18:31:23 -0700
X-Google-Sender-Auth: VV9DBTqUBxm6KzAG0JDntTkEa-Q
Message-ID: <CA+YB3rYD8pggjS0dJbHuJvaA4jo7hcdDsavSNKuJhn5x0Y2MuQ@mail.gmail.com>
To: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: OE general meeting before OEDEM next month.
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
X-List-Received-Date: Sat, 23 Sep 2017 01:31:44 -0000
Content-Type: text/plain; charset="UTF-8"

Ruslan asked - is it free to attend?

Yes, it is free - the space, including network access, coffee & lunch etc.
is donated by the Yocto project. All you need to do is make sure your name
is on the OEDEM list on the wiki here:

https://www.openembedded.org/wiki/OEDEM_2017

and bring your wit & charm as well as your ideas. Note that we may or may
not have a projector this year, so please also bring a laptop.

This is a community effort and one way to help is to help take notes during
the day. For the past few events, we have kept notes live in a Google doc
so many people could edit simultaneously. We will likely do that again this
year.

I am responsible for organizing the room and amenities. At this point we
have about 25% more people than we have had in the past, so if you add your
name please let me know personally at jefro@jefro.net and I will make sure
we have adequate space for you.

thanks

