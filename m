Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Ltn6q-0005rM-DS
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 20:11:51 +0200
Received: from gandalf.denix.org ([71.255.242.201]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI3001QMROV037E@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	14 Apr 2009 13:07:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 351C56B83A8; Tue,
	14 Apr 2009 14:07:43 -0400 (EDT)
Date: Tue, 14 Apr 2009 14:07:43 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090414180743.GC28306@denix.org>
References: <91b13c310904140143v20312bdagc7ac724a8ac02617@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <91b13c310904140143v20312bdagc7ac724a8ac02617@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AWL,BAYES_50,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems on openembedded/conf/checksums.ini
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
X-List-Received-Date: Tue, 14 Apr 2009 18:11:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 14, 2009 at 04:43:32PM +0800, Cheng Renquan wrote:
> Hello, all:
>   I don't really understand why there is absolute path of checksums in
> openembedded/conf/checksums.ini, such as
> 
> [ftp://ftp.gnu.org/gnu/m4/m4-1.4.12.tar.gz]
> md5=0499a958a561781b125c740f18061ea8
> sha256=47e8f9a33ba06fa6710b42d6f6ded41f45027f6f4039b0a3ed887c5116bc2173
> 
> the absolute path m4-1.4.12.tar.gz even includes the site base and the path,
> I don't know why and how to avoid that,

It's a hot topic here. One of the recent discussions:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/21067

-- 
Denys


