Received: from [72.14.220.152] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRRkD-0006ZK-DY
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 13:38:47 +0100
Received: by fg-out-1718.google.com with SMTP id 13so2095618fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 04:37:58 -0800 (PST)
Received: by 10.82.107.15 with SMTP id f15mr12399672buc.9.1203424678190;
	Tue, 19 Feb 2008 04:37:58 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id z37sm14136313ikz.1.2008.02.19.04.37.53
	(version=SSLv3 cipher=OTHER); Tue, 19 Feb 2008 04:37:57 -0800 (PST)
Date: Tue, 19 Feb 2008 14:38:18 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20080219143818.7e62fa44@widy.localdomain>
In-Reply-To: <E1JRMHZ-0002K4-Sk@linuxtogo.org>
References: <E1JRMHZ-0002K4-Sk@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev ipkg: Enable debian revision comparing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2008 12:38:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 19 Feb 2008 07:48:49 +0100
"rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:

> ipkg: Enable debian revision comparing
> 
> Author: rpurdie@openembedded.org
> Branch: org.openembedded.dev
> Revision: d4732f85d42b87e990dd3cdfed1c9d40f04ff5e8
> ViewMTN:
> http://monotone.openembedded.org/revision/info/d4732f85d42b87e990dd3cdfed1c9d40f04ff5e8
> Files: 1
> packages/ipkg/files/enable_debversion.patch
> packages/ipkg/files/update_version_comparision.patch
> packages/ipkg/ipkg-native_0.99.163.bb
> packages/ipkg/ipkg.inc
> packages/ipkg/ipkg_0.99.163.bb

It's nice to see ipkg to be cleaned up, but I wonder how scalable is
this? How this relates to opkg effort? I'm sure there's some plan,
but I happen to not know about it (== it's wasn't mentioned on
oe-devel), so would be nice to get some insight ;-).


[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


