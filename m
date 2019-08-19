Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 962077F27B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 11:21:05 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id f9so1374375ljc.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 04:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v+7wbRX0HqERHyOa8DGcTgYhNwdb2T8qDVM8i3GBXsk=;
	b=YD7e3oHQYRE/0+VbVheCLFizbz0RGovjoGMwS+npos0xxFJW+IRpITgvUZ7wK638mv
	ifPAvqe72h0A3KP9Gw0aV4jiPOKdJSM/Cg0m/LJ3buZY4+k47++er3cbXk+pYkYVQGty
	qYMM8Tn3r6CqHblyr2HPnnJhMLhxysp1uLQ43bwgId0WVcCNERXVcWrXbUQuu5/kj+QR
	zYNxPVoBld/TyChiEqkzb4I8JISM3bW8Ulkxz0+6Ay0Tcsrb1R/oPe/lbJl9f5nzcOSj
	/bnW9YuA8OxpXNpjV9ZFzzGI/DWKOYHqvmdgkcKhJD2tbBoKlkiOrR/UCgagt53nqKal
	hLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v+7wbRX0HqERHyOa8DGcTgYhNwdb2T8qDVM8i3GBXsk=;
	b=YRAyRFTDQp6p/ivyVYyRbq251YtjwPlJBcIX6O1BaqMcrwTmgVE+COsZAweW6kWd/E
	u8W+Zyfv6JbO8q1cgT0ivY4DUYLdi1rxzblmdCFOpWzBLbNgB/DBLQ2cwoWz6a6MijCG
	S72tHD7l7zzmyotluRmxhTNPDTaJviksCe/tHCoVVFNicLV/VNoYeCDSBh5Fmjci7ztN
	hjVKg6lKxL6X00fytRByYF5WrNasclLlgtqTONIgjXVa1Kl9OvlpR7+JChnvpW0Ms89o
	6mfrGvRK3lkt3eVkrDOjYSs+A3195EijsYYaW4zTNs0AhjVlXMVIrSBMWnHM34sBNZBv
	yn5w==
X-Gm-Message-State: APjAAAVDbu1wHjF9p4c4WE9k2D4UZlNF8pCGF5HVGOS+nXXB+RuzrxxG
	YweuSSrsfqtQuziMvTkc5Je4TChJXIxXzL8+Tx7BOA==
X-Google-Smtp-Source: APXvYqwv+epqjzP+BZ5qgiyAcngmt5axGQ9gBEuYHB6wOIeAevWZyXbUFILF+5pZnt6Y2wMfw0q980N7h/5w24SxbiY=
X-Received: by 2002:a2e:8e87:: with SMTP id z7mr6619512ljk.211.1566213666060; 
	Mon, 19 Aug 2019 04:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <1a542261-a335-db48-e7ce-7c1dda207ff1@balister.org>
In-Reply-To: <1a542261-a335-db48-e7ce-7c1dda207ff1@balister.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 19 Aug 2019 04:20:57 -0700
Message-ID: <CAP71WjxFASX0tvkYA2+Bg9M8yquK4GZCWnoiV8xZ2AT04zr3Wg@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Yocto Project <yocto@yoctoproject.org>, "Volosincu,
	Andreea S" <andreea.volosincu@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Summit at ELCE Call for Particpation
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
X-List-Received-Date: Mon, 19 Aug 2019 11:21:06 -0000
Content-Type: text/plain; charset="UTF-8"

hi Philip,

thanks for sending this out!

On Mon, Aug 19, 2019 at 3:17 AM Philip Balister <philip@balister.org> wrote:
>
> At the past few OopenEmbedded developer meetings, people have been
> asking for more developer and user focused events like a miniconf.
> Partly based on this feedback, there is a two day event sponsored by the
> Yocto Project that provides a chance for people to talk about the Yocto
> Project and OpenEmbedded. The CFP is a bit buried on the page and I like
> to get it more exposure, so here the direct link:

all information about the Summit is also available here now:

https://wiki.yoctoproject.org/wiki/Yocto_Project_Summit_2019

>
> https://events.linuxfoundation.org/wp-content/uploads/2019/08/Yocto-Project-Summit-2019-CFP-1.pdf
>
> We'd like to see new faces talking. We know there are a lot of good
> stories out there, that will help lots of people become better users and
> developers.
>
> The link to the event is here:
>
> https://events.linuxfoundation.org/events/embedded-linux-conference-europe-2019/program/co-located-events/
>
> Follow the path to the Yocto Project Summit. If you are alrady signed up
> for ELCE, you should be able to update your registration to include the
> Summit.
>
> Philip
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

