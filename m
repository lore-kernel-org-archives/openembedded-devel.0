Return-Path: <giulian@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id F405E6F137
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 16:49:05 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so1204149pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 08:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=KmgbD3adlH3M3yYUi+XxO553WhBOQsHNFub/mQPomhQ=;
	b=eUK3NHdOX6Z1p8+ehZJMJxX2Y/yMz4E7hx9C8xc7S9sw64IPP36DxDGuZYSHrq+sk3
	zNESdIS00KvsH5/Ba5KhREs92+/1ktlDzYOSVRGa6nogS0vXnDpOMYCJoPCpRMFxiZ8o
	p0YrBxLf057cnPoBAAfBY1mSlz2OkMCEXAYiA/Na7yU0ZICPUX8W9mqFtg+8mrwxBE9X
	OUcf585rc+VVeQDdPniSyL59Sr4Ae/9CeRnaglAvuoBrgmVUsiMT8M4NzzxkGT9clAer
	UZ6+zE4xC/tDO976FdWautiQcUa+laV4AYSgOfyNY8bkhU9LT6odj/C5o5vs4VEaplkT
	sjcw==
X-Received: by 10.66.146.133 with SMTP id tc5mr9799338pab.58.1393433346628;
	Wed, 26 Feb 2014 08:49:06 -0800 (PST)
MIME-Version: 1.0
Sender: giulian@gmail.com
Received: by 10.66.8.225 with HTTP; Wed, 26 Feb 2014 08:48:46 -0800 (PST)
In-Reply-To: <CAP9ODKqdY6Xes75HfjD7ukKDo8Z8nGrb0D39rNJoJHkK14LPqg@mail.gmail.com>
References: <1393273696-9249-1-git-send-email-otavio@ossystems.com.br>
	<1393273696-9249-3-git-send-email-otavio@ossystems.com.br>
	<CAMKF1sor8AfGAjLODy5W9N91HQsBTTvAhh0+j3S-Obn_Gdv2Nw@mail.gmail.com>
	<CAP9ODKp_b4MmZZ38DSB5JwWevucrOmE3tzFeL2F-DKe9=LyEnA@mail.gmail.com>
	<CAFYUCi7N-M1DVsnnxqcmMy8YJFsocDeYOn5Y3qBt8Ku1GB4_NA@mail.gmail.com>
	<CAP9ODKp0UPWJypF9F6f+bL+xL8eaHYHb9H=RYG_sKV8DMyS=SA@mail.gmail.com>
	<E5201FDD-3B16-4A7B-8F2D-8884F17DB199@gmail.com>
	<CAP9ODKqdY6Xes75HfjD7ukKDo8Z8nGrb0D39rNJoJHkK14LPqg@mail.gmail.com>
From: Giulian Vivan <giulian@ossystems.com.br>
Date: Wed, 26 Feb 2014 13:48:46 -0300
X-Google-Sender-Auth: YbnqaJ0Tyf_aMvsLRPmy01eFsoI
Message-ID: <CAFYUCi6oxO2fDDA8OQrwQG+HAwJMiFykPr8=FVL0mV4=Y0HnpA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/3] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Wed, 26 Feb 2014 16:49:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2014 at 1:45 PM, Otavio Salvador <otavio@ossystems.com.br>w=
rote:

> On Wed, Feb 26, 2014 at 1:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Feb 26, 2014, at 4:40 AM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
> >
> >> Hello Khem,
> >>
> >> On Wed, Feb 26, 2014 at 9:18 AM, Giulian Vivan <
> giulian@ossystems.com.br> wrote:
> >>> We tested it and when qtcreator tries to connect to the device with
> >>> dropbear, it gets "server rejected password". A connection done
> through a
> >>> terminal is accepted normally.
> >
> > do you have empty password ?
>
> I will let Giulian answer this one.
>
>
Yes, it's an empty password.


>  >> Any specific reason to prefer Dropbear?
> >
> > it smaller than openssh many embedded platforms have it in their images
> > you will have conflicts if you now try to shove hard dep on openssh
>
> Even if we are abow to make it compatible, how would we 'choose' between
> both?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

Giulian Gon=E7alves Vivan
O.S. Systems Software Ltda.
www.ossystems.com.br
+55 53 3282-2787

