Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OitYV-0005hB-W1
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 20:28:10 +0200
Received: by eyf5 with SMTP id 5so4072937eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=AtZNDpxpL5UWTlk1ULEyVt2OosiZGVh68BQ3xsk7+SA=;
	b=IVMiV8u7I+OMyxDx4hVnPVn/dlHSuPNjK9UvdjF7ZKZjNxI/dYoLOjx4PCsEwY8gSF
	7cbyXqHjWRB5upJXnw13TG9U1Tl0yc231A8RtPd3rfMoyr8nV5mIQcjEF5S9sjaBv7ND
	KuIFWctS3uBUmLDQNSIU1v2Es9HsWXGSwDyhI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=YrRB0o4dUR05FlX9n3xf/Ushw/D8WCx4Uxzukc5lW88fbkPqxSZ4eqW//XxFwWkHfD
	u07TfzqQ9kbW0Bd7nZX6wXDWnp9KnMUfEMiOPRvHBY+ghFs5EQR0Vlwyo3yGvtxKW5ZS
	SHMUE2ndzcNjqVCFFR4462H3FneK6CECVc53c=
Received: by 10.213.35.6 with SMTP id n6mr14010984ebd.0.1281464877235; Tue, 10 
	Aug 2010 11:27:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Tue, 10 Aug 2010 11:27:37 -0700 (PDT)
In-Reply-To: <20100810093550.GE10920@game.jcrosoft.org>
References: <20100810093550.GE10920@game.jcrosoft.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Aug 2010 11:27:37 -0700
Message-ID: <AANLkTi=KL6T1jja4umSRjzSyk8iuj9dMb9fwKK7YO6au@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-initial-4.3.3-r14.1 failed on SH4 angstrom
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
X-List-Received-Date: Tue, 10 Aug 2010 18:28:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2010 at 2:35 AM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:
> HI,
>
> =A0 =A0 =A0 =A0I'm currently trying to use OE for a titan (SH4) board wit=
h Angstrom distrib
>
> =A0 =A0 =A0 =A0I've attached my conf and log
>
> =A0 =A0 =A0 =A0gcc-cross-initial-4.3.3-r14.1 failled to compile due to th=
e fact that
> =A0 =A0 =A0 =A0it's include /usr/include
>
> =A0 =A0 =A0 =A0is some have any idea?


Please use gcc 4.4.4 for SH platform.

>
> Best Regards,
> J.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


