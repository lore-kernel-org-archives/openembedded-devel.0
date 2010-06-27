Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OSs9q-00080u-5i
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Jun 2010 15:44:27 +0200
Received: from [123.192.240.117] (unknown [123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id A5B811B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Jun 2010 13:41:14 +0000 (UTC)
Message-ID: <4C27549E.7040203@freyther.de>
Date: Sun, 27 Jun 2010 21:39:42 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.4) Gecko/20100624 Fedora/3.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1277617168-17482-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1277617168-17482-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt-4.7.0-beta1: upstream tarball was changed, regenerate checksums
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
X-List-Received-Date: Sun, 27 Jun 2010 13:44:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/27/2010 01:39 PM, Martin Jansa wrote:
> * already applied (the change is ok, see diff)
> * sending to list only as heads-up, you can remove old tarball from downloads 
>   (otherwise next rebuild will complain about checksums - but INC_PR was bumped 
>   yesterday so you should seen it soon).

Thanks for doing that analysis..

Signed-off-by: Holger Freyther <zecke@selfish.org>


