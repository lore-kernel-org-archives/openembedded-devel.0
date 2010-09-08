Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtM37-0001hZ-Gk
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:55:00 +0200
Received: by yxk30 with SMTP id 30so63089yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hQuGxFUtlI6BqAJu2QfEpcNq05SWwbJKbdilBHC5eXQ=;
	b=wYmS4neMKiMHAtAzXCnslwu4cdjPVTCFaKofrIwnt6IC8xFPEtwBs80s49L3a1W+dV
	fKV7WOURCTegAcxgv+yKsAoBAifoo78NEHH5P+dvBuyoThh+X3OP+c4HEwQZVYeWv1ZK
	2vhvphYbB/4vqAu8wRLvBN0e5C3hrZQN3HtwY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m11I2912FiKxJ2f/MDF8M+xe0Pr5mJKBBSZHjvIyItfveQmQhDSHODWlZbQ4xhfQiM
	WudGHLeHxQRzQGgsvmnUJDtKf3iO7lUL8Xo3R/F1bMUyamaoZauZwJWbNlJSm3DtkHhw
	eXfeHbWers5K6gMFxiUi+8DB5KdTzre69NTyY=
MIME-Version: 1.0
Received: by 10.150.219.1 with SMTP id r1mr118321ybg.173.1283957651202; Wed,
	08 Sep 2010 07:54:11 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 07:54:11 -0700 (PDT)
In-Reply-To: <1283954503-25418-3-git-send-email-eric@eukrea.com>
References: <1283954503-25418-1-git-send-email-eric@eukrea.com>
	<1283954503-25418-2-git-send-email-eric@eukrea.com>
	<1283954503-25418-3-git-send-email-eric@eukrea.com>
Date: Wed, 8 Sep 2010 16:54:11 +0200
Message-ID: <AANLkTinfxZO07kTjsaFWWZfXzwAdPgKNZAaWEKV-ZTVg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] rlpr: remove version 2.05
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
X-List-Received-Date: Wed, 08 Sep 2010 14:55:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/8 Eric B=E9nard <eric@eukrea.com>:
> now replaced by 2.06
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
> =A0recipes/rlpr/rlpr_2.05.bb | =A0 20 --------------------
> =A01 files changed, 0 insertions(+), 20 deletions(-)
> =A0delete mode 100644 recipes/rlpr/rlpr_2.05.bb
>
> diff --git a/recipes/rlpr/rlpr_2.05.bb b/recipes/rlpr/rlpr_2.05.bb
> deleted file mode 100644
> index 2751b9f..0000000
> --- a/recipes/rlpr/rlpr_2.05.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "rlpr makes it possible to print files on remote sites t=
o your networked printers"
> -HOMEPAGE =3D "http://freshmeat.net/projects/rlpr/"
> -SECTION =3D "console/network"
> -LICENSE =3D "GPL"
> -PR =3D "r1"
> -
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/r/rlpr/rlpr_2.05.orig.tar.gz"
> -SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
> -SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f3=
efe22d16af14ba9a"
> -
> -inherit autotools
> -
> -do_configure() {
> - =A0 =A0 =A0 =A0oe_runconf
> -}
> -do_install() {
> - =A0 =A0 =A0 =A0make install DESTDIR=3D${D}
> -}
> -
> -TARGET_CC_ARCH +=3D " ${LDFLAGS}"
> --
> 1.6.3.3
>

if you are updating a recipe I suggest to use git mv
That way the history is retained.

Frans


