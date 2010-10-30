Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PC6SI-0005QX-DU
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 10:06:26 +0200
Received: by bwz10 with SMTP id 10so3170354bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=0xAQhf/rimmgxOTLzuXoukg5NhnwLh12OLqEEA2y2I4=;
	b=qsp9d0EqLdKMYNk8eRtjR5UmkwiOWPrHKvzf1ZdxZYjr+8wAsws8VlaDrfikJCoUBf
	4BrkZG5ha4/lGL95UnRi2B06g6Ds8706HZfT3+zWZX08MoWP6TYAp8Sv9ze2fySZ27e4
	M22yJk7f9YiVYXkeRx61loYVODs4+ss83dIT4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=xpF8f30C+hZD4jryxotdH4pPbYTxvQ7mDU+J7D0eFBBz8rf0jRhH4E2rnl5ZESiAAo
	a/ZN2rUn3GFZzagaXOQgtjoiNzs4P1zkl6gASN6JgltXdemLr3s4PLehrIqFxBQC9Z4E
	PkgtM9CUbqFGa0r27Muk4vJDE/muOdNfid/ik=
Received: by 10.204.119.145 with SMTP id z17mr10709389bkq.128.1288425941219;
	Sat, 30 Oct 2010 01:05:41 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id m8sm18434faj.1.2010.10.30.01.05.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Oct 2010 01:05:40 -0700 (PDT)
Date: Sat, 30 Oct 2010 10:05:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030080536.GC3206@jama>
References: <1288395329-10474-1-git-send-email-eric@eukrea.com>
	<4CCB5DC0.3030607@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4CCB5DC0.3030607@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: remove unused versions
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
X-List-Received-Date: Sat, 30 Oct 2010 08:06:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Oct 30, 2010 at 01:50:24AM +0200, Eric Bénard wrote:
> Le 30/10/2010 01:35, Eric Bénard a écrit :
> > keep the following versions :
> > 1.2.1 (used by oplinux)
> > 1.7.2 (used by nylon)
> > 1.13.2 (used by angstrom, kaeilos and slugos)
> > 1.17.1 (used by angstrom)
> > 1.17.3 (latest one)
> >
> forget this one, 1.16.2 should not be removed as it's used by shr.

I'll try and then switch to latest.

Thanks

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


