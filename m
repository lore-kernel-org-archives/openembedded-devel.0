Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSb3F-00087O-8Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 21:28:35 +0200
Received: by fxm7 with SMTP id 7so61828fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=FMiFo8wDCAxga2Ut2l4MrVx2OVI5NnE0PWYvfCX5V1k=;
	b=igfgyEqHL0ai+kAGUWdt/cS3Tbehx5l2FjCS3T+EdR0ELTlrAU+QkU2ZZ//bSBzz3A
	hm8cm+1ABmNb04SlhMLFThE7Bi/SB5WLr7O6FKtmJV/1M3itDikBsQIDlR7IAtOYy8Fw
	y/DzfrJixjZDsFIRWOp8AJTp8Sc4XowVEsLSY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nHXTtgfYejtk0EiwnnMdWVSV7cSNJnuKJstiS9Lxd7vusv8rDlUbeKCA6YbzxULTCU
	UBnGiHDbolW+MX7MRKdPMMBpCXFYg9TmrQULpVc39w44krUh/mKhu8XZhNGJd4ou5sD1
	VyMYciXLNI05L8fm+jZ4oOPaTWRo9FFXbnw/Q=
Received: by 10.223.98.5 with SMTP id o5mr1975363fan.64.1277580229443;
	Sat, 26 Jun 2010 12:23:49 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e11sm41019769fak.41.2010.06.26.12.23.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Jun 2010 12:23:49 -0700 (PDT)
Date: Sat, 26 Jun 2010 21:23:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100626192324.GO17650@jama>
References: <AANLkTikxhrxxH4c6Vzwlc7bRispfUZrtSpXLSWOvitU7@mail.gmail.com>
	<6002213104.962031391@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <6002213104.962031391@cbnco.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/9] mesa: remove 7.4 release, which is not pinned in 	any distro/include config
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
X-List-Received-Date: Sat, 26 Jun 2010 19:28:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 26, 2010 at 02:56:31PM -0400, Michael Smith wrote:
> >From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> >To: openembedded-devel@lists.openembedded.org
> >Sent: 26.6.'10,  4:33
> >
> >2010/6/25 Martin Jansa <martin.jansa@gmail.com>:
> >>Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Nack here, I'm using 7.4.

7.4 also converted and readded, please test (I tried only if all patches
apllies as before).

Regards,
-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


