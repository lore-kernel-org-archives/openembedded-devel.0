Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded-devel@lists.futaris.org>)
	id 1JgX4R-00005K-B5 for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 05:21:59 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id A1A21E42D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 23:21:58 -0400 (EDT)
Received: from web7.messagingengine.com ([10.202.2.216])
	by compute2.internal (MEProxy); Mon, 31 Mar 2008 23:21:58 -0400
Received: by web7.messagingengine.com (Postfix, from userid 99)
	id 79C5E3894C; Mon, 31 Mar 2008 23:21:58 -0400 (EDT)
Message-Id: <1207020118.3961.1245353213@webmail.messagingengine.com>
X-Sasl-Enc: 0QpbrVmwC2we2XknDByySQeJt64+kQFB8Ww7irHDGtVM 1207020118
From: "Hasjim Williams" <openembedded-devel@lists.futaris.org>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface
References: <1204494435.17068.23.camel@utx.utx.cz> <fqg9c0$g00$1@ger.gmane.org>
	<1205992995.25920.1243400709@webmail.messagingengine.com>
	<1206017175.4700.8.camel@hammer.suse.cz>
	<1206051256.5975.1243541279@webmail.messagingengine.com>
	<1206295294.6914.7.camel@utx.utx.cz>
	<1206495575.1924.1244289243@webmail.messagingengine.com>
	<1207009644.9370.1245329833@webmail.messagingengine.com>
In-Reply-To: <1207009644.9370.1245329833@webmail.messagingengine.com>
Date: Tue, 01 Apr 2008 13:21:58 +1000
Subject: Re: iwmmxt optimization on PXA270 (dejagnu test report)
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
X-List-Received-Date: Tue, 01 Apr 2008 03:21:59 -0000
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"


On Tue, 01 Apr 2008 10:27:24 +1000, "Hasjim Williams"
<openembedded-devel@lists.futaris.org> said:
> 
> Joseph S Myers just replied to my post on the gcc mailing list, about
> this:
> http://www.nabble.com/Re%3A-wot-to-do-with-the-Maverick-Crunch-patches--p16397272.html
> 
> gcc 4.2.2 doesn't have the patch for iwmmxt unwind support applied:
> http://gcc.gnu.org/ml/gcc-patches/2007-01/msg00049.html
> 
> It should be in gcc 4.3.0.

We could also go to gcc 4.2.3, as I think the patch is in there.  Also,
gcc-4.2.4 is supposed to be released soon.


