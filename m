Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id ED39765C85
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 14:56:13 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6CCA5D407FB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 15:56:13 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AF790D40369
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 15:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from mail.itconsulting-heinold.de
	(fb-n15-11.unbelievable-machine.net [94.198.62.204])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Feb 2015 15:56:12 +0100 (CET)
Date: Wed, 18 Feb 2015 15:56:10 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150218145609.GD23103@mail.itconsulting-heinold.de>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
	<1423823635.2285.5.camel@Saturn.local.all>
	<F48900D76F0D8349918584FEEFEB4BCA062A05E9@SEXCHANGE0100.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA062A05E9@SEXCHANGE0100.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
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
X-List-Received-Date: Wed, 18 Feb 2015 14:56:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2015 at 02:14:10PM +0000, MONDON Daniel wrote:
> Hi,
> 
> I've got same problem compiling my old openembedded Angstromv2012.05 with changing server date.
> Not on icedtea6-native-1.8.11, but openjdk-6-native.
> I'm checking actually for a date change solution : full compilation is still running (restarted from scratch : more than 12h)
> 
> 
> Checking the new git://git.yoctoproject.org/meta-java as said Henning !
> Impossible to move to dependencies due to distribution customisation (too many work and no success guaranty!).
> 
> 
> Can't I just have a patch, or simply changing sources where this test is done (changing test or dates values) ?
> 
> Thanks,
> Daniel.
> 

git.yocotoproject.org has web frontend so have a look at

http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=58c5f41799bec30a5576137d5477e8ba14a0a802

Bye Henning

