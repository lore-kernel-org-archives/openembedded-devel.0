Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLbTw-0004UK-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 14:03:25 +0100
Received: by fxm8 with SMTP id 8so111801fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 05:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=4X1Jt0hNYTMBVnKniIoP9f6zFy6vrz+7/DAac71z3z8=;
	b=GKZLwsUy6Vl4r8+iE3Y5/aR40miJPB7REpReT/Jo82zmZNrgblxgO8ipfaOv+cmaBS
	/dssdRfKEdWi4GbrltyEYmEpJYwtq0YfIpE55BG3awL9+UNYu00dmW4JFT1gpQTwcJRg
	I7nsmct4okc4/8y84uNNrZ0Ofe/JnVdVp3YIw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=JFRHP1lpH5ZrxqOY1/V0mj1oewTTGLnnEMdPGfMSOStM77toK06ZN4MhQiEPVnjhbv
	rhp6VPiGG4fDWndQ34HkJPjFOQ+xglBySbInO2HNtLYNvR6jo7JRDzRmonsOnCAfLSlf
	A64nT5+1DuoP0nZ81KWQyQoqVAi66HuUY2DyY=
Received: by 10.223.118.136 with SMTP id v8mr703411faq.90.1290690128948;
	Thu, 25 Nov 2010 05:02:08 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n6sm182586faa.4.2010.11.25.05.02.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 05:02:08 -0800 (PST)
Date: Thu, 25 Nov 2010 14:01:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125130156.GP3274@jama>
References: <4CEC1E17.1030208@sensortherm.de>
	<AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
	<AANLkTimymQB4kxvp-ybAzpUMMxQNy43GZyxKNzmRH3Uw@mail.gmail.com>
	<20101124080705.GF3274@jama>
	<AANLkTinv88_9h_1RB8OS5XuqSV2zKBhS2FcxMrpsWh8e@mail.gmail.com>
	<4CEE5186.7070907@sensortherm.de>
	<AANLkTi=LJkDCTR_PsUR52VuB9ckpms82MYyn9uyhO9hL@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=LJkDCTR_PsUR52VuB9ckpms82MYyn9uyhO9hL@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: I've downloaded oe
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
X-List-Received-Date: Thu, 25 Nov 2010 13:03:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 25, 2010 at 01:44:13PM +0100, Frans Meulenbroeks wrote:
> 2010/11/25 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:
> > Am 24.11.2010 10:18, schrieb Frans Meulenbroeks:
> >>
> >> 2010/11/24 Martin Jansa<martin.jansa@gmail.com>:
> >>>
> >>> On Wed, Nov 24, 2010 at 08:52:41AM +0100, Frans Meulenbroeks wrote:
> >>>>
> >>>> What about moving all recipes that do not fetch and also did not fetch
> >>>> during Martins test from last march/april to a directory non-fetching
> >>>> or so?
> >>>
> >>> But those recipes were only those where I wasn't able to find the source
> >>> at all (even with google help and couple of popular premirrors). Any
> >>> origin for source was fine for me, because I was only interested in
> >>> checksum check.
> >>>
> >>>> Apparently these are non fetchable for a long time, with no one
> >>>> apparently building them or having an interest to fix them.
> >>>
> >>> More likely those who were building those before are still building
> >>> OK, because they had it in theirs downloads dir. (but the second part is
> >>> right :/).
> >>>
> >>>> My proposal would be to do that before the release is made, thereby
> >>>> improving the % of the recipes that build.
> >>>
> >>> We can improve it also by putting those missing upstream files to
> >>> sources.openembedded.org and use it as premirror. But first we hav to
> >>> find someone who still have it in downloads dir :/ (I don't).
> >>>
> >>> Removing recipes would need to remove those also from tasks/images and
> >>> in the end release images could miss some important functionaly in worst
> >>> case.
> >>
> >> I think most of the non fetching recipes would fall into one of these
> >> categories:
> >> - recipes that are very specific and are not part of a task or image
> >> - recipes that are older versions and that are not used/build
> >>
> >> Wrt the remark on missing important functionality:
> >> For a user with a clean slate, the functionality is already missing as
> >> the task/image cannot be build from scratch.
> >>
> >> It might be a good idea to do a test trying to build all images for
> >> one distro/machine and see what comes out.
> >> Start with a clean system (empty downloads dir, empty TMPDIR, no
> >> pstaged files etc).
> >> Then bitbake all images. By doing it subsequently without cleaning
> >> TMPDIR inbetween it'll become clear which images do build from scratch
> >> and which don't.
> >>
> >> Is someone able/willing to do this test and report the result (suggest
> >> using distro minimal or angstrom or probably shr and machine angstrom)
> >>
> >> Frans
> >
> >
> > Is it usefull to have an image with all/most recipes? This image can be used
> > for testing the recipes (fetch, compile) for several machines.
> 
> This functionality exists:
> 
> do a
> bitbake world
> or if you only want to fetch:
> bitbake -c fetchall world

Also define
SOURCE_MIRROR_FETCH
to ignore COMPATIBLE_* vars

and still it doesn't catch ie
SRC_URI_machine, SRC_URI_distro

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


