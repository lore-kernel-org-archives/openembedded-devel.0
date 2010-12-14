Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PSbzH-0006wl-6s
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 22:00:43 +0100
Received: by fxm11 with SMTP id 11so1143816fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Dec 2010 12:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9ne1/flOGCQWZV0YKxODQ5qI8w8Qiju707ehHtFsODg=;
	b=TYT2MkNhXLWLIhoRkMNx5CHpY0zenEv0sb5NXpTdccSt/sURKjDzmQ544fM5sfQK5d
	geEFZSbwprAGS8dhVC9k3uJzTXfwao2fL9PRUA8CQHYQDLEuh3sKtkJmT98W0us+851f
	/hqLenTOMxpAxVLn8TI17Cb7MT+FoCr8JE0ak=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YrZSwCWqQjDCcfT52FQBrPofzTEWCaw+HIDKcCptEriB6XTt6U/0t+/98jeSGtvHgF
	Y1D+TDw5k7GXjG67fzcJ1B8FpevgquiVmDZtCMVAUhvdRHD+gpbgujfiR2jEv2qcsKPY
	SvV5E/2mYpy+oih1mXEWMCkHmdw/7UI4hpfV4=
Received: by 10.223.87.80 with SMTP id v16mr4273649fal.128.1292360346402;
	Tue, 14 Dec 2010 12:59:06 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f24sm168937fak.24.2010.12.14.12.59.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 14 Dec 2010 12:59:04 -0800 (PST)
Date: Tue, 14 Dec 2010 21:59:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101214205943.GF6662@jama>
References: <E1PSZng-0001y3-K3@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1PSZng-0001y3-K3@melo.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.42
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] Steve Sakoman : coreutils: experimental coreutils fix
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
X-List-Received-Date: Tue, 14 Dec 2010 21:00:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 14, 2010 at 06:40:36PM +0000, git version control wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 6f0ed3e2cebc76cc992ddc102ade8bfa13e17acb
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=6f0ed3e2cebc76cc992ddc102ade8bfa13e17acb
> 
> Author: Steve Sakoman <steve@sakoman.com>
> Date:   Sat Dec 11 07:16:26 2010 -0800
> 
> coreutils: experimental coreutils fix

what was wrong?

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


