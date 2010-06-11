Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OMxFi-00013C-A1
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 07:58:03 +0200
Received: from [123.192.240.117] (123-192-240-117.dynamic.kbronet.com.tw
	[123.192.240.117])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 1EAEC1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 05:53:47 +0000 (UTC)
Message-ID: <4C11CF60.5060106@freyther.de>
Date: Fri, 11 Jun 2010 13:53:36 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Lightning/1.0b1
	Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1276200457-11650-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1276200457-11650-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] navit: enable qml build
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
X-List-Received-Date: Fri, 11 Jun 2010 05:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/11/2010 04:07 AM, Martin Jansa wrote:
> * but for now without DEPENDS on qt4-x11-free, because 4.7.0 is not yet
>   released and building qt4-x11-free just because of navit (for someone
>   not using it for something else) takes a lot of time

I might not understand everything here, but this looks dangerous. A
package rebuild should always generate the same kind of package.


