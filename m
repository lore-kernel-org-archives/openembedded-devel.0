Received: from [212.18.0.9] (helo=mail-out.m-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1MXZ6h-0008Jd-6y
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Aug 2009 13:20:05 +0200
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id D39B41C1522B;
	Sun,  2 Aug 2009 13:04:42 +0200 (CEST)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id B9EE890226;
	Sun,  2 Aug 2009 13:04:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024)
	with ESMTP id oZh99xWJS7Xv; Sun,  2 Aug 2009 13:04:41 +0200 (CEST)
Received: from mrdenker.localdomain (ppp-93-104-102-209.dynamic.mnet-online.de
	[93.104.102.209])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTP;
	Sun,  2 Aug 2009 13:04:41 +0200 (CEST)
From: "Klaus 'mrmoku' Kurzmann" <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 2 Aug 2009 13:04:42 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.29.6-213.fc11.x86_64; KDE/4.2.4; x86_64; ;
	)
References: <200908021211.14793.mok@mnet-online.de> <4A756F8F.30405@gmx.de>
In-Reply-To: <4A756F8F.30405@gmx.de>
MIME-Version: 1.0
Message-Id: <200908021304.43335.mok@mnet-online.de>
Subject: Re: some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Sun, 02 Aug 2009 11:20:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Am Sonntag 02 August 2009 12:50:55 schrieb Stefan Buschmann:
> I'm experiencing problems with current SHR images as well. In my case,
> everything gets built and the image is created successfully, but when I
> boot into the system on my device, I get a few error messages like "no
> sound device" for alsa, "no network card" etc., and the X server fails
> to start. However the fso-daemons etc. seem to be working, or at least
> starting, correctly.
yeah, thats exactly what happens to me too.

I just gave the 1.8-parser-rework a shot and it looks like it builds correct 
images with all needed stuff included. Did not boot it yet, but I checked that 
the missing packages are included.

Is 1.8-parser-rework prime time ready? 
-- 

Klaus 'mrmoku' Kurzmann


