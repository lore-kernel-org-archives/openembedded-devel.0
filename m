Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E18F7D72B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 12:50:55 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id s3so11994063itk.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=tRrcCeuD6J9sunkEqq9fcj3BLFeCFfQQufqXrpVBJm0=;
	b=C4keetpetpEN8bSPMDLFyLIc2TJxdSlf/4a8pjc7lqwJ6wL7C6RT86GI8vL6oTuN8K
	2qkndm1j5/cJDcDH5PbOR7S2fQWNuYt9GbXFGnwV6LLwaf/+CvEf223pJB4yx0Dy9F3m
	H1jRU+hYGho5hpwdEpOpSDEDP54sGlKol1uG5ijggXYCZYmvuZKIksVCHxlh02knnYgs
	6Kob7r5lgvfvK0EvOYvySaRBkI1vEzP1FILiz5cErXgIN5k+9L+AA7zazreOEP/C8Rdj
	kuFr5kO0S6JxAytvlbAx9vhGXkLmTFcEQLrFhX8KVuR+bl2yW+aLCGz7f2CqYu5gqfnw
	yo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=tRrcCeuD6J9sunkEqq9fcj3BLFeCFfQQufqXrpVBJm0=;
	b=rLCsBeDcTPRwmeNPyTrJoEkNr24or2JerniNVvVMKSM32d3s39V3RzBzNnxYF8SJmD
	ioxrwBAbmlkzWLc1ooxH3sp/x5OZzEM74Xn8Ea2YR3nuiHS0gA8aeGiVmB8I/TuKUGJP
	RXnvPXkWrO8XRYjPNxl/bMzYd7Bsla74yQUGZZnMCrtkW99y9WbT3irLqrHc0y/k0UbW
	5vtuYQjKCV5/TgUikboPdZxGJ7X8T/MXpisuF7UOsAAB92jBqdxdvP8cw4FMyv9D7UUh
	dYgCp3kImsxku0B6I9v4yPP2tEJ0jQDOTud49/gomUb0QNZISrGYoWgCi41qYFqqZtRA
	Uk5Q==
X-Gm-Message-State: APjAAAVA1xAtR8kQxw30c8IGicOfC0czxuqTsIDO7TAJjsGrunzdCXOA
	DQBbQV8Za/BFHo6GK9s5AwpTzGcP8UI2V682VxunTw==
X-Google-Smtp-Source: APXvYqzKq11IqlTLcH2gH7svtaLpS0Rp+yG4gkf5v2DREi7BnRB9ktlm/YeIXW9NjfAy2Y30VuE1at/lzej3adM/yFQ=
X-Received: by 2002:a24:46cc:: with SMTP id
	j195mr23746950itb.161.1555332656215; 
	Mon, 15 Apr 2019 05:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <1555330647-27749-1-git-send-email-vincent.prince.fr@gmail.com>
In-Reply-To: <1555330647-27749-1-git-send-email-vincent.prince.fr@gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 15 Apr 2019 14:50:44 +0200
Message-ID: <CAB2nKc_Pj=uiO3n7Nj0i49y0i6a+LOMifsTwRpz1A=+mehxPFA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Alistair.Francis@wdc.com, richard.leitner@skidata.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][PATCH] layer.conf: Add warrior to compatible release series
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
X-List-Received-Date: Mon, 15 Apr 2019 12:50:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry

I didn't see that patch already sent 2 times before.

Regards,
Vincent

Le lun. 15 avr. 2019 =C3=A0 14:17, Vincent Prince <vincent.prince.fr@gmail.=
com>
a =C3=A9crit :

> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index b03a608..90236be 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "meta-java"
>  BBFILE_PATTERN_meta-java :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-java =3D "10"
> -LAYERSERIES_COMPAT_meta-java =3D "thud"
> +LAYERSERIES_COMPAT_meta-java =3D "thud warrior"
>
>  LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
> --
> 2.7.4
>
>

