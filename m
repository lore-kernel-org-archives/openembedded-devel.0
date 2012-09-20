Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TEdXN-0005yv-DA
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Sep 2012 11:59:13 +0200
Received: by iebc11 with SMTP id c11so3074790ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Sep 2012 02:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=bvIBPcuAZLCfZY91VyYX7oyZs+NklwaUJXHdSECBttU=;
	b=zAP3KLIwpG5gULGgucvjgFFuyLoAeVPYSoJvEUqmcCYgn5MvZtEuTaitaG5xCXKs9B
	B8WTx6CNkzrYQCQarK8PejGJNw0YosA0/865Gr24K6pcXwIXzCI+H/itDrOJ4CdxGGL+
	iXlVsYC0QldTUNCYQ8sFQ5+QeP4BQW5jBxVH6LJYCEP6nDDl5jHQABS8Dt4tYBS5B/Bs
	uNtxtTrtlRY6RL4Q8pVudN8zjpXpkegusU75GcCVRY3YEQE2WAZ3TwDEdT9PZKguvSyW
	A/YFKWLXXXdC6I7molV12K3OkiUxxcZcFG6QDuJ2JEsvAKxlacgzI+UwopYdu9DdoNIO
	8p/g==
MIME-Version: 1.0
Received: by 10.50.183.135 with SMTP id em7mr1892404igc.31.1348134390517; Thu,
	20 Sep 2012 02:46:30 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Thu, 20 Sep 2012 02:46:30 -0700 (PDT)
In-Reply-To: <1348127459-8538-1-git-send-email-schnitzeltony@googlemail.com>
References: <1348127459-8538-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 20 Sep 2012 11:46:30 +0200
Message-ID: <CALbNGRSjwsOSKqw7zzbZZcQg5kc7WY+bke+hmYs+2_R-_nZysA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] lighttpd: move systemd appends since recipe is in oe-core
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
X-List-Received-Date: Thu, 20 Sep 2012 09:59:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2012 at 9:50 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../lighttpd/lighttpd/lighttpd.service             |    0
>  .../lighttpd/lighttpd_1.4.31.bbappend              |    0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/{meta-oe =3D> oe-core}/recipes-extended/lighttpd/lig=
httpd/lighttpd.service (100%)
>  rename meta-systemd/{meta-oe =3D> oe-core}/recipes-extended/lighttpd/lig=
httpd_1.4.31.bbappend (100%)
>
> diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/ligh=
ttpd.service b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/ligh=
ttpd.service
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd/light=
tpd.service
> rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd/lighttp=
d.service
> diff --git a/meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.=
31.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.3=
1.bbappend
> similarity index 100%
> rename from meta-systemd/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.3=
1.bbappend
> rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.=
bbappend
> --
> 1.7.6.5
>
This revolutionary patch has not made it into patchwork - so I'll resend it=
.

Andreas


