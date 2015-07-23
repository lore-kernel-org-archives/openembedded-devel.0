Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4485076228
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:41:55 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so122645088qkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type; bh=Vhp17d0Dnv3Mm4cHZJtz9bQ9ZQYnekpUID5wcRFEyWM=;
	b=IfRibtZtdoQB7AzKmdVHvc5ybcvN0bBTti6yw4WJhuo+4/R4KhCnAMeJzvtxEJT3Wd
	aFk9hXmx158nBtuicxtuQ4e76UnhT8hPySIM3l3IoM5IYWobxcTI+pTBuLc9GVXKVfyU
	qVOYDLdnWkELenZVPoML/32uGVinMxjRty2liS5uc6iCn6EwqY2ikOhEjCXBCZIq6JYA
	pdQPE7O65yQqr6MUyITcObPnb2OCTtYhMI1zaRtznZUegrj8kKD7WOtCoOnyz+my0OwB
	OpdpxxYhq0tBqimj1k8uWBmLzXfi4YEJHGg19LT1IINeki56UEaVpxvqx9kdiZqkC1Dj
	41pA==
X-Received: by 10.140.145.202 with SMTP id 193mr14120999qhr.33.1437669715646; 
	Thu, 23 Jul 2015 09:41:55 -0700 (PDT)
Received: from localhost ([179.105.243.19])
	by smtp.gmail.com with ESMTPSA id n14sm491179qkh.31.2015.07.23.09.41.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 09:41:54 -0700 (PDT)
Message-ID: <55b11952.8e1f370a.4d4dc.35dc@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 23 Jul 2015 13:41:49 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Thu, 23 Jul 2015 13:41:49 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.3
MIME-Version: 1.0
Subject: Updates to meta-browser (master) in 2015-07-23
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jul 2015 16:41:56 -0000
Content-Type: text/plain; charset=US-ASCII

Hello,

I pushed following updates:

commit 4b27058a8275a5310161459c9bb8f4c52a77762c (HEAD -> master, origin/master, origin/HEAD)
Author: Carlos Alberto Lopez Perez <clopez@igalia.com>
Date:   Wed Jul 22 18:58:00 2015 +0200

    chromium: Include chromium.inc before appending to DEPENDS
    
    Otherwise chromium.inc will overwrite the list of DEPENDS.
    
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

