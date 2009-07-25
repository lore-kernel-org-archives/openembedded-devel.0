Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MUgyj-0008HW-Sj
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 15:07:57 +0200
Received: from tamarin.localnet (123-192-154-148.dynamic.kbronet.com.tw
	[123.192.154.148])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 96F5A1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 12:55:16 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jul 2009 14:52:41 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
References: <alpine.LFD.2.00.0907250800110.9021@localhost>
In-Reply-To: <alpine.LFD.2.00.0907250800110.9021@localhost>
MIME-Version: 1.0
Message-Id: <200907251452.41374.holger+oe@freyther.de>
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
X-List-Received-Date: Sat, 25 Jul 2009 13:07:58 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 25 July 2009 14:15:08 Robert P. J. Day wrote:

>   would it not make more sense to have even the "dev" branch come with
> the required version of bitbake embedded in the checkout?  or, failing
> that, just toss that incomplete bitbake directory entirely?

If you look into this directory it will only contain *.pyc files and I don't 
think it makes any sense to put bitbake into the OpenEmbedded repository.

z.


