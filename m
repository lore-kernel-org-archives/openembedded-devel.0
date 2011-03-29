Received: from cortex1.nebelhauch.de ([213.133.111.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian@whisper-net.de>) id 1Q4ZpJ-0004V4-0V
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 16:23:21 +0200
Received: by cortex1.nebelhauch.de (Postfix, from userid 65534)
	id D7F38E6B30; Tue, 29 Mar 2011 16:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	cortex1.nebelhauch.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
	autolearn=unavailable version=3.3.1
Received: from localhost (localhost [127.0.0.1])
	by cortex1.nebelhauch.de (Postfix) with ESMTP id BD75FE6B2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 16:22:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at nebelhauch.de
Received: from cortex1.nebelhauch.de ([127.0.0.1])
	by localhost (cortex1.nebelhauch.de [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id XBdrdhh1Vycu
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 16:22:13 +0200 (CEST)
Received: from nebelhauch.de (cortex1.nebelhauch.de [213.133.111.172])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by cortex1.nebelhauch.de (Postfix) with ESMTPSA id 9FFEDE6B28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 16:22:13 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 29 Mar 2011 16:22:13 +0200
From: Julian Pietron <julian@whisper-net.de>
To: <openembedded-devel@lists.openembedded.org>
In-Reply-To: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
References: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
Message-ID: <a1c26f70a687295bb95b52fa3f856755@nebelhauch.de>
X-Sender: julian@whisper-net.de
User-Agent: Roundcube Webmail/0.4.2
Subject: Re: do_compile of gcc-cross-sdk-4.5 fails with -mfloat-abi=hard
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
X-List-Received-Date: Tue, 29 Mar 2011 14:23:21 -0000
Content-Type: text/plain;
 charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

 On Tue, 29 Mar 2011 15:33:11 +0200, Julian Pietron 
 <julian@whisper-net.de> wrote:
> Currently I'm trying to build with ARM_FP_MODE="softfp" to see
> whether the problem persists, but I don't think so as it seems to be
> related to the VFP instructions.

 As expected, a build in softfp mode works without errors and completes 
 successfully.

 Best regards,
 Julian


