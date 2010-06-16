Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OOs1t-0002KW-HS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 14:47:41 +0200
Received: by fxm18 with SMTP id 18so586337fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=rckvRQtt4vh+18jim4WQz2DP+Aee2rdAV7hdoKOZSvY=;
	b=PKkpzczw+CeM6/3OZE8+eGnDWS2GqUzN0UkUcVTaRjyvzYLQkLIGkjSVAFL1q7X1W7
	CbcPw2bJJzICGk+GrAFL5n15y7nwQrImor3SPltz0ScciCdRYtvXfsZCFgRbRD7/nLW6
	Nwst/3wqvpoDlN61PllOFA4KJer0SEKA5yDDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=tkcUXbxqezNC+0hYSPh5WcQrfMAWwzagUNzPnfDcBX5lcbVZdCnDI+NQYUVHwIjsS8
	IzBqEhKMRHQRZRLq9ldvUreN3TfI8stjy8zqBWHSsNDY+NhVejuMx4PpepFZrjpRiU/A
	TTMAJtgkf4c3kOcZPHxjRJ5zJFRGESPlqaHSo=
Received: by 10.223.144.84 with SMTP id y20mr9049948fau.78.1276692191630;
	Wed, 16 Jun 2010 05:43:11 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n6sm8747109fam.7.2010.06.16.05.43.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 16 Jun 2010 05:43:10 -0700 (PDT)
Date: Wed, 16 Jun 2010 14:42:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616124248.GD31405@jama>
References: <201006161433.54486.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201006161433.54486.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: xfce 4.6.2 recipes
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
X-List-Received-Date: Wed, 16 Jun 2010 12:47:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 16, 2010 at 02:33:54PM +0200, Andreas Mueller wrote:
> Below you find new recipes for xfce 4.6.2. My gumstix overo works well with 
> them - I discovered no fallout up to now.
> 
> I am sure that this is not the correct place to post patches. Checked OE page 
> but did not find hints and asked this in my last post (). So please what is 
> the correct place/procedure for RFC/PATCHES?

This is right place as this states:
http://wiki.openembedded.net/index.php/Getting_started#Adding_Packages

But your e-mail client wrapped every line > 80chars, so please resend
with "git send-email" command, or at least setup your e-mail client to
not wrap longer lines.

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


