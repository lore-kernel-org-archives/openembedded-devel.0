Received: from mail-oa0-f48.google.com ([209.85.219.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tq6hp-0006Wv-C8
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2013 19:36:59 +0100
Received: by mail-oa0-f48.google.com with SMTP id h2so12446024oag.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=mu6IFDDp6TlO+tMldPgM26wU2984seDmcweutf+H2FE=;
	b=wS+lGy+mXr2VTWGRc6riHA52cgCKpA4etUgUCm1KKMp023NrKXlkHjcnsGWxJN95Mu
	Au52QhZ8jgmwlL7Uk5oWrsibX/JtBT9mHhdq/QPrWx5CpzdXKQIhS+fGbXb58yMD7uiG
	UHZr6PUg6hDyHxw1p+qHM4ZfobYj+wbGd8TXNgPjBMMFgxKXMpB1IQUpfZJvz9+5uyAj
	XZzMnugugmnT5glU9/DRDk53IeN2vAYrDdItSvENRp+rO2iv2MEUrvGFWWtl3ZFpPETu
	TS1njyBmLwtXN7iDeISrSX42AJQA4A8YfyezEp44302z5XuapBODMUlb1bd2yXw2EPue
	zUrg==
MIME-Version: 1.0
Received: by 10.60.171.146 with SMTP id au18mr24095731oec.108.1357064511669;
	Tue, 01 Jan 2013 10:21:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 1 Jan 2013 10:21:51 -0800 (PST)
In-Reply-To: <CAP9ODKr_NPX9kgu1jFWkrvhzM=0qFdHv4S9cZs0cGr=7z-iGZg@mail.gmail.com>
References: <CAP9ODKr_NPX9kgu1jFWkrvhzM=0qFdHv4S9cZs0cGr=7z-iGZg@mail.gmail.com>
Date: Tue, 1 Jan 2013 16:21:51 -0200
X-Google-Sender-Auth: 1CuFcAFpiNLb112klW8RttKvWB4
Message-ID: <CAP9ODKp=wXUgCTgVVJQ_C9BAa5in+=ufWoyCNq-73aR6CsTcGA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [for-danny] Patches for backport
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
X-List-Received-Date: Tue, 01 Jan 2013 18:37:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 21, 2012 at 4:22 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello Eric,
>
> So we did a new set of changes in master, which we'd like to backport.
> The changes are, in order:
>
> 2ac0acc2753f9853928a081cbc80c3daacbe7e08 xf86-video-geode: Add
> rdepends on EXA Xorg module
>
> ade2d4d35e1efdd83bb555949bcfb8c7a1970ff0 xinput-calibrator: Fix
> service file to require display-manag
>
> 43c2d4d3ca9889e54646e02d110d8155da96772c openmotif: Update SRC_URI and
> add libxft in depends
>
> 1db0dbf9a8bf2f09ddbc09a4ccde227fdf9a866a openmotif: Disable printing support
>
> 38daf64fb87bbc34caad050e7295b910c9b80e7c openmotif: Avoid use os Xos.h from host

Ping?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


