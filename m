Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fat031c@gmail.com>) id 1ORzGo-0006bT-QL
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jun 2010 05:08:00 +0200
Received: by fg-out-1718.google.com with SMTP id d23so42589fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 20:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:from:to:cc
	:references:subject:date:mime-version:content-type
	:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer
	:x-mimeole; bh=uE72KdYnBwl95CBKF/n2Sp3axKwOQ6hKpuOul8fGJ6I=;
	b=TW3CO2SBJACcMmdIPtawnfhX/Jz9Hw6kz5eEjiJLgBSADvnfvIyOzyaLPd0JeNAiG1
	DlTUhJcxYjsbVWpAEGAGe2k1t0+FrHfav3knHuY1dSNlWSwPILjSCrfIZ3Q4PlyD9fcI
	FFrGDRFHvbvIOZxM4qYGEwb74wey7r19C/j1E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:from:to:cc:references:subject:date:mime-version
	:content-type:content-transfer-encoding:x-priority:x-msmail-priority
	:x-mailer:x-mimeole;
	b=nRzfuYEvfMlrPN4cffhjbaeDATgHK5Nk9day1p0gd2aaXLJEOWEmQagkPb4+OTjadn
	QV20z3JZXsLdS5j73VOwkFVQcgEmsLMsT7KtgWdGYo4kZ71vp3bixbfTHsesY5zEfD7F
	zxL4hqjxvZB+9cziVLaifvqxQjXiC4BcebAyY=
Received: by 10.103.4.4 with SMTP id g4mr3439426mui.80.1277435002828;
	Thu, 24 Jun 2010 20:03:22 -0700 (PDT)
Received: from atverdohlebov ([94.28.104.114])
	by mx.google.com with ESMTPS id e8sm12899140muf.39.2010.06.24.20.03.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 20:03:21 -0700 (PDT)
Message-ID: <6A7B7034B0CC4B568C76BC153107D499@rhonda.vtc.ru>
From: "Andrew Tverdohlebov" <fat031c@gmail.com>
To: "Khem Raj" <raj.khem@gmail.com>
References: <3511CCD655164D0DACCECB9DE0506610@rhonda.vtc.ru>
	<20100624151848.GD28292@gmail.com>
	<B4EAD150EF8844DDB3676A4A9B08C120@rhonda.vtc.ru>
	<20100625004612.GB27649@gmail.com>
Date: Fri, 25 Jun 2010 14:03:17 +1100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5931
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5931
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: fat031c@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	STOX_REPLY_TYPE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How to select specific version of dependant component
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
X-List-Received-Date: Fri, 25 Jun 2010 03:08:00 -0000
Content-Type: text/plain; format=flowed; charset="ISO-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

> its an override. if you want to know what overrides are read the manual.
> and in future don't top post its not readable flow.

If you look into the OpenEmbedded User Manual yourself smart guy, you will 
probably find that the section "overrides" is a stub.  There is also nothing 
usefull regarding purpose of  '_local' 



