Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PRLdD-0008OR-1k
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Dec 2010 10:20:44 +0100
Received: by pzk12 with SMTP id 12so240296pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Dec 2010 01:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=8QoiANY/E+wZy3RZR6t7iyKjldcea9XZjbLL+25rWuI=;
	b=v/2iDt4979f7QlzGil84jWjQd15zTLWfLrBylt9qEanLXLF9CYI5ISjO+DB1UJDDeR
	TFjevNjJxCuJj7Nl1j5vfaHcS6ftFT4qsCbPHHOncSP5Xe+c4bmDoOBU3UOJ4163AAid
	TO0pVBC+xkYGdWyuk/CUyVia9ZaupwDKlR7sU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=iCZQIuAvZnxGWAX1TBId5Te0B2/4fEK9yLJjoReNaxltAJBNDuhoybu/bfu4211kWQ
	QENqg7zbVlT3UOldYROOyA0inLDzhsGo4mw/bbe1IOd6tjsmByWdzORfFP9VxDBM8U6w
	DMWqZoAIAdDAB2PC/xmG6ODbyDOhFnA61WB0s=
Received: by 10.142.211.20 with SMTP id j20mr1223025wfg.408.1292059145408;
	Sat, 11 Dec 2010 01:19:05 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y42sm5315094wfd.10.2010.12.11.01.19.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 11 Dec 2010 01:19:04 -0800 (PST)
Date: Sat, 11 Dec 2010 01:19:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101211091904.GD8894@gmail.com>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D4A0@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5CE@DEMCHP99E35MSX.ww902.siemens.net>
MIME-Version: 1.0
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5CE@DEMCHP99E35MSX.ww902.siemens.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-directfb: fixed qa_configure error
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
X-List-Received-Date: Sat, 11 Dec 2010 09:20:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (29/11/10 11:18), Aeschbacher, Fabrice wrote:
> Hi,
> 
> Is this patch likely to be accepted and commited soon in branch release-2010.12, or should I overlay?

applied thanks for patch

> 
> With kind regards,
>   Fabrice Aeschbacher
> 
> > -----Ursprüngliche Nachricht-----
> > Von: openembedded-devel-bounces@lists.openembedded.org 
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] Im 
> > Auftrag von Aeschbacher, Fabrice
> > Gesendet: Freitag, 26. November 2010 15:47
> > An: openembedded-devel@lists.openembedded.org
> > Betreff: [oe] [PATCH] libsdl-directfb: fixed qa_configure error
> > 
> > * without this patch, ${STAGING_DIR}/bin/directfb-config 
> > --cflags returns:
> >     -I/usr/include/directfb -D_REENTRANT
> >   which makes qa_configure complain about /usr/include
> > 
> > 
> > Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
> > ---
> >  recipes/libsdl/libsdl-directfb_1.2.14.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes/libsdl/libsdl-directfb_1.2.14.bb 
> > b/recipes/libsdl/libsdl-directfb_1.2.14.bb
> > index 9f22ee5..4a3dab0 100644
> > --- a/recipes/libsdl/libsdl-directfb_1.2.14.bb
> > +++ b/recipes/libsdl/libsdl-directfb_1.2.14.bb
> > @@ -41,6 +41,7 @@ do_configure_prepend () {
> >          # Remove old libtool macros.
> >          MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 
> > ltsugar.m4 ltversion.m4"
> >          for i in ${MACROS}; do
> > -               rm acinclude/$i
> > +               rm -f acinclude/$i
> >          done
> > +	export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> >  }
> > -- 
> > 1.5.6.5
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


