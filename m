Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NAskv-0001Kb-N2
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 23:12:08 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 5BC421100121
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 23:10:40 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CDE4611000DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 23:10:39 +0100 (CET)
Received: from rhein.familie-heinold.de (unknown [78.52.228.212])
	by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 23:10:39 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 87DCA3C10C; Wed, 18 Nov 2009 23:10:38 +0100 (CET)
Date: Wed, 18 Nov 2009 23:10:38 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091118221038.GA5464@rhein.zuhause.netz>
References: <he0ijk$kqa$2@ger.gmane.org> <20091118114113.GC2919@mx.loc>
	<c384c5ea0911180344u7aa5a29ao71528ff23547643e@mail.gmail.com>
	<20091118123012.GD2919@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20091118123012.GD2919@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert of 406cd0fee12ad99ba6d6f7d55f743cc4c6697955
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
X-List-Received-Date: Wed, 18 Nov 2009 22:12:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bernhard,

thanks for the patch, but _exit is not the problem. Problem is crappy iconv stuff.
But I will fix it now the right way.

Bye Henning


