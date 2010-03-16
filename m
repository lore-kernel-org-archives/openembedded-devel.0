Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NrRwl-0002fv-9h
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 09:16:15 +0100
Received: by fg-out-1718.google.com with SMTP id e21so697759fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=UxvgF7lRpP/ETVXHJwey7QNUZjaaDqOw2fop9xUerSc=;
	b=ISNWS/mTgnnblPTq0pTmF8yUntjCIwG1ETGxR9hrtT11XYPQECgMti0pjzwUFcGBxQ
	mLJjPJ1dTPhH8J9ze9lRSP1KOpN5ZD3WYD79FJs1ar1oTJeiSOi9ypJO6Wp0q6YBhBBR
	2r0wn+gCt/hFKCdt2V6KLCdWVX7UCDi4VOqGM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lWzLRw7AZxTt5QnEb4uu0pZ7F8zRH04hhx4vfqMeqzzo9D3x1WTmXP4hRPZGXDky08
	k3x4KCpSFlOvRI70+tJFYaM5cklVBVU067P9S+4EX0xttaKsVXn5vh5I+Xur0zOO1hhT
	M98sVp+M7ePb7UkqyehHYnmgmHpw+GPYuHkTU=
Received: by 10.87.74.23 with SMTP id b23mr674172fgl.33.1268727194556;
	Tue, 16 Mar 2010 01:13:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm3713019fxm.10.2010.03.16.01.13.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Mar 2010 01:13:13 -0700 (PDT)
Date: Tue, 16 Mar 2010 09:13:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100316081307.GB29306@jama>
References: <201003150605.03085.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <201003150605.03085.holger+oe@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.158
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Request for help to address known security issues
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
X-List-Received-Date: Tue, 16 Mar 2010 08:16:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> findutils 4.2.29: 
> http://www.FreeBSD.org/ports/portaudit/7ca2a709-103b-11dc-8e82-00001cd613f9.html

I'll send 4.5.5 after a bit of cleanup and moving to BBCLASSEXTEND.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


