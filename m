Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OgwCy-0003bJ-VF for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:53:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OgwCn-0003hd-10 for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:53:37 +0200
Received: from 83.150.95.26 ([83.150.95.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 10:53:37 +0200
Received: from henri.bragge by 83.150.95.26 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 10:53:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Henri Bragge <henri.bragge@dcombus.com>
Date: Thu, 5 Aug 2010 08:53:29 +0000 (UTC)
Message-ID: <loom.20100805T104704-558@post.gmane.org>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280926084-7605-1-git-send-email-henri.bragge@dcombus.com>
	<AANLkTinnz+cB5Au1hMsniwFbCSjo-EaNWoR=9Xae4krA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 83.150.95.26 (Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100723 Ubuntu/8.04 (hardy) Firefox/3.6.8)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO,SPF_HELO_PASS,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Thu, 05 Aug 2010 08:53:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks <fransmeulenbroeks <at> gmail.com> writes:

> 
> tried to build this, stranded at this:
> 
> ...
> 
> NOTE: oestats: task failed, see
> http://tinderbox.openembedded.net/packages/668019/
> ERROR: TaskFailed event exception, aborting
> 
> No idea what the policy on this is, but I'm not too eager to add all kind of
> certificates to my system
> 

Posted v3, this time with ftp sources. Had forgotten that Deutsche Telekom
(which that certificate is rooted to) was an untrusted authority.

Sorry the hassle, this is my first patch to oe.

- Henri



