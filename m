Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SL82L-0001mQ-8W
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Apr 2012 09:13:45 +0200
Received: by iaag37 with SMTP id g37so13315499iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Apr 2012 00:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=16/P+VrtwFluwymWKgW1bkRzPD5zeZJbjGqWMITgMvY=;
	b=I+OtTHysSrgllYUu9vlIZn63I/rtJw/BbTaO0ZEwnlEWtX2NO4XgdFsoh5CVG0GJ8l
	eeh7+cVx2WG3wKoxjAs0V3YCvW8+6Ij+I+v+sN/MDg4zBOBBLtFKqqVIJLLsfKs4GLs3
	9RUnI0kEpsTGDrYZgkYyyIivfG4jQKKQ85mpzJqQOf+vZOVsxwx/yoTqY1QnggzRYQLL
	YPmgnCZkTlkDhcpfpf4Dw9yzdva+sGd2utpPxhPfSuWXedZj+Ah6T9nRLCupcolKrEfN
	m/1mZ9zxTJmX+lui7gh4nOxK4GaovaV8xydxNOARiXWQQ150G6K9ZS7wRSz135yMQYva
	qIgg==
MIME-Version: 1.0
Received: by 10.50.140.71 with SMTP id re7mr4611072igb.67.1334905455019; Fri,
	20 Apr 2012 00:04:15 -0700 (PDT)
Received: by 10.231.67.134 with HTTP; Fri, 20 Apr 2012 00:04:14 -0700 (PDT)
In-Reply-To: <CAMKF1sqi4v85hPqEqtWs1P367ySWd1vbARC8HtdZyt6NRiuzGQ@mail.gmail.com>
References: <CAOHjBZtTxc7L8OpwMsSFr_xqc6WVXRRWK7eV95BDxnOLrjMqyQ@mail.gmail.com>
	<CAMKF1sqi4v85hPqEqtWs1P367ySWd1vbARC8HtdZyt6NRiuzGQ@mail.gmail.com>
Date: Fri, 20 Apr 2012 09:04:14 +0200
Message-ID: <CAOHjBZuCkW7FspM51tb9a4=CUWCM6pdOf0zOyh8ob0oj6Ed=Xg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] gcc-runtime failure
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
X-List-Received-Date: Fri, 20 Apr 2012 07:13:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Many thanks guys,

just yesterday evening I was able to build gcc-runtime fixing the
configuration.

Cheers,
Giuseppe

2012/4/19 Khem Raj <raj.khem@gmail.com>

> On Thu, Apr 19, 2012 at 3:54 AM, Giuseppe Condorelli
> <giuseppe.condorelli@gmail.com> wrote:
> >
> > Please clarify this to me... :)
>
> gcc-runtime does not need target libgmp or libmpfr or libmpc
> infact its just the cross compiler which needs it.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

