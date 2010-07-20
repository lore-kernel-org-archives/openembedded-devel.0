Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ob3E0-0002rK-NM
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 05:10:33 +0200
Received: by pxi12 with SMTP id 12so2357782pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jul 2010 20:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=eTC5lMfgzJLPWF7lM0Ry7awc1JuoXRMIjwmJAsQgTdY=;
	b=Iaw5TyB7gjWCpz++4VNf7h7I5cbFm74qHk835OGGAeFmSinTwvEH230MY2X/+JOcoS
	kL2jU0DrNQ7p+iYSzmjT88XRYNtuOPCCGwNZkRvYW9EMdOdFJdQYQGAzL3/gIUfs61fO
	dv+acozQ71Bpy/GobVXzpHe+JwjgU/2cs/8Bk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=PCy1VbNBl3Z0ePpW3weYUFmKn29eFJn+Sf+8Jr824bhYKQviqn7F6l9260CjiBmJRg
	+ILvBmyqmYLAvKNgSWZ3hWjFoGF4ufr7zvJJluFkz2W5kMyIErl4KnuGLr0TNybdwdbC
	Rqf1/rwn6Yu9lRe6t636TFKFL/psoIVprdQQs=
Received: by 10.114.156.10 with SMTP id d10mr8380571wae.229.1279595421787;
	Mon, 19 Jul 2010 20:10:21 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm17778330rvf.22.2010.07.19.20.10.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 19 Jul 2010 20:10:19 -0700 (PDT)
Date: Mon, 19 Jul 2010 20:10:35 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100720031035.GA7574@gmail.com>
References: <1278447438-27251-1-git-send-email-stefan@datenfreihafen.org>
	<4C3395A0.7060702@mentor.com>
	<20100713184800.GB1947@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20100713184800.GB1947@excalibur.local>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 1/3] shadow: Disable email checking completely
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
X-List-Received-Date: Tue, 20 Jul 2010 03:10:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (13/07/10 20:48), Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-07-06 at 13:44, Tom Rini wrote:
> > Stefan Schmidt wrote:
> > >From: Stefan Schmidt <stefan@buglabs.net>
> > >
> > >This allows faster login due to not checking for new emails. Adjust PR to 14 as
> > >stable is behind .dev here.
> > >
> > >Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
> > 
> > Acked-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> Thanks. May I could motivate someone else to review and give an ack here. Also
> the other patches in this set are out for review as well. :)
> 
> regards
> Stefan Schmidt
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


