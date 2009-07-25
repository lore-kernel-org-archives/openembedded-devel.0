Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MUipb-0006qr-Mt
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 17:06:40 +0200
Received: from tamarin.localnet (123-192-154-148.dynamic.kbronet.com.tw
	[123.192.154.148])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1A1CB1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 14:53:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jul 2009 16:51:19 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
	<200907251452.41374.holger+oe@freyther.de>
	<alpine.LFD.2.00.0907250858080.9674@localhost>
In-Reply-To: <alpine.LFD.2.00.0907250858080.9674@localhost>
MIME-Version: 1.0
Message-Id: <200907251651.19932.holger+oe@freyther.de>
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 15:06:41 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 25 July 2009 15:01:20 Robert P. J. Day wrote:

>   for consistency, either bitbake should be included in an OE
> checkout, or it shouldn't.  it shouldn't depend on which branch you're
> working with.  that way lies confusion.


In which way do you see breakage? bin/bitbake is gone when you switch from 
stable to dev? So you executed the host bitbake (which you said was bitbake 
1.8.10). What error happened?


z.


