Received: from hm1479-15.locaweb.com.br ([201.76.49.85])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <angelo@pynell.com>) id 1PGsHJ-0008Fy-LW
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 12:58:53 +0100
Received: from hm2076.locaweb.com.br (189.126.112.72) by
	hm1479-21.locaweb.com.br (PowerMTA(TM) v3.5r15) id hrklru0nvdc7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 09:57:44 -0200 (envelope-from <angelo@pynell.com>)
Received: from [189.126.112.72] (localhost [127.0.0.1])
	by hm2076.locaweb.com.br (Postfix) with ESMTP id 4BAD334002E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 09:57:44 -0200 (BRST)
Received: from cl07.mobimail.com (unknown [186.202.1.228])
	by hm2076.locaweb.com.br (Postfix) with ESMTP id 2FE473401E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 09:57:43 -0200 (BRST)
Received: from [201.13.206.182] (account angelo@pynell.com HELO
	[192.168.0.166])
	by hm4007.cl07.mobimail.com (CommuniGate Pro SMTP 5.3.8)
	with ESMTPSA id 17144349 for openembedded-devel@lists.openembedded.org; 
	Fri, 12 Nov 2010 09:57:16 -0200
From: "Angelo S. Mavridis Bartolome" <angelo@pynell.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.1.1289559602.31843.openembedded-devel@lists.openembedded.org>
References: <mailman.1.1289559602.31843.openembedded-devel@lists.openembedded.org>
Organization: Pynell - Development & Software
Date: Fri, 12 Nov 2010 09:57:14 -0200
Message-ID: <1289563034.2119.2.camel@pynell.ftp>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 (2.30.1.2-2.fc13) 
X-SA-Exim-Connect-IP: 201.76.49.85
X-SA-Exim-Mail-From: angelo@pynell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] metano.conf - Added on image file name the	IMAGE_BASENAME
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
X-List-Received-Date: Fri, 12 Nov 2010 11:58:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> Date: Fri, 12 Nov 2010 10:39:19 +0100
> From: Paul Menzel <paulepanter@users.sourceforge.net>
> Subject: Re: [oe] [PATCH] metano.conf - Added on image file name the
> 	IMAGE_BASENAME
> To: openembedded-devel@lists.openembedded.org
> Message-ID: <1289554759.4282.19.camel@mattotaupa>
> Content-Type: text/plain; charset="utf-8"
> 
> According to the commit policy [1] a colon goes after the changed file.
> 
>         [PATCH] metano.conf: add IMAGE_BASENAME to IMAGE_NAME
> 
> Am Donnerstag, den 11.11.2010, 22:24 -0200 schrieb angelox_123:
> 
> Sorry for nitpicking the commit message. Since you are going to send
> further patches, I think it is beneficial since you can consider these
> rules in the future. The commit messages of Git are normally very well
> written and can serve as an example [2]. Also beware that I am no native
> speaker either so my remarks could be wrong.
> 
> >  * Added IMAGE_BASENAME on Metano Distro configuration file on IMAGE_NAME
> 
> Add IMAGE_BASENAME to IMAGE_NAME in Metano?s configuration file.
> 
> (Use present tense in the commit message.)
> 
> >  * This will help we to identify the names of our images :)
> 
> s/we/me/
> 
> >  * By: angelox_123 (from IRC #metano_linux),developer and mainteiner of Metano Distro
> 
> maint*a*iner
> 
> > Signed-off-by: angelox_123 <angelox.123@gmail.com>
> 
> Since non of your patches have been pushed yet (?), is it on purpose you
> are using your IRC nick name in the SOB line? I would prefer your real
> name but it is no requirement as far as I know. For the statistics you
> should decide what you are going to use and stick to it.
> 
> > ---
> >  conf/distro/metano.conf |    5 +----
> >  1 files changed, 1 insertions(+), 4 deletions(-)
> > 
> > diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
> > index 9bab8d9..ae29e7d 100644
> > --- a/conf/distro/metano.conf
> > +++ b/conf/distro/metano.conf
> > @@ -56,7 +56,7 @@ IPKG_VARIANT = "opkg"
> >  #############################################################################
> >  # IMAGES CONFIGURATION
> >  #############################################################################
> > -IMAGE_NAME = "Metano_Linux-PD.Edition-${DISTRO_VERSION}-${MACHINE}"
> > +IMAGE_NAME = "Metano_Linux-PD.Edition-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
> >  
> >  CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
> >  DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
> > @@ -119,12 +119,9 @@ DISTRO_EXTRA_RRECOMMENDS += " \
> >      kernel-module-ext2 \
> >      kernel-module-ext3 \
> >      kernel-module-af-packet \
> > -    mplayer \
> >      alsa-lib \
> >      alsa-utils \
> >      nano \
> > -    gpe-filemanager \
> > -    gpe-mini-browser \
> >      ${XSERVER} \
> >      avahi-daemon \
> >      avahi-autoipd \
> 
> The removal of these programs are not mentioned in the commit message
> and should be in a separate patch. You can use `git rebase -i HEAD~4`
> and `git add --patch` to split this up.
> 
> 
> Thanks,
> 
> Paul
Thanks paul by changes,i'm very very newbie on that :) and sorry by my
wrong message :(
git created a patch with another patch into it (added IMAGE_BASENAME)
with the patch of packages (removed gpe-*** mplayer) sorry by this...
I'll try again later :(

Thanks.
Angelo


