Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spi7A-0007wE-S3
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 17:49:18 +0200
Received: by wgbdr1 with SMTP id dr1so3060914wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 08:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6k5iZhD/fBi320SFt0K1fRsT5MHFwQ99iYx81wiPEsE=;
	b=YXZaopnTdOv8J0QlXgsuoLoXJOK1EwgdypSqyAovpg8XbRHDkZYoTUitzoYbK1pMT6
	pnocVWtOm8HXHsFPN1T5tSqV46G1I4v9XxPndTIeLFbxtjwE5X5sdNuFN8c5B3+i8Ppu
	BRnG6Vzulg3iUPuSdutridcSN3FTLLoJw07SYOGqkeEjAMguku2rbWz1Lt1co/bwj5r7
	Wt1YT0BXW3x0iHdJjUX+A62W3T6eQJ1nRo7+w/Vhe795hxwbBN/l4T9N6MLg5xlgzXLU
	cjqPd0GLfqYNhiHJym6AfK5rYh7t5b/tqIkLObcq8RMQvHBsBzPRAvPN3kwWYaD0xbXB
	ZJgg==
Received: by 10.180.81.193 with SMTP id c1mr5113727wiy.12.1342193874467;
	Fri, 13 Jul 2012 08:37:54 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id ep14sm4229288wid.0.2012.07.13.08.37.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 08:37:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4461686.rdlsglFAG9@helios>
Date: Fri, 13 Jul 2012 17:37:47 +0200
Message-Id: <3797A80A-708E-422C-B501-ADDB47AD4541@dominion.thruhere.net>
References: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
	<4461686.rdlsglFAG9@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlfudbIx1Xc4PIfg4EIC0PBCFVkjjrFR0Hh3n4BZ0RMx385ENOfmU/Tsoma0kFkEbCBStF4
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH] various: update ; proto= to ; protocol= in SRC_URI
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
X-List-Received-Date: Fri, 13 Jul 2012 15:49:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 13 jul. 2012, om 17:35 heeft Paul Eggleton het volgende geschreven:

> On Friday 13 July 2012 17:26:45 Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> Just checking, you're aware that for the svn fetcher this will break with 
> older versions of bitbake that don't have the recent patch applied?
> 
> If that's not a concern, no problem.

Not a concern for meta-oe master, only for release branches :)


