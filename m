Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1S67CU-0002oG-Vt
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 22:18:11 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0431C2232636
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2012 22:09:33 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 678222232635
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2012 22:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052234175.adsl.alicedsl.de
	[78.52.234.175]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2012 22:09:32 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id C09D63C4B9; Fri,  9 Mar 2012 22:09:30 +0100 (CET)
Date: Fri, 9 Mar 2012 22:09:30 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120309210930.GA12854@rhein.zuhause.netz>
References: <2ig0lhu1ti0mhyknnc4ow74t.1331291074225@email.android.com>
	<jjcoo5$1eu$1@dough.gmane.org>
	<D604D5FB4D200642AA2FAAE94E392586017F9D95@CARAMBAR.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <D604D5FB4D200642AA2FAAE94E392586017F9D95@CARAMBAR.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: JavaFX 2.1 Application on X86 and Arm
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
X-List-Received-Date: Fri, 09 Mar 2012 21:18:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 09, 2012 at 03:02:28PM +0100, MONDON Daniel wrote:
> Hi,
> 
> I'm checking if i can translate my (flash player) application into
> JavaFX.
> I've got 2 hardwares : X86 (Ubuntu) and Arm (Angstrom).
> 
> Depending of
> http://docs.oracle.com/javafx/2.0/release_notes_linux/jfxpub-release_not
> es_linux.htm
> I've make a Hello JavaFX application running on X86 (Ubuntu 11.04).
> 
> But i don't found if "JDk 6 update 26 or higher" is implemented on
> Angstrom. I already have a JDK 6 Update 24, but not enought for JavaFX.
> 
> I already have gtk2 2.10.0 : what about gtk2 2.18+?
> 
> Thanks,
> Daniel.

Hi,

you can try the meta-java layer located at https://github.com/woglinde/meta-java which has
icedtea 1.11.1 with openjdk b24.

Bye Henning


