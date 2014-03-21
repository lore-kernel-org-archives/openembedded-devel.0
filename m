Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E955E6F9F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 14:42:45 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hn9so577822wib.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=PyUejoLdzPXZneLfyWbpMqin2XlZoYzwjw5+ifyEk1M=;
	b=D1i++2x+MBbUeKOU64HuK6PUgQ3pHf8U538CIOaoccX5PPiSid2Bgh3tILNW65V5Kg
	onvvmyt+M1gqtqzjvU1zR8HTAGyCgOMTRkB+KX2rDr1SHPX35ZWRFfF2z/wzjlv9oydY
	A/j7zCh+GpG9CW9/fXtFyeg9bewhXZI7j+W8+2CzjrG8ZyMAK1lm3Y+VfxP0Shczwb9C
	tJNA6AActOlWFdonm/5N35HtfnLG6ZmVHUBk7zYFpKEYOANn9jgtcmNQ1e2TfU4wKAl3
	qUWnCzhJuWo/Ad5gT+ElbIaVeYoGyKo8uu1L34Su5OfpUnmPss0TCXwdhtu7LwW/+PWJ
	SWUw==
MIME-Version: 1.0
X-Received: by 10.180.189.43 with SMTP id gf11mr2489328wic.32.1395412966561;
	Fri, 21 Mar 2014 07:42:46 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Fri, 21 Mar 2014 07:42:46 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16D66FE6@IRSMSX105.ger.corp.intel.com>
References: <20140318191639.8B05350385@opal>
	<969F26A8BAB325438E7EB80D3C3134FB16D65A80@IRSMSX105.ger.corp.intel.com>
	<20140320105510.GC3726@jama>
	<969F26A8BAB325438E7EB80D3C3134FB16D66FE6@IRSMSX105.ger.corp.intel.com>
Date: Fri, 21 Mar 2014 07:42:46 -0700
Message-ID: <CAOLEWZXq-PumcSVjNdAAHfgsN4vupJ11G3=o1WbOA8EVL7xY3A@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9
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
X-List-Received-Date: Fri, 21 Mar 2014 14:42:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

I had that patch in my local tree for a few weeks and didn't check (again)
upstream for another release.  Just good timing on my part, I guess...

Steve


On Thu, Mar 20, 2014 at 4:27 AM, Iorga, Cristian
<cristian.iorga@intel.com>wrote:

> It's ok in that case.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Martin
> Jansa
> Sent: Thursday, March 20, 2014 12:55 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: openembedded-commits@lists.openembedded.org
> Subject: Re: [oe] [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9
>
> On Thu, Mar 20, 2014 at 06:59:13AM +0000, Iorga, Cristian wrote:
> > Hi Martin,
> >
> > Errr, what exactly is going on here?
> > I have submitted this patch in a different form, with more content and
> more comments.
>
> Stephen submitted upgrade from 0.18.4 to 0.18.8 before you and it was
> applied first.
>
> So what was left from your patch after rebase was upgrade from 0.18.8 to
> 0.18.9.
>
> If you don't agree I will merge just Stephen's patch and you can send new
> one after rebasing it yourself.
>
> Thanks
>
> > That's one thing.
> > Another thing would be that even if you signed my patch in a modified
> form, 5 minutes later, you signed another musicpd patch, going backwards
> from my version.
> > Quote:
> > " Module: meta-openembedded.git
> > Branch: master-next
> > Commit: dde222cef9bb8ef20d139ab58760b27c4d45c93a
> > URL:
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=dde222cef9bb8ef20d139ab58760b27c4d45c93a
> >
> > Author: Stephen Arnold <stephen.arnold42@gmail.com>
> > Date:   Sun Mar 16 17:52:47 2014 -0700
> >
> > musicpd/mpd: bump to current upstream stable
> >
> > Bump music player daemon to the latest upstream stable release.
> > Same as previous 0.18.4 recipe with trivial updates.
> >
> > Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>"
> >
> > The only thing, let's say improved, from my patch to Stephen's patch
>  would be the site URL.
> >
> > So which one is it?
> > Still, yet, no patch got into the master, while I am stuck with a bug
> that I have not caused and, still, seems that I am responsible for it.
> >
> > Also, mpd v0.18.8 will still not fix the crash with libvorbis upgrade..
> >
> > I must say that from my point of view this is getting
> counterproductive...
> >
> > Regards,
> > Cristian Iorga
> > YP
> > Intel Corporation
> >
> >
> > -----Original Message-----
> > From: openembedded-commits-bounces@lists.openembedded.org
> > [mailto:openembedded-commits-bounces@lists.openembedded.org] On Behalf
> > Of git@git.openembedded.org
> > Sent: Tuesday, March 18, 2014 9:17 PM
> > To: openembedded-commits@lists.openembedded.org
> > Subject: [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9
> >
> > Module: meta-openembedded.git
> > Branch: master-next
> > Commit: 2e1305783023e6b0869e8ea12db25c53b803f545
> > URL:
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=2e1305783023e6b0869e8ea12db25c53b803f545
> >
> > Author: Cristian Iorga <cristian.iorga@intel.com>
> > Date:   Mon Mar 17 11:05:17 2014 +0200
> >
> > musicpd: upgrade to 0.18.9
> >
> > * Upgrade fixes a crash with libvorbis 1.3.4;
> >
> > Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > ---
> >
> >  .../recipes-multimedia/musicpd/{mpd_0.18.8.bb => mpd_0.18.9.bb}
> | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> > b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> > similarity index 93%
> > rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> > rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> > index b6882af..c3bb581 100644
> > --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> > +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> > @@ -10,8 +10,8 @@ SRC_URI = " \
> >      file://mpd.conf.in \
> >  "
> >
> > -SRC_URI[md5sum] = "7bbe1caf5abe404dc985ca4f44984b1f"
> > -SRC_URI[sha256sum] =
> "5366378e548fb77996cc33b0e15165ddd84f1e496bdd04616bd593aecdc26450"
> > +SRC_URI[md5sum] = "0e5156a831d4302d2032998bcfd5c36f"
> > +SRC_URI[sha256sum] =
> "0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be5346f19de5f699a68de"
> >
> >  inherit autotools useradd systemd
> >
> >
> > --
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

