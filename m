Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OBrYI-0007O0-7w
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 17:39:22 +0200
Received: from [172.16.252.132] (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 7AB261B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 15:43:12 +0000 (UTC)
Message-ID: <4BE97940.7030404@freyther.de>
Date: Tue, 11 May 2010 23:35:28 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Lightning/1.0b1
	Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6E4816EA-E232-4559-BA26-E62F885B0644@bolloretelecom.eu>
In-Reply-To: <6E4816EA-E232-4559-BA26-E62F885B0644@bolloretelecom.eu>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trolltech FTP -> Nokia HTTP
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
X-List-Received-Date: Tue, 11 May 2010 15:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/11/2010 09:28 PM, Adrien Demarez wrote:
> Hi all,
> 
> Most products from Trolltech still have their SRC_URI pointing to ftp://ftp.trolltech.com.
> Since Trolltech was bought by Nokia, everything now hosted on http://get.qt.nokia.com/, with the same directory structure. Although the legacy Trolltech FTP is still working, the downloads on http://get.qt.nokia.com/* are much faster, and also probably more reliable in the long term. Thus I propose to change the SRC_URI of all Trolltech softwares (e.g. QT...) as described in the attached patch (of course, the checksums do not change).

You missed the patch? But the proposal sounds sane.


