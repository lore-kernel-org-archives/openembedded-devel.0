Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R0tKT-0000iV-Jt
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 12:56:33 +0200
Received: by qwm42 with SMTP id 42so5805188qwm.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=e0JC35nmb7BLHDDjt3Ve4J79bRyfckoHgX5Ke9nR5v8=;
	b=BH71zlnslcw3pVJ7OR0qqcJvR/vLHdgLz5E3fka2xPNCnAoNuI3uZOXNnAZAr89P/f
	ihgsMQwWv5TFNs7y5ZEI4yWKMVm9IYPJjuYOhGSzKrvyp2YFK4YXluQLL+yuBxwy44xR
	j0wvCc0zL4n068a3Xhv956Zp72HyDyylJBLgY=
Received: by 10.224.184.20 with SMTP id ci20mr785812qab.49.1315306292141; Tue,
	06 Sep 2011 03:51:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Tue, 6 Sep 2011 03:51:12 -0700 (PDT)
In-Reply-To: <1315305904.4717.9.camel@mattotaupa>
References: <CACrTVgL3To0AH5H35aBYSuhVif8EK69eAaf2DeB+-7z-y8hDVA@mail.gmail.com>
	<1315304074.4717.6.camel@mattotaupa>
	<CACrTVgJnDNks+eJhBP4Pj8o6PLqaZi2sVR62Nw67jKz=Sqj4iA@mail.gmail.com>
	<1315305904.4717.9.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 6 Sep 2011 12:51:12 +0200
Message-ID: <CACrTVg+Zig-sAR=gUR2yt+8pRtzx_+gSBYLUnL4qro=A8t9L-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] binutils_2.21: recipes updates to new version 2.21.1
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
X-List-Received-Date: Tue, 06 Sep 2011 10:56:33 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Paul,
I had already resent my patch with proper -M -C option.
Sorry for the noise. It is missing the v2 thing. is it ok?
Thanks again. and next I hope it will be good from the start.
Greetings,
Sylvain



2011/9/6 Paul Menzel <paulepanter@users.sourceforge.net>

> Am Dienstag, den 06.09.2011, 12:22 +0200 schrieb Sylvain Par=E9:
>
> > thank you. I was just seing these *@# line breaks..
> > So yes I will use git-send.
> >
> > So about my patch I re-send a new one right?
>
> Yeah, fix the commit message with `git commit -s --amend` or `git rebase
> -i =85`, create a new file with
>
>        git format-patch -s -1 -M -M -C -C -C --subject-prefix=3D"PATCH
>        v2"
>
> and use `git send-email =85`.
>
>
> Thanks,
>
> Paul
>
>
> [1]
> http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

