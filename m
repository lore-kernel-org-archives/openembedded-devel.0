Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LppY0-0000Qm-V0
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 21:59:31 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LppVV-000LdC-EX
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 23:56:53 +0400
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Apr 2009 23:54:43 +0400
User-Agent: KMail/1.9.9
References: <1238753080-8005-1-git-send-email-khimov@altell.ru>
	<20090403190650.GA29161@gmail.com>
In-Reply-To: <20090403190650.GA29161@gmail.com>
Organization: Altell Ltd.
MIME-Version: 1.0
Message-Id: <200904032354.43251.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_20,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ace: New recipe for ACE 5.6.8
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
X-List-Received-Date: Fri, 03 Apr 2009 19:59:31 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 03 April 2009 23:06:50 Khem Raj wrote:
> > +LICENSE = "BSD + others"
>
> I think listing all licenses here would be better. Others is too vague.

Well, it's vague as it is in sources. It is kinda-BSD with gperf GPL2+ with 
more BSD-style additions with zlib thrown in and mixed with 3+ more free 
software license, some of them are BSD-like and some are not. Take a look at 
Debian's copyright file and you'll get the idea:

http://packages.debian.org/changelogs/pool/main/a/ace/ace_5.6.3-5/libace-5.6.3.copyright

I just don't know how to handle it better. Maybe just call it "ACE license" 
and let anyone interested dig that details themselves?


