Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Oq78u-00046M-MH
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 18:23:51 +0200
Received: by fxm6 with SMTP id 6so3580628fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=6CWY4/gsjjyIW+6KnIjDgH6cRF+q7w+047awfFQKnrk=;
	b=sy7XoAiWHx3lQn7hoxCpTo7u1KPAI25EIm6LIL13jXVnYLsbHx76abGqqve3FEKtT4
	ZscDeICDb+Hv6BrvJXZRjcKq9ULzaYmEQjIchrTHiYHKG2BppnHgq6xkmrT6NIRVd5Et
	hin7AkeDOX6DPdEHTI5FIIB4radDzATk080n0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UhVZOcMJ5lZpHl9WH/nqIaH8ldbeiXwcSXJOUWsoS3eY+0HQBbPxd4Pzl03hloGNGd
	v7VS8g3paOqsTC0DIEtMys+qtQiFoAJ6btLZyM3BdxnxVx7rJiExN7gx8gnDo6nPyxcp
	RfdHdJKyGUU57bBrkpv9Rj10/IFU7roa0m8nw=
Received: by 10.223.125.131 with SMTP id y3mr3861828far.9.1283185380847;
	Mon, 30 Aug 2010 09:23:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b11sm3417491faq.30.2010.08.30.09.22.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Aug 2010 09:23:00 -0700 (PDT)
Date: Mon, 30 Aug 2010 18:24:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100830162404.GX17268@jama>
References: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: branch namespace clutter
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
X-List-Received-Date: Mon, 30 Aug 2010 16:23:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 30, 2010 at 11:56:52AM -0400, Cliff Brake wrote:
> Hello,
> 
> If there are any branches in the OE git repo that are no longer in
> use, please let me know and I'll delete them.  Our branch namespace is
> getting rather cluttered.
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/refs/heads
> 
> Thanks,
> Cliff

please delete
martin_jansa/srcpv
martin_jansa/xorg-7.5

both merged

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


