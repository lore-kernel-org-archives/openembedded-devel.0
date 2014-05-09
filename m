Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 100236 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 18:47:38 UTC
Received: from mail-qg0-f52.google.com (unknown [209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF066059B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 18:47:38 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id a108so4806189qge.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 May 2014 11:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eKALMzdwTdlxzitL0AXMTaJWc/sainlucUYb+ZvnRd0=;
	b=jTa9Lpq4tdlwG2xAY1sMpWElfJDMc7N+5OITMKjKihsX5nm3UOudhjV8UQRRJbfiU4
	Wmf2ITA3+zPt9ao/FFgWWPFzVT/Sq9jUL8vLcjvxOdwt+nBz911Et1BMRr3fFdvPOCpc
	ajW+acDCJFZNf0SR9xwav1LejeUY5z6+f9kGsggHrPNPNZ5VgHrmoqNpb8KA7eF6lRV7
	c++vSO6//fpzCICrovD6mdlAZ4qghhtEf68dRRC0/11P1H+HJBUKD6JtxWciJbWLK711
	LK4G48YQ0ZZEeIzj2KLK37Y9+PFPIg7wOkTCoMkvwyev5ivTDh/lVMYGCTiQHOQjFtjK
	2eWw==
X-Gm-Message-State: ALoCoQlXYPytawLD6Rnw76oJkbCyuu7bDUEk34JNTgpom08WscAxoWvBORqcm2A0FGu//3GDz2N3
X-Received: by 10.140.28.3 with SMTP id 3mr16575259qgy.71.1399661259694; Fri,
	09 May 2014 11:47:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 11:47:19 -0700 (PDT)
In-Reply-To: <536CF208.3000400@gmx.de>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
	<536CF208.3000400@gmx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 19:47:19 +0100
Message-ID: <CAJTo0Lagpg4G20WJbXr1r_L4ypOMjU+1iCOD8cRwZ86fFJGM-A@mail.gmail.com>
To: Neuer User <auslands-kv@gmx.de>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] GStreamer 0.10's future
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
X-List-Received-Date: Fri, 09 May 2014 18:47:39 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 16:19, Neuer User <auslands-kv@gmx.de> wrote:
>> So the catch here is that Qt4 currently depends on GStreamer 0.10.
>>
> Yes, it does, as long as you need QtMultimedia. Same applies to Qt5.
> There was a discussion on the Qt mailing list about moving to
> gstreamer1.0, but this seems to be rather some time in the future was my
> impression.

Oh, even Qt5 needs 0.10?  That's disappointing.

Ross

