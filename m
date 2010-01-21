Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NY68t-0004wf-W1
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 00:08:51 +0100
Received: by fxm28 with SMTP id 28so617799fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 15:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=AL4O5UbkWYlMLhmiZ80n/5k6GUdWv+JEDmwAuKvyEho=;
	b=bCH3HrYa0Okk9TzvmstIpzMnRLh24EQ28EMcTSEnTGBfNMIPKiPGN8KhvJm89E3Deu
	Hoe4uJKkW4dvLHMb7aj76bKAeHUTfP8vdtAHK6dlkcGknLGRlmLeEI2vk820IBxXiagA
	b3pBARu6pWe8BTAHJF+isvbWzRHELtDEOcsrY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=qtW+lHasGKu3V0X8rCRBAyg4/ZwkbiZptd4An6BAr9BocRLChSXr84mtkGYKdnycN3
	rdUMbXB9aG8x7uDhS0XPu2cVXx67Etx2msbyeaOioj7Y+3u4QzsLfwBtc8XBVIcvjeV4
	2YAjP6gq0YvrNQGfb4NFpHQmVwc3Vb2B+y9xU=
Received: by 10.87.42.33 with SMTP id u33mr3594207fgj.8.1264115190844;
	Thu, 21 Jan 2010 15:06:30 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l12sm4934518fgb.0.2010.01.21.15.06.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 15:06:29 -0800 (PST)
Date: Thu, 21 Jan 2010 15:07:03 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100121230703.GA11015@gmail.com>
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
	<4B5619BC.4020308@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <4B5619BC.4020308@eukrea.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.228
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Thu, 21 Jan 2010 23:08:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (19/01/10 21:44), Eric Bénard wrote:
> Hi,
> 
> Le 17/01/2010 21:32, Eric Benard a écrit :
> >* barebox is "a bootloader that inherits the best of U-Boot and the Linux kernel"
> >* add recipe for v2009.12.0 (last stable)
> >* add recipe for git repository
> >
> appart from the comment from Koen I didn't receive any comment
> concerning this recipes.
> Does this mean they are OK and can be pushed upstream by someone
> with commit access ?

thanks. I applied the patch

> 
> Thanks,
> Eric
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


