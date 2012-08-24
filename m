Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T51PD-0006qK-Jm
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 23:27:03 +0200
Received: by iaky10 with SMTP id y10so4188669iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 14:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=6g6vEy5og9n4d3pdeBUZ4BJFH+0UUnw8aHCIZIARZ7Q=;
	b=QmMo6YsXRdQV1606VKaOdTRt7FEkvPpB2Bp8EaJDi4pZjiwlcw+VjjlTRTETvEYQrJ
	8w3ewBnt8aLPW6FJjn663NGj6Zkanp4bqJ84QXfet8VE3pDrroyVdFwImXlnkW6Gn5YD
	Xhz+acpyvTbTcKtZyFVTwN7tL6bBPYKWb4TpJSG3T38ICyDtS8/uLrQGaDqDONGUKdyM
	uKjMnWJJyHL7SiAj7D1O0ZoUWLKtX/x+RhIlGNAjYj23aRrltx0bfL1wXgKSAJ+DyrKQ
	AAi3m1Kc84Yyrb+EkILkStHTvWAHWxVmh40mrzr6T16KIVlvI9P1ztlz4Ap5ScskNAAl
	PR1Q==
Received: by 10.42.97.70 with SMTP id m6mr5577791icn.27.1345842895056; Fri, 24
	Aug 2012 14:14:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Fri, 24 Aug 2012 14:14:34 -0700 (PDT)
X-Originating-IP: [79.118.181.96]
In-Reply-To: <CAFpD06RReUM1sQjHrsyuJrmg1-dkbVVMFBfbvoy+OSKpcCX-ew@mail.gmail.com>
References: <CAFpD06TQ1AXs+09BEpCqB26jPsDjw7mkEYkSmm6wO1QyP3-WTA@mail.gmail.com>
	<50374DAF.8070500@cisco.com>
	<CAFpD06RReUM1sQjHrsyuJrmg1-dkbVVMFBfbvoy+OSKpcCX-ew@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Sat, 25 Aug 2012 00:14:34 +0300
Message-ID: <CAK18fxGRSUbTtLAkY615fePhZoKL5MQ00s-_HoN4N5zTbCKDbw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQl2vfpwlxxmo+JBFb8JzhlS18d0xtEykWcB2mYiKMwwEtYJT00r1Vhgqq86Q9fy/dVXbV1R
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Hello
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 21:27:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 24, 2012 at 8:12 PM, Giuseppe Longo <giuseppelng@gmail.com>wrote:

> Hello Martin,
> thanks for the reply.
>
> I have only one question: what embedded device can i use?
>
>
Welcome!

You want to create a bsp for a new board or use something that is already
in?

ag

