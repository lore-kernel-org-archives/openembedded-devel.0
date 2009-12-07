Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHWuv-0008OK-3I
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 07:17:56 +0100
Received: by bwz9 with SMTP id 9so3190086bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 22:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=qSqw8nvS2liGy/PXdZGKUEFhy92iqn01gIzq+2tZnWQ=;
	b=xGphWykI9z0F1tpu7qEgcJvZDRQ8M3HB6DT+zt1Vp5NYvu4QyRh/ecyzvoAABPo+yt
	qtpi4DLPEKRqyp+5hsyPMoqlnji5ng3b0TaVew61mLTt9XtlONouencAgW/ZAXpaqOSz
	kblXNiFrOKDc0kzHoOm3Ujk6JcEoJYdgkxG+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uFdA6xvAR56Z1lPRxn9+d2Ez0BpTzGVfwK6XIEi0/J9L6uqEcF7fVOBmSgehoXTUzQ
	8n7V7lQBuyp48z74uw6imyxRebaR/8RKZLZ+4VgPMACIOhP2l9/VO646scvqM4lXPAp+
	siuB0JOXNf6xdN1sSva/pworH4WJXjM9taVuw=
Received: by 10.204.7.88 with SMTP id c24mr6635695bkc.17.1260166573866;
	Sun, 06 Dec 2009 22:16:13 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1841390fxm.3.2009.12.06.22.16.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 22:16:12 -0800 (PST)
Date: Mon, 7 Dec 2009 07:16:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091207061609.GA3406@jama>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
	<hfhfmj$1av$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hfhfmj$1av$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/6] bitbake.conf: create compatibility-providers.conf from micro, minimal, angstrom, shr preferred providers
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
X-List-Received-Date: Mon, 07 Dec 2009 06:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 07, 2009 at 12:45:23AM +0100, Koen Kooi wrote:
> On 06-12-09 22:13, Martin Jansa wrote:
> >+PREFERRED_PROVIDER_e-wm-menu ?= "e-wm-menu-shr"
> 
> That should be 'e-wm-menu'. The default provider should be the
> 'original' where possible.

Sure, sorry for overlooking that, fixed locally.

> regards,

regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


