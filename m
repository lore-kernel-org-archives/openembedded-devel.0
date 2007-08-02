Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1IGeF6-0004Bo-7f
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 19:13:44 +0200
Received: from pd9538c5f.dip0.t-ipconnect.de ([217.83.140.95]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1IGeD6-0006sj-GE
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2007 19:11:40 +0200
Message-ID: <46B20FAA.9040402@klever.net>
Date: Thu, 02 Aug 2007 19:08:58 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
In-Reply-To: <46B20D9F.70704@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.1
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2007 17:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>> No matter how soon we can move to sysroot approach, I think making
>> staging resemble filesystem is the right thing to do, anyway...
> 
> Indeed. I suspect most of our packages could handle that (autotools, qmake and distutils
> based ones) easily. The big question is:
> 
>   How are we going to do it?
> 
> Are we going to declare another ".dev is broken" period, a branch, a branch with a small
> amount of packages like org.oe.packaged-staging?

I think you are better acquainted with OE bowels to answer your
question. I'd think that the changes here are rather small (in terms of
files affected), actually and can do without a major breakage, but you
never know...

Love,
H


