Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Olxjx-0006qm-6Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:32:37 +0200
Received: by fxm6 with SMTP id 6so826569fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=kgOs07F6b9f3aGUO29haMDo3sstDbi3W2Y7JYbNxLVg=;
	b=QworMahqSIquQLZnMvNKUoJeQkULPr3NKCvI232XkCB/N2384KCkIZVOtrQm0XCQbx
	C2er5PaUUEpA6X3yZfEuRdUlk42xmixOcGDuwKUQ99o9fdC6fGOWA4Mjubr/b58GPPIR
	7XGOpd2nh9GHSEYxx5x1zDodFJeGa7iQ7aF3E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=pETytklRAtAqmgvuurA3hBb9UfFS4Ux2vV3yPyH+3qY7HZV4TP49JD8h86GAR4sBpn
	Zjw9A2ZLdT2soCjuw2v0JRFBcCZ5HgA3NOMxHhf4mEIm3wXJSyZUrQRbSM7j0CLqV/53
	XjyED48B+uxxt5CmPLmm6Tpzub7+OHgPaDSFY=
Received: by 10.223.108.204 with SMTP id g12mr8762703fap.21.1282195937639;
	Wed, 18 Aug 2010 22:32:17 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 10sm509497fax.18.2010.08.18.22.32.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 22:32:17 -0700 (PDT)
Date: Thu, 19 Aug 2010 07:32:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100819053238.GI11569@jama>
References: <4C6B74CF.2090708@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4C6B74CF.2090708@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rootfs_ipk.bbclass: Fix BAD_RECOMMENDATIONS.
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
X-List-Received-Date: Thu, 19 Aug 2010 05:32:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 18, 2010 at 03:21:11PM +0930, Graham Gower wrote:
> See http://code.google.com/p/opkg/source/detail?r=553
> And previous discussions:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg01423.html
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04051.html
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Image rebuilt from scratch and it looks good

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


