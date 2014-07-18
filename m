Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 5767070612
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 17:05:05 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A2BF3A4A027
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 19:05:02 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C8333A4A026
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 19:05:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de (f053015137.adsl.alicedsl.de
	[78.53.15.137]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 19:05:00 +0200 (CEST)
Date: Fri, 18 Jul 2014 19:04:55 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140718170454.GA23118@mail.itconsulting-heinold.de>
References: <1405695477-16040-1-git-send-email-ross.burton@intel.com>
	<F48900D76F0D8349918584FEEFEB4BCA0614DB4B@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0614DB4B@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: classpath-native do_configure error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 17:05:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 18, 2014 at 03:09:40PM +0000, MONDON Daniel wrote:
> Hi,
> 
> Before git pull, it was ok.
> 
> Thanks
> Daniel.
> 
> 
> checking if /home/me/java/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/ecj-initial works... configure: error: The Java compiler /home/me/java/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/ecj-initial failed (see config.log, check the CLASSPATH?)
> | Configure failed. The contents of all config.log files follows to aid debugging
> | ERROR: oe_runconf failed

Just in the case you did not found that in the config.log

/home/me/java/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/java-initial: 35: exec: cacao-initial-initial: not
found

Bye Henning

