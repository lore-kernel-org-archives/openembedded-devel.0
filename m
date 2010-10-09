Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P4XjY-0004Kh-2y
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 13:37:06 +0200
Received: by bwz7 with SMTP id 7so1177897bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 04:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GDHSsH08LXhIy2EeVXiP0LGQsBBQf/l0PDgj92iw9fw=;
	b=tQgf3NTBseoWUZJr238JRVWZa4AmJ++YjCwZGKCRoRH/xExs8zOigGqB/LioM2XbWL
	RzbI4ovGJRu1yp1kPFTRBTlq2NS57o8b1tAOm2fGheGxPHdlUAToUA+0OVJS0f/JO/2i
	4gi9zP2uuAABG6b8sSuFOpiRudv/WUEE5Fy1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Bdy6cLmT3vhv+oJtXoEg1F+trMJbGrixxLAsBYPn9zPARme4wgVdy+ixWmKLLkLGom
	NSf4zvhDYJ5Zyefs4xC/Y+AaO0LKvt7FkzZuEcRknax/00JErvLn3wj9EtUPPnwTfvWk
	k6ByyY0XQ04m1HKNB6AKoZ9Ps4qMq067LIcwY=
Received: by 10.204.133.91 with SMTP id e27mr3059276bkt.197.1286624197057;
	Sat, 09 Oct 2010 04:36:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q19sm545789bkb.16.2010.10.09.04.36.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 09 Oct 2010 04:36:36 -0700 (PDT)
Date: Sat, 9 Oct 2010 13:37:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101009113707.GP3163@jama>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
	<AANLkTi=_1X_2nbgdX26Et6jd0mRxNSAKbbjkcx-iJNjC@mail.gmail.com>
	<AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikLT9ZRLbnbGQ17AN5u0TiXdweP7HKH-QuLBH_E@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Sat, 09 Oct 2010 11:37:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 08, 2010 at 03:21:03PM -0700, Chris Larson wrote:
> > Personally I'm in favour of merging into head. That way it gets
> > accepted easier and faster.
> >
> 
> Agreed, I am as well.  As the new libtool is opt-in, I don't see the harm,
> and it'll ensure that any issues which crop up with the compatibility get
> fixed asap.

Khem: feel free to add
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


