Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1E662731D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 22:54:36 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id u30so80088160qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 14:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=EobBEpovna4AzXSc1jcOeECimg6t60ED1Hgeu/St4Ww=;
	b=wxdohD1sOJ7cFhhVZUXwu/FvGBoZ/0hIHpb7OEV+0zDwMYdoWKiNHyowFIO/TrL4il
	CpwG8uRdFBpVstp49KSRWAcLLhY1E7NicVG5NiTTL6RSdJd9jW/JOaVULVOx3vXa1w9Q
	rTC762lhSuMi2XQLvzj5y+WCAt5b/9wC8Hk7dE8QAF+IRugOhpEr2Idyd1oEI3IwRMuZ
	8OSuGaV5uBvuXq3R5s6qt2xfw/Fhp1VL1/JAB8B7/XGNPOwuZ+kJxqmVCQBiZBY3XTK6
	iu4G7SJwHcSwpHLnmzfeC5r2vTspAq8MBRU6c+rgLcXfhicDoaZXIAb5MNXT0Vz/74ae
	Q3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=EobBEpovna4AzXSc1jcOeECimg6t60ED1Hgeu/St4Ww=;
	b=E9uUTF0N+lkpWTzVIKxjoKgZ7bL5PRYcFETBrXrRQAr3g+7UKOJGM05LYAYWmhFjzo
	ak20PIvADK5UR7YvFnUocRmhoggnid12tf5m4hv6c2sI65nkyoDpXjPX1RuOznR37qc6
	gfghMOxMNaHkUgbSRrtn83i8fRxj6jbaiWf1jF78i3esOUNsWD3Yu8qByMsdi2/N5KFz
	vwGPJ7IzX+4GvVmDl43+XPBG9ZwT3pUbS2Y7I9nZB/RiCPsCFluPjRQ+R8wq2KVD27Mr
	ZOA6P7brog2X5ozMbRt09+YM0f2NdIplUD/DxdoVYhNLZEKRIOsoAzm7w7iEN9aGZqc0
	dB9Q==
X-Gm-Message-State: AG10YORi5UHPENH0b0o9ClYqqAKjkJDs9K0xxNhrpEyqneETBkza6IoU5b8vB47iORi//oHM4y8RpoRt3FTARQ==
MIME-Version: 1.0
X-Received: by 10.140.94.198 with SMTP id g64mr19877111qge.57.1454712877385;
	Fri, 05 Feb 2016 14:54:37 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 5 Feb 2016 14:54:37 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 5 Feb 2016 14:54:37 -0800 (PST)
In-Reply-To: <1454710544.32454.33.camel@intel.com>
References: <1454465517-24926-1-git-send-email-alejandro.joya.cruz@intel.com>
	<CAMKF1spJ+xeuV_iiyswkfWSkFiQ84t0qBDQsesrGBCyWiO5yHQ@mail.gmail.com>
	<FEF0A910-0CCF-49A5-9CA0-75D50E23BDA0@gmail.com>
	<1454710544.32454.33.camel@intel.com>
Date: Fri, 5 Feb 2016 14:54:37 -0800
Message-ID: <CAMKF1sqSJKwwbMJwkd0pBXKi_8VXQCEVDNh1PAe3aonY-350ng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] toybox: upgrade to 0.7.0
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
X-List-Received-Date: Fri, 05 Feb 2016 22:54:37 -0000
Content-Type: text/plain; charset=UTF-8

Yes
On Feb 5, 2016 2:15 PM, "Joya Cruz, Alejandro" <
alejandro.joya.cruz@intel.com> wrote:

> On jue, 2016-02-04 at 17:03 -0800, Khem Raj wrote:
> > > On Feb 2, 2016, at 9:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Tue, Feb 2, 2016 at 6:11 PM, Alejandro Joya
> > > <alejandro.joya.cruz@intel.com> wrote:
> > > > +CFLAGS_prepend = "-I ${STAGING_DIR_HOST}${includedir_native}"
> > >
> > > why is a native include dir needed here ?
> >
> >
> > this is same as STAGING_INCDIR and that should be automatically added
> > via compiler so I wonder why its needed.
>
> yes this is need it since the make builder is really  basic for this
> package.
>
> do you suggest change the use of
>  ${STAGING_DIR_HOST}${includedir_native} to ${STAGING_INCDIR} then?
>
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

