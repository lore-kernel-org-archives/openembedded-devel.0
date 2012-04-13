Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SIkMQ-0006gc-Ax
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 19:32:38 +0200
Received: by qafl39 with SMTP id l39so6144575qaf.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=LDwzYdGCs5Dzk02/3XZD0D7wjRVkrYey/Ro7u6BFv5U=;
	b=mdfrRedBCKQl72slEtn//314CeU0BtV/ImKB/v0vtxClffPQ+YGXZxzBk57uQpqNxb
	VqiCNTxPTw5VoFIKjWy8uL1wB0BY5EnyzE3IkciXfwWsHsmukvOr42unG/51e+ELelpl
	3Rrbr0Gmo24yAmjTYWsEl2ZZSsYYN24A3sj//h//c8nhCtv1WRJ/f8R5ukJSv/9RLYj0
	R/0KI680q5qQR8AkWfzuzBiiqM7eDJGGUr49RS9p9ZVTzqc6Jrk3nErum9500kRj0VXB
	e43BkqQo+DhnSeDxfUzJsf91iXoAImGMAHwXtRAisSJ8b6DfCCFLlza1GhrWz4k7Kanr
	UWGw==
Received: by 10.224.221.75 with SMTP id ib11mr3815667qab.21.1334337796313;
	Fri, 13 Apr 2012 10:23:16 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id i8sm18546246qah.4.2012.04.13.10.23.12
	(version=SSLv3 cipher=OTHER); Fri, 13 Apr 2012 10:23:15 -0700 (PDT)
Message-ID: <4F8860F4.8050002@gmail.com>
Date: Fri, 13 Apr 2012 10:23:00 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: libxcursor-1.1.12.bbappend
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
X-List-Received-Date: Fri, 13 Apr 2012 17:32:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I just updated hoping it would help with another build issue I am having 
and after the update I can no longer build anything I always get the error.
ERROR: No recipes available for:
   
/home/beagle/OE/setup-scripts/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
ERROR: Command execution failed: Exited with 1

Anyone know how to fix this? The append is there but the recipe it is 
appending is not. Either that or I can not find it. I only see 1.1.13.bb 
but not the 1.1.12.bb and both appends are there.

Thanks.


