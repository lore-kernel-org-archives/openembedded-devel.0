Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OzmLn-0004j6-1g
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 10:12:47 +0200
Received: by bwz2 with SMTP id 2so2828125bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 01:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=eI7MgdvVWSXNzC8SZHoECHvsOAUmOtsHZPFx31zXDm0=;
	b=pUnhk8rmVXPFT9b1F/C4mFRcQA2RjByFQuX76kvdM6K9xvws3JwVNz8Nd91OifzHF4
	U99GLsteRzQ9s9jDp7jK1RcE1nHwl8sL4vk/9lb6cK1KFEeYKCguLQwR4x2DKBGO7kgX
	dXjZ6wXLwW+csR6QWTwkRJhenUmrGYOp2NeQM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=KootLA2nHTXYKUk0rYBpgJ66qvsMjvqLTu6WhTKNIhfvjUnou7DY0gLwUogTeg47UR
	KDLfAtMxOxArJMMsas28aVcNjf5zJ3QfkeFYOb43zRVoFlHlacfowufkoLoYkEmm0qoV
	fpVoHindTF7fahhnrCF15cNwgMtz2Yas5uJZU=
Received: by 10.204.57.130 with SMTP id c2mr3876238bkh.144.1285488748451;
	Sun, 26 Sep 2010 01:12:28 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y19sm3194435bkw.18.2010.09.26.01.12.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 26 Sep 2010 01:12:27 -0700 (PDT)
Date: Sun, 26 Sep 2010 10:12:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100926081234.GA6483@jama>
References: <1285456630-27680-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1285456630-27680-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sane-toolchain.inc: Make gcc 4.5 & eglibc 2.12 as default sane versions
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
X-List-Received-Date: Sun, 26 Sep 2010 08:12:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 25, 2010 at 04:17:10PM -0700, Khem Raj wrote:
> GCC 4.5 has been tested quite a bit and so is eglibc 2.12 in SHR
> and developers.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


