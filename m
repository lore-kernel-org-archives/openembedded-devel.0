Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PqNiN-0005pN-A3
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 11:37:31 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 431B91100427
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:36:19 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E8A95110009B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225146062.adsl.alicedsl.de
	[92.225.146.62]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 11:36:17 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 03EFA3C34C; Fri, 18 Feb 2011 11:35:36 +0100 (CET)
Date: Fri, 18 Feb 2011 11:35:36 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110218103535.GB22771@rhein.zuhause.netz>
References: <AANLkTinKjwaC=aqTE2ouKF1VN-iHccUdOSwLG7CnV=ET@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinKjwaC=aqTE2ouKF1VN-iHccUdOSwLG7CnV=ET@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: is there a virtual/sysvinit to prevent hard-depends on sysvinit?
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
X-List-Received-Date: Fri, 18 Feb 2011 10:37:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 17, 2011 at 01:15:43PM -0700, AJ ONeal wrote:
> Is there a virtual/sysvinit?
> 
> task-proper-tools depends on sysvinit, which conflicts with upstart.
> 
> How could I specify that it should depend on a virtual package?
> 
> AJ ONeal

Hi,

obi(Andreas Oberriter) is working on a upstart. You can find his tree here
http://git.opendreambox.org/?p=obi/openembedded.git;a=log;h=refs/heads/upstart

Bye Henning


