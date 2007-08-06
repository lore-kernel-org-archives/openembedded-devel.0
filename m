Received: from [72.29.79.205] (helo=rhodos.klever.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1II5XG-0004KH-72
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 18:34:26 +0200
Received: from pd9538d7b.dip0.t-ipconnect.de ([217.83.141.123]
	helo=olympus.klever.net)
	by rhodos.klever.net with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.67) (envelope-from <hacker@klever.net>) id 1II5Us-0003cr-Tk
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2007 18:31:59 +0200
Message-ID: <46B74C34.4050300@klever.net>
Date: Mon, 06 Aug 2007 18:28:36 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 2.0.0.5 (X11/20070731)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>	<46B1FDD8.8000404@klever.net>	<46B20D9F.70704@dominion.kabel.utwente.nl>	<1186093013.6626.57.camel@localhost.localdomain>	<1186132901.5972.314.camel@hammer.suse.cz>	<1186313563.5962.36.camel@localhost.localdomain>	<46B63294.30107@klever.net>
	<1186395310.5972.360.camel@hammer.suse.cz>
In-Reply-To: <1186395310.5972.360.camel@hammer.suse.cz>
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
X-List-Received-Date: Mon, 06 Aug 2007 16:34:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> I am still not sure, how correct will be binaries created by upper
> mentioned wrappers, but it will be for sure better than the
> libtool-level hack. And it's easy to catch remaining references by QA
> scripts.

You mostly make a lot of sense, but sometimes I'm puzzled by your
statements. You're not sure whether binaries will be correct, but for
sure better than correct ones made the way you personally (and for
reason) dislike?


Love,
H


