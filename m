Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYPut-0004DQ-Gy
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 23:24:43 +0100
Received: by iadj38 with SMTP id j38so1540146iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 14:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pBtNa0MAG0+JFglkpeDK+tVoDICA2VGb95hhBMR0YB0=;
	b=jxGeHWVh/qN8kKPemqfkg8ECkgvj0b+uSMPVVrNkkMgFP6Cd34ds4AMf/QjqRxzu09
	GdAibKOsw1RfR6Gx5rHMLhtXpcfxUOqlieoUutRFKFPfo8+mtl+EFGqzPC66qV4tC88Q
	GXE4AB4w6FV88VelGLqrcBwu3qy2/fjg5/1dY=
Received: by 10.43.53.1 with SMTP id vo1mr1004379icb.2.1323296272439;
	Wed, 07 Dec 2011 14:17:52 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id cz1sm11328314ibb.11.2011.12.07.14.17.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 14:17:51 -0800 (PST)
Date: Wed, 7 Dec 2011 14:17:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111207221724.GA7003@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<alpine.LNX.2.02.1111281842480.1090@myhost>
	<CAOAMawF_Y=tw_R_on3rzjwB4UteGCi4Ff9dKU22ke_=hAO=MKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOAMawF_Y=tw_R_on3rzjwB4UteGCi4Ff9dKU22ke_=hAO=MKA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Documentation problems
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
X-List-Received-Date: Wed, 07 Dec 2011 22:24:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (07/12/11 00:01), Bill Traynor wrote:
> > Hi,
> > today I wanted to create a Template:We-move-to-oe-core (something like
> > this artikle is a stub) to mark all pages which needs a change and inform
> > new users about the move to oe-core. I created an account but I am unable
> > to edit anything. I even cannot edit my user page.
> >
> 
> This is fixed now.
> 
> I've just implemented  Email Confirmation for New Users to the wiki with
> auto-promotion to the 'User' group to allow for editing.  I also switched
> the Captcha from recaptcha to QuestyCaptcha with a simple question about
> Linux that's easily google-able.  This scheme has worked well for a number
> of months on elinux.org, so it seemed prudent to try it here as well.
> 

Thanks Bill this should solve our spammy problems

> More wiki improvements to come.

looking forward to it.


