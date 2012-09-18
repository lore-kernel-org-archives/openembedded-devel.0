Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TDmbP-0006WX-2D
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 03:27:51 +0200
Received: by eaad12 with SMTP id d12so2226362eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 18:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Fp1cfH0al2xV8PtSrfERVTnMcZCr+1rMIY/G5jjS/C0=;
	b=nCiY0y0QzqriP+S197cFuRzlK7Y0dFOU7vn2BeoCZZyEVuzsH8QMYY59V1g8aAgvdM
	AkidwxanEZk6kr6piIy5R14wlBaW9rY39uvZGsAc1zxHOhsYRkg3KXjJFD4vFAK/z4mJ
	j6tJblVomeMAmFHHz8Yn/iayHSizQ7MyeRvlD8A3eKiIiVWv4NBMCzPELsa6sfDNZV7F
	xGgqYW/Q5MXcSyjrXj0HMoeqqY0TCgrvXer0YRU+vGHOmDM6wJN65Utc43YKTfb6RZoE
	cHYjbd23kYEDA+Th4VJCCz3UfDlD2PqDy+yu23axoQ9eMGeVldYksHAeDIgFfJBjrm/k
	nvFA==
Received: by 10.14.4.201 with SMTP id 49mr15716413eej.0.1347930911730; Mon, 17
	Sep 2012 18:15:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 17 Sep 2012 18:14:41 -0700 (PDT)
In-Reply-To: <CALbNGRSJPF_ecKSaeM4+URRuHBgPXhUJavqHuciq+Q1SOoO9+Q@mail.gmail.com>
References: <CALbNGRSJPF_ecKSaeM4+URRuHBgPXhUJavqHuciq+Q1SOoO9+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Sep 2012 18:14:41 -0700
Message-ID: <CAMKF1sopUyOMofpj2o5+ysoH0EvOOKGaqQOJUsRxZ6X0H3+Ecg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: xfce update question
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
X-List-Received-Date: Tue, 18 Sep 2012 01:27:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2012 at 4:14 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> I have a huge patch series for xfce 4.10 + plugins under test. Is
> there a chance getting applied these days? I am asking because oe-core
> is in release-freeze and I don't know if meta-openembedded does same.
>

usually it gets tagged after oe-core is released so it should be OK atm

> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


