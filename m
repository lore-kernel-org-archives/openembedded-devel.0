Return-Path: <ka6sox@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id D5A5160CEB;
	Tue, 24 Jun 2014 14:36:58 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id n16so423017oag.37
	for <multiple recipients>; Tue, 24 Jun 2014 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FbYE0uCU6yR13dhLIVtkH6/VMOicHs2F+Secz4ttXgA=;
	b=spdXy07T+djaVkw5D+WcbkHzMQ+GTg3SFP9wAU6oINLwVoP99dp9u2gJxZMcgItVL8
	lV6DZdeurOOn/2m0jPJReO+HSnOJ8yIEfnDMEdGO7tA8Y4EvnKd5bWI47RK4RYWczj/t
	HMJ2udsFzH8UG6ohPHs48+5dBPqwuXDOuN5CC1L2W6kjHD7PND8zpgIvmYDFFX/ZNBsC
	CSqQk5QYkr4nKiBbY8WqPrF/2qEkXSeyKvJ2OlS63bN6D/VbeHsvfqGFXybgJkPuQqMI
	zHqWgzjGiG4xDbiZtPwkgT4DPzeCI64zLNaGJUhY2clrT7QrNow47qtYvbDDuVmhQqRw
	NrJw==
MIME-Version: 1.0
X-Received: by 10.60.33.102 with SMTP id q6mr1292237oei.59.1403620619402; Tue,
	24 Jun 2014 07:36:59 -0700 (PDT)
Received: by 10.76.128.201 with HTTP; Tue, 24 Jun 2014 07:36:59 -0700 (PDT)
In-Reply-To: <20140624101443.GO2437@jama>
References: <20140619113451.GO2117@jama>
	<20140624101443.GO2437@jama>
Date: Tue, 24 Jun 2014 07:36:59 -0700
Message-ID: <CAHQecY6eQfhY4hY_EEUmXd5MEA2_fDb5yfj7YP0i1gg=dKFQ7Q@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Few archives to add on sources.oe.org
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
X-List-Received-Date: Tue, 24 Jun 2014 14:37:01 -0000
Content-Type: text/plain; charset=UTF-8

done


On Tue, Jun 24, 2014 at 3:14 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Jun 19, 2014 at 01:34:51PM +0200, Martin Jansa wrote:
> > Hi Tom,
> >
> > can you please add:
> > IO-Tty-1.10.tar.gz
> > SQLAlchemy-0.7.9.tar.gz
> > fetchmail-6.3.26.tar.xz
> > usb-modeswitch-2.0.1.tar.bz2
> > usb-modeswitch-data-20130807.tar.bz2
> >
> > to sources.oe.org? I can send you tarballs (or fetch them from
> > /home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)
> >
> > The most annoying is fetchmail which is now fetching HTML page from
> > berlios (so checksum check fails instead of showing 404) :/. And user
> > needs to download it manually or use sources.oe.org as PREMIRROR, but
> > still better than nothing.
>
> I've found only one more missing in upstream sites and used from dora
> branch
>
> daq-2.0.1.tar.gz
>
> I've verified that
> http://download.lunar-linux.org/lunar/mirrors/daq-2.0.1.tar.gz
> provides correct checksum or you can fetch it from aruba as before.
>
> SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
> SRC_URI[sha256sum] =
> "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
>
> Thanks
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

