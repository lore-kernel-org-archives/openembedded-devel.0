Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OkBr4-0005tu-P4
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 10:12:53 +0200
Received: by fxm6 with SMTP id 6so2299732fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=ua4kbFs8NLG2DllfpcMjB2Ymtuxe6GBrn7Aq1XFDn3Q=;
	b=Z3JHENcXI2rC7pVvamNQuUZTd+LgQWk3lUsHsHLmEVo+msi2k8QkTCSW3NmnzP32ad
	qrMFoOaulKj6d0JE1/UbiH6DsjgIiVzBUlw9kiNR/2kDg2Ysu/4QHA7D2RT2nfRhdaX/
	5mVlil7N+patXNhp3uxrU3z5Ejf+fYzSBFjM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=pVhc5CofsYae49EaQFR00bGKB3/5kVzYWS/rQ9+Xa0lTJF9SpCa/K1Q0N5JnwoZFHw
	ukONGnd/ESyxi1vJRhrUQWIJzDFmXZdCE+eYzVXppYhwdLvxZWcBYwAbw6+ADyqZGG+R
	8BdcysACCJjBIF1jDu3FJVVpwo60V9Nvd65eU=
Received: by 10.223.115.194 with SMTP id j2mr2995731faq.47.1281773539424;
	Sat, 14 Aug 2010 01:12:19 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id f11sm1476538fak.44.2010.08.14.01.12.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 14 Aug 2010 01:12:18 -0700 (PDT)
Date: Sat, 14 Aug 2010 10:12:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100814081222.GD10076@jama>
References: <1281749324-22589-1-git-send-email-lukasmaerdian@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1281749324-22589-1-git-send-email-lukasmaerdian@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Lukas =?iso-8859-1?Q?M=E4rdian?= <lukasmaerdian@gmail.com>
Subject: Re: [PATCH] bump libphone-ui and libphone-ui-shr as to the 0.0.1 release and bump SRCREV to the 0.0.1 commit
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
X-List-Received-Date: Sat, 14 Aug 2010 08:12:53 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Aug 14, 2010 at 03:28:44AM +0200, Lukas Märdian wrote:
> Signed-off-by: Lukas Märdian <lukasmaerdian@gmail.com>
> ---
>  recipes/shr/libphone-ui-shr_git.bb |    6 +++---
>  recipes/shr/libphone-ui_git.bb     |    4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks!

Next time, please prepare better commit message:
http://wiki.openembedded.net/index.php/Commit_Policy

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


