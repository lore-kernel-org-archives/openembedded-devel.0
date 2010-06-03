Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OK7Ux-0002Yz-2l
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 12:18:03 +0200
Received: by gya1 with SMTP id 1so3281284gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 03:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6/5IH0flRTx7DQXGGifN7qzid4m/J4q4ulaxDIXNWRg=;
	b=ME67xxsGHg3SwHj0LoItU/xxAzGYsJBeYTaSPDKl1MTsr1gv/KahTu0TcZEKgL7pFu
	ZiblfsoUb8yjqFxqfjEToILvwkQ4W8an1E6G30EGiG6S1QKpim5YsUZZhwB9IYbEBiNm
	AUGC35g2xPWa7CLLt/7ImTHd9EVuHWygYs9bU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Lf6qWDGSLO+3DE6HVdB1NJWn6QEfFdfDDGRSi8mWTjIqkIRS6ESmhKG/xraq7uWSzj
	coFPDJ4GGlVnn9aT7rIWO3HgS7R0sahGpFqmj6h9+R/0Gt25CYhUu4pOcHUt2sFUdcWS
	XPHnzNhSkF7laRgv1stYBBikTGRAk1ai0Kh2k=
MIME-Version: 1.0
Received: by 10.101.184.4 with SMTP id l4mr9974503anp.222.1275560026736; Thu, 
	03 Jun 2010 03:13:46 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Thu, 3 Jun 2010 03:13:46 -0700 (PDT)
In-Reply-To: <1275557631.3916.17.camel@balakrishnan-desktop>
References: <1275557631.3916.17.camel@balakrishnan-desktop>
Date: Thu, 3 Jun 2010 12:13:46 +0200
Message-ID: <AANLkTikusbhJ1B3Khq4FeGbyrllm3VLpeLPHgvSuLiVU@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux_2.6.34 staging error
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
X-List-Received-Date: Thu, 03 Jun 2010 10:18:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

I fear stable/2009 lacks some magic in linux.inc.

Worst, staging has been revolutioned...
Here is the actual:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux.inc

Regards

Andrea


