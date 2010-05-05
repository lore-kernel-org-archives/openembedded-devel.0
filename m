Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O9YUO-0008ET-GP
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 08:53:49 +0200
Received: by fxm11 with SMTP id 11so3793770fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 23:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=y3AAVrg0su/p4gioSNCd5a6WalELJwRvAF5CwyTtn8w=;
	b=p5sYYvqkFToP6Ov1Be+2skxftzYvhSuMB0iTAR/O1/XTWI+RI2PoCbfzHCCs5a8vkE
	MZMvSHspFOtX1rgnmwNZFNFKeA9Dg+HyJrz7w/1SKJTCBLXLKPZzd8rIrHsXPwQVLbPT
	qszKiNZIEh2KBTIdXB7imtTgYfT2iBee+72AE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FAtsEL0mnphLtqWWYsq7Av+RGkMfdXMlVqnE0eXuQwHXVEMYlKXhvfNCEBDYKiw1C3
	Sbw/B3Rj3N7F3Fq3puRNAlhHzm3jqHzhtzs/um0f/rsqrRt4m6WyvmRKYGFua99i0esu
	8/japgd/rlLf9gdTDQ629KGC1JUECHh5/Tp4A=
Received: by 10.223.31.136 with SMTP id y8mr5084382fac.19.1273042201408;
	Tue, 04 May 2010 23:50:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 21sm12910222fkx.10.2010.05.04.23.50.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 May 2010 23:50:00 -0700 (PDT)
Date: Wed, 5 May 2010 08:50:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100505065004.GA3191@jama>
References: <1273038974.3809.22.camel@balakrishnan-desktop>
MIME-Version: 1.0
In-Reply-To: <1273038974.3809.22.camel@balakrishnan-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: hide mouse cursor
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
X-List-Received-Date: Wed, 05 May 2010 06:53:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 05, 2010 at 11:26:14AM +0530, balakrishnan wrote:
> Hi,
>    I have used xserver-xorg-2_1.5.3-r4 package for my board. During
> touch input, I need to disable mouse cursor. How can I make the cursor
> hide?.
>    In Xserver-kdrive, I did this by "-hide-cursor" option, while running
> Xfbdev. like wise any option is there to hide cursor in Xorg?.

Hi,

not sure if also 1.5.3 version but all newer xorg xservers support

-nocursor

Regards,
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


