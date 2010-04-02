Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxlYU-00026c-OA
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 20:25:21 +0200
Received: by iwn8 with SMTP id 8so256920iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 11:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VpwnczScqZFx2jtDx2v+C+svAy+Y0INZyvH8/YkjZkw=;
	b=WPCps90phwB0xJgwoRgbBjKR0z/o2ABlZKu39BN5yTdsg2tx1boTk5sK7U7sXA5QQm
	3ovvtipbWNAzUmrWvvVoGrZYgIkT5lbEDOj+8kByxRb6uBFzBfO/YsjeOhv5CYFfKud9
	GXQUw0LQrxuQLMB3eAartxB1JMbCDQ3jjy2Bs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Bw0nud+Aao9DlRMrCSoQtTKQ2/aXHraztv51r3xqCps+80yFBlTyM/T6E4G06pU3f7
	8ByvME5XiT73bLq0Mfm25RYYUK9CNnSDIU9hmRJr6U/C0jtpsBq/nuhT8hME2eDf5bi1
	zzRtTshp6dQKnj6+qK+ooCuYFskkFZQrk2LWM=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Fri, 2 Apr 2010 11:21:59 -0700 (PDT)
In-Reply-To: <1270223043.3873.21.camel@mattotaupa>
References: <1270223043.3873.21.camel@mattotaupa>
Date: Fri, 2 Apr 2010 11:21:59 -0700
Received: by 10.231.172.203 with SMTP id m11mr988927ibz.15.1270232519985; Fri, 
	02 Apr 2010 11:21:59 -0700 (PDT)
Message-ID: <g2s19c1b8a91004021121u8a172494q4b654e41a24e443c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libplayer: Update `SRCREV` to 4fb30e64db79 [1].
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
X-List-Received-Date: Fri, 02 Apr 2010 18:25:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 2, 2010 at 8:44 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> [1] http://hg.geexbox.org/libplayer/rev/4fb30e64db79
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/libplayer/libplayer_hg.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/libplayer/libplayer_hg.bb b/recipes/libplayer/libpla=
yer_hg.bb
> index cfe150b..59354cb 100644
> --- a/recipes/libplayer/libplayer_hg.bb
> +++ b/recipes/libplayer/libplayer_hg.bb
> @@ -1,8 +1,8 @@
> =A0require libplayer.inc
> =A0PV =3D "1.0.0+hg"
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> -SRCREV =3D "a628f49d952a"
> +SRCREV =3D "4fb30e64db79"
>
> =A0SRC_URI =3D "hg://hg.geexbox.org;module=3D${PN};rev=3D${SRCREV}"
>
> --
> 1.7.0.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


