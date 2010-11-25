Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PLZBH-0000xy-E3
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 11:35:59 +0100
Received: by mail-fx0-f47.google.com with SMTP id 8so2077fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 02:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=UjKq5hfIMtyQ9FPzR39NiqFxpmfMY5br59Ttlx2FVzM=;
	b=NrJsxyPtVtmwCGnG76Dxn6MjR6+hEePxyrldxnZSxl2uOBjVMRWY3TVdnsnGrINmQz
	VqYW9p8I/s4NYAm+FvUWe00eTDRW6rxTIcp0LwI9V9hY4AYaprpUxeMxQgWkpRlcmE+5
	XuEpTs40JmGUP2et7h2tZdIwHDW2sYw1c7d+8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=A4cjcZVlTzLRZPxlabHCXmuXFIu1FPua0rBLDW9XN2ZEOoELrmk2c0JjZqrFKu1Z1G
	V48ktnnkzrDaSFS3+TC6UrTIioVxv8YWvR3NsLXP352X01TVL9um+tY3RDFTl49QNsmL
	y/rHqhMwvost7aSwa8BKjN71iTTuBs/1OUkw8=
Received: by 10.223.122.201 with SMTP id m9mr534075far.79.1290681286919;
	Thu, 25 Nov 2010 02:34:46 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm133223fav.26.2010.11.25.02.34.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Nov 2010 02:34:45 -0800 (PST)
Date: Thu, 25 Nov 2010 11:34:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101125103434.GL3274@jama>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
	<1290676461-13283-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1290676461-13283-3-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/5] busybox: remove 1.17.1
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
X-List-Received-Date: Thu, 25 Nov 2010 10:35:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 25, 2010 at 10:14:19AM +0100, Eric Bénard wrote:
> as it's no more default for Angstrom-2010

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


