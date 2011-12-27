Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rfbru-0006Zn-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 19:35:23 +0100
Received: by vcbf1 with SMTP id f1so8631615vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 10:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PDmqwx2nsf8eclfi6M2BJy2OpC/2kcLPXkt4i8d9zYY=;
	b=NK+xyR6tGbBCXxwLOxduJtkmEJp3Yzw5cYF50dshsS9scay5/vtteWayccsFLoxaSq
	XHO6mfpwTWcOTFD6BHWKKef8fhMDv+J3f6kBhDFDObHSDMB+q/s56kkaQ7atYLiIsCrv
	Ec5POMDMmonDfl+vjICfE4Fw6c2ebFd20jEpc=
MIME-Version: 1.0
Received: by 10.220.140.135 with SMTP id i7mr3296821vcu.65.1325010484472; Tue,
	27 Dec 2011 10:28:04 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Tue, 27 Dec 2011 10:28:04 -0800 (PST)
In-Reply-To: <CA+M6bXn4T8YO5SwiotYJcy3K2ioQtUBsGLCTOXCZZE=yU2vdBg@mail.gmail.com>
References: <CACW_hTbaEcTcwhut+9NJX6yci6Mu6w+uhqB3xKcfORSg5gM2FA@mail.gmail.com>
	<CA+M6bXn4T8YO5SwiotYJcy3K2ioQtUBsGLCTOXCZZE=yU2vdBg@mail.gmail.com>
Date: Tue, 27 Dec 2011 19:28:04 +0100
Message-ID: <CACW_hTZkQw6G=D=vKo1KUkHmbT-ODu7uPVH0ebbh-E7=R8zKMA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] net-snmp: please cherry pick 4a98e62ac35d4367d3c072819317deeda52abf5e from master
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
X-List-Received-Date: Tue, 27 Dec 2011 18:35:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/12/27 Tom Rini <tom.rini@gmail.com>

> On Mon, Dec 26, 2011 at 1:29 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Please merge this one
> >
> http://cgit.openembedded.org/openembedded/commit/?id=4a98e62ac35d4367d3c072819317deeda52abf5e
> >
> > to the maintenance tree. it updates net-snmp to 5.7.1; the existing
> version
> > does not build for uclibc; this fixes it.
>
> Per the wiki page, this is not a proper request for the maintenance
> branch, please re-submit a pull request with the cherry-pick tested
> and confirmed to fix the issue, thanks.
>
> This has been tested for meta-oe (by Eric) and for the maintenance branch
(by me, actually it is part of our most recent product) and compile-tested
by me on master.
I'm not planning to set up a git or branch for a single patch. I'll mail a
patch in a few minutes.
Didn't know we became this bureaucratic. Will take that into account when
considering submitting my next patch.

Best regards,
Frans

