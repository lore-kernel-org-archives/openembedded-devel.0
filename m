Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KuxHH-0006Ej-I2
	for openembedded-devel@openembedded.org; Tue, 28 Oct 2008 23:43:07 +0100
Received: from gandalf.denix.org ([71.255.247.239]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K9H0069V0DOS3I0@vms173001.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Tue, 28 Oct 2008 17:41:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A9E796B83B5; Tue,
	28 Oct 2008 18:41:47 -0400 (EDT)
Date: Tue, 28 Oct 2008 18:41:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <69E6C70090A0A14498CC98FAE5E06B6E3CF4AD@hiob.intern.dresearch.de>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081028224147.GA23369@denix.org>
MIME-version: 1.0
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF4AD@hiob.intern.dresearch.de>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@openembedded.org
Subject: Re: Building u-boot?
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
X-List-Received-Date: Tue, 28 Oct 2008 22:43:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 28, 2008 at 02:12:54PM +0100, Sledz, Steffen wrote:
> My works for OXE810(D)SE are nearly complete. But there is one more 
> question. Is it possible to build u-boot and/or other loaders (the OXE 
> boards uses another stage1 loader if booting from SATA) with OE?

There are many versions and variations of u-boot, as well as some first stage 
bootloaders, like x-load for OMAP...

$ bitbake u-boot

-- 
Denys


