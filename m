Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgepS-0005o3-RI
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:20:23 +0200
Received: by fxm12 with SMTP id 12so2488061fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wKtNQB+m3FKxdx+/igthvRkTb+51TmxbsqqV7MN1dvs=;
	b=PBOwOmbnHbBgZPf+CD+TaekjwwWePxQJaKCi+AeW2TQC/C9vxi85/WO5HFVkpJK5hS
	57tZLj9V/Fii7BSdqYyXArDqMhfBCs5wYwqEqLPlLCiaGcfvTDBMtCbJV9lHgrODKB6G
	uWMqQsWmxzht60FCInk0QlGHxSjq/tquNC1Rs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=L475TeD1DXkxeCD0SxCcFZxaXPK7PN2HuiU5Vau7BxHSsf4vmqPtOEESXFafJpAjtN
	JZsXJ2FTGPkVsBtkP/eCIPjnUAaCir7AQnWAY6nHmuuH7iQ6S9MEKzOLHwXilAEkR2iZ
	Jxe25ygyLx4ZKYVmzDNOgcBRuYJ5lIxRP2194=
Received: by 10.223.122.146 with SMTP id l18mr8993673far.82.1280931618722;
	Wed, 04 Aug 2010 07:20:18 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id l19sm2985494fap.9.2010.08.04.07.20.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 07:20:17 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgepH-0006Oh-Vt; Wed, 04 Aug 2010 16:20:11 +0200
Date: Wed, 4 Aug 2010 16:20:11 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804142011.GD28187@mx.loc>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<201008041802.01481.khimov@altell.ru>
	<20100804141748.GC28187@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20100804141748.GC28187@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] perl: honour DISTRO_FEATURE largefile
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
X-List-Received-Date: Wed, 04 Aug 2010 14:20:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

oh sorry, i just see that this needs even more munging so better
disregard this for now.


