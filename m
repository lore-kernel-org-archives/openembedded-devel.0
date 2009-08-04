Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MYFBo-0007sS-0p
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 10:16:08 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7D509220010A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 10:00:35 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id AD8F52200108
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 10:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225074247.adsl.alicedsl.de
	[92.225.74.247]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 10:00:34 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id DD00B3C324; Tue,  4 Aug 2009 10:00:33 +0200 (CEST)
Date: Tue, 4 Aug 2009 10:00:33 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090804080033.GA22504@rhein.zuhause.netz>
References: <576338E6E56E404D801ACFEEF7A09CCE@sg01.cassis>
	<5D625D5E41684E69BBA0964CAD4FAC65@sg01.cassis>
MIME-Version: 1.0
In-Reply-To: <5D625D5E41684E69BBA0964CAD4FAC65@sg01.cassis>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: t1lib QA Issues
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
X-List-Received-Date: Tue, 04 Aug 2009 08:16:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2009 at 09:41:57AM +0800, Leandro Q. Galvez wrote:
> Hello guys,
> 
>    Any ideas on this matter?
> 
> Thanks and best regards,
> Andy
> 

You must convince the buildsystem to accept our LDFLAGS.

Searching either the dev-mailing list or git log with program like qgit,
you would have find the answer your self.

Bye Henning


> <galvez.andy@cassis-intl.com>
> To: <openembedded-devel@lists.openembedded.org>
> Sent: Monday, August 03, 2009 6:59 PM
> Subject: [oe] t1lib QA Issues
> 
> 
> >Hi,
> >
> >   I am trying to build opie-image using openembedded. I am
> >receiving QA Issues with the t1lib having "no GNU_HASH in the elf
> >binary: .../usr/lib/libt1.so.5.0.2" and "no GNU_HASH in the elf
> >binary: .../usr/lib/libt1x.so.5.0.2" and having "non -dev package
> >contains symlink .so: .../usr/lib/libt1x.so" and "non -dev package
> >contains symlink .so: .../usr/lib/libt1.so". Does anybody have any
> >solution for this?
> >
> >Thanks and best regards,
> >Andy
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >


