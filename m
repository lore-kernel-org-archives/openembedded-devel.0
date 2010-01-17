Received: from mail-fx0-f215.google.com ([209.85.220.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay4mail@gmail.com>) id 1NWSbY-0003R8-HY
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 11:43:39 +0100
Received: by fxm7 with SMTP id 7so530991fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 02:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=3num1uqB0oJ8aSWUP5TEXUNTtNlxoVYu4KX1RbcPr4w=;
	b=MBI+2UkkylXXd6/MdlNzQYCtuM5wjgxOv5mTqEUDrNzBVrQ5hpLJkUOYyRmhfLE+KR
	IEA+U+9yl+K1vwEViOPer5iy22Drht9rSAyACQbdtxjDa/LV0Ol3kKzvPnwQO6kQwHrO
	/X9HqaAoN86DHBclr/WGC6Mv2gmEqKpmDgnec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:references:in-reply-to:mime-version
	:content-type:content-transfer-encoding:message-id;
	b=lriXsAdVUsI5p/wnjkWwonaX9G0AHZ4r5WVf0tixjn352LmgrTIaVEzHttu4/kJFMX
	T4xkVO3wpDX3i6c74gqKu4aFiIEbDkphGy21osCTyRtdrvpFB5b4xrx2tcYsvXWJRjAf
	vTYbE6T2YVR+2PxHjFnflI5xZ0x+QQueFGAaE=
Received: by 10.223.4.214 with SMTP id 22mr5700090fas.34.1263724883160;
	Sun, 17 Jan 2010 02:41:23 -0800 (PST)
Received: from is.home (95-29-176-93.broadband.corbina.ru [95.29.176.93])
	by mx.google.com with ESMTPS id 14sm1499142fxm.11.2010.01.17.02.41.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 17 Jan 2010 02:41:21 -0800 (PST)
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jan 2010 13:39:57 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.30-std-def-alt15; KDE/4.3.4; i686; ; )
References: <alpine.LFD.2.00.1001170430200.4163@localhost>
In-Reply-To: <alpine.LFD.2.00.1001170430200.4163@localhost>
MIME-Version: 1.0
Message-Id: <201001171339.57694.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.215
X-SA-Exim-Mail-From: jay4mail@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why is zaurus-utils "gnu.tar.gz" in OE dev repo?
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
X-List-Received-Date: Sun, 17 Jan 2010 10:43:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello!
> $ git log recipes/zaurus-utils/files/gnu-tar.gz
> commit 5a7e0f0eb265c98248ffd23d4801d1e0c1af031b
> Author: Andrea Adami <andrea.adami@gmail.com>
> Date:   Wed Aug 12 00:09:31 2009 +0200
> 
>     zaurus-utils: create a common container for the various Zaurus tools
> 
>  can that tarball not be moved somewhere and downloaded?
> 
> http://projects.linuxtogo.org/pipermail/openembedded-commits/2009-August/
> 030396.html

IMHO, we can host it on LTG zaurus project page 
(zaurus.projects.linuxtogo.org) right after DNS will be fixed (ping to 
florian again) :)

-- 
Yuri Bushmelev


