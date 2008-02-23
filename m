Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JT12h-0003kV-Jg
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Feb 2008 21:32:24 +0100
Received: by ug-out-1314.google.com with SMTP id i24so301554ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Feb 2008 12:32:02 -0800 (PST)
Received: by 10.66.243.4 with SMTP id q4mr874207ugh.5.1203798721889;
	Sat, 23 Feb 2008 12:32:01 -0800 (PST)
Received: from widy.localdomain ( [78.164.227.166])
	by mx.google.com with ESMTPS id 18sm1930435ugk.18.2008.02.23.12.31.59
	(version=SSLv3 cipher=OTHER); Sat, 23 Feb 2008 12:32:00 -0800 (PST)
Date: Sat, 23 Feb 2008 22:34:39 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080223223439.528c6997@widy.localdomain>
In-Reply-To: <fppt2j$thh$1@ger.gmane.org>
References: <1203793457.8255.5.camel@dax.rpnet.com>
	<fppt2j$thh$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.175
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Uppercase overrides and parsing speed
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
X-List-Received-Date: Sat, 23 Feb 2008 20:32:24 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 23 Feb 2008 20:44:19 +0100
Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Richard Purdie schreef:
> | Hi,
> |
> | At OEDEM I mentioned that we might have some speed gain if bitbake
> could | more easily tell what constituted an override. All current
> overrides are | lower case and we don't have any in upper case.
> 
> Didn't we also agree that variable names shouldn't include '_' at all?

How is that achievable? LETSUSEITLIKETHIS? Maybe exclude 'A' too? ;-)
Isn't there was a hint that using '_' as an override operator is funky?

> 
> regards,
> 
> Koen

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


