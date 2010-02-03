Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1Nci1B-00041f-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 17:23:56 +0100
Received: by ewy4 with SMTP id 4so1170985ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 08:21:25 -0800 (PST)
Received: by 10.213.102.73 with SMTP id f9mr7459800ebo.12.1265214084113;
	Wed, 03 Feb 2010 08:21:24 -0800 (PST)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id 10sm16129574eyd.37.2010.02.03.08.21.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 08:21:22 -0800 (PST)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id F1BAF41595; Wed,  3 Feb 2010 16:21:20 +0000 (GMT)
Date: Wed, 3 Feb 2010 16:21:20 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100203162120.GB26844@xora-build.xora.org.uk>
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>
	<4B684D9D.2030001@dresearch.de> <4B699C5A.70909@dresearch.de>
MIME-Version: 1.0
In-Reply-To: <4B699C5A.70909@dresearch.de>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Wed, 03 Feb 2010 16:23:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2010 at 04:55:06PM +0100, Steffen Sledz wrote:
> Steffen Sledz wrote:
> >> I am building ossie-image in openembedded using bitbake command but
> >> it is giving error of not finding boost_filesystem library.
> >> What exactly is this error.Plz guide me.
> > 
> > Since today i see a similar problem when doing a clean bitbake of
> > glib-2.0. It seems to be a problem with automake/automake. :(
> 
> I think i've identified this patch as cause of the problems.
> 
>   commit b1caa21ab2590689f3b6ff68483803701c12d721
>   Author: Graeme Gregory <dp@xora.org.uk>
>   Date:   Tue Jan 26 12:02:08 2010 +0000
> 
Guys there is zero point sending me emails direct if you dont actually
tell me any information.

Graeme



