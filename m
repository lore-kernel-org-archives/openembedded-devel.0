Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PIWiX-0000ZE-8n
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 02:21:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id ED8D96C1163
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 20:20:40 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28339-07 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 16 Nov 2010 20:20:40 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id ADA4E699B33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 20:20:36 -0500 (EST)
Date: Tue, 16 Nov 2010 20:20:36 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinUSpYzmuhaGmN23m8ahMdSCVLnjnwr=N=+13Nr@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1011162019220.5082@juice.ott.cti.com>
References: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
	<1289414144-18181-2-git-send-email-msmith@cbnco.com>
	<AANLkTinUSpYzmuhaGmN23m8ahMdSCVLnjnwr=N=+13Nr@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] smpeg: configure with --disable-rpath
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
X-List-Received-Date: Wed, 17 Nov 2010 01:21:46 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 16 Nov 2010, Khem Raj wrote:

> On Wed, Nov 10, 2010 at 10:35 AM, Michael Smith <msmith@cbnco.com>wrote:
>> Otherwise libtool and ld try to link against ${libdir}/libdl.so.2 on the
>> host system.

> Does it happen with libtool 2.4 as well ?

Yes, it does.

Mike


