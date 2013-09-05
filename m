Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9A8A60FE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:10:33 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so1773740pbb.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 06:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=n5vEP95lER9IrMwWBTGolYBsfP57owva9s9bQz8d5XE=;
	b=eBauNKkVaruOJtVx4TfB/cC2tlwjcz8R+ppcfX+haOx9y/f5k9P2gpOUaCqNc6+Zlw
	wP6T3mpnrbQXbvhQ3GKLKcO3HHdOsB+/l9JVCygbNl0cp+jxnpGSGzocxPxjwJ3TR0cz
	IIq1L/T6D299Y/p8ZzXU4XQBEzSYBsVmsANP+of7TjnBNUaulUwwS+PRISYVVjy/kvfh
	iCBtpwpUO9TzCPGXwTCtZW2i944QRqq19pDd9q77kEimVpRqc/7hPkGx97+56y4BFAJ6
	eT6YJ0/rskPk3jf1xJEYLdh8YaNsX+3ehOfPqo1fG9G9BDvBno7Ty5kOMOEdFX0PvdGA
	f0NQ==
X-Gm-Message-State: ALoCoQlrCdPflq4veDv1aAkE3MwKI2vXTssm6YjkxZnvzItn1Ul93GttEpb5WAHpbDiOxVLYXuSH
MIME-Version: 1.0
X-Received: by 10.66.155.102 with SMTP id vv6mr9257392pab.89.1378386634439;
	Thu, 05 Sep 2013 06:10:34 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 5 Sep 2013 06:10:34 -0700 (PDT)
In-Reply-To: <20130905130910.GH5086@deserted.net>
References: <CAOMwXhN2MBV=1pB7ZUsm+Qt7aN-c7tuOY8u5F3s8VrZ2iR5zJA@mail.gmail.com>
	<20130905130910.GH5086@deserted.net>
Date: Thu, 5 Sep 2013 14:10:34 +0100
X-Google-Sender-Auth: fy6Gt1xmh7AjqCgJtP27C81HzEE
Message-ID: <CAOMwXhPH7KwrY8nX0HCZ0SCFf7QC7iELOkvS8DFrv38i85PYEw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Joe MacDonald <joe@deserted.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] stunnel: Add 4.56 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 13:10:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks.


On Thu, Sep 5, 2013 at 2:09 PM, Joe MacDonald <joe@deserted.net> wrote:

> [Re: [meta-networking][PATCH] stunnel: Add 4.56 version] On 13.09.05 (Thu
> 06:06) Laszlo Papp wrote:
>
> > Seriously: ping?
>
> I guess I should've replied directly to this rather than burying my
> follow-up on it in another thread.  Sorry.  It's been merged and is in a
> small queue of other fixes and updates I'm about to push.
>
> -J.
>
> >
> >
> > On Wed, Sep 4, 2013 at 8:47 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >
> >     Ping?
> >
> >
> >     On Thu, Aug 22, 2013 at 8:07 PM, Laszlo Papp <lpapp@kde.org> wrote:
> >
> >         Signed-off-by: Laszlo Papp <lpapp@kde.org>
> >         ---
> >          meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 14
> >         ++++++++++++++
> >          1 file changed, 14 insertions(+)
> >          create mode 100644 meta-networking/recipes-support/stunnel/
> >         stunnel_4.56.bb
> >
> >         diff --git a/meta-networking/recipes-support/stunnel/
> stunnel_4.56.bb b/
> >         meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> >         new file mode 100644
> >         index 0000000..0ee8cc8
> >         --- /dev/null
> >         +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> >         @@ -0,0 +1,14 @@
> >         +SUMMARY = "SSL encryption wrapper between remote client and
> local
> >         (inetd-startable) or remote server."
> >         +SECTION = "net"
> >         +LICENSE = "GPLv2"
> >         +LIC_FILES_CHKSUM = "file://COPYING;md5=
> >         f41ebed8571077706fee0b860c4d6666"
> >         +DEPENDS = "openssl"
> >         +
> >         +SRC_URI = "https://www.stunnel.org/downloads/${BP}.tar.gz"
> >         +
> >         +SRC_URI[md5sum] = "ac4c4a30bd7a55b6687cbd62d864054c"
> >         +SRC_URI[sha256sum] =
> >
> "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2ec8d2778a01c871293"
> >         +
> >         +inherit autotools
> >         +
> >         +EXTRA_OECONF += "--with-ssl='${STAGING_INCDIR}' --disable-fips"
> >         --
> >         1.8.3.4
> >
> >
> >
> >
> >
>
> --
> -Joe MacDonald.
> :wq
>

