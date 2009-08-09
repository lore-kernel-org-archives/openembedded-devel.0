Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Ma7Ie-0008CK-LO
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Aug 2009 14:14:56 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 42B5F1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Aug 2009 12:01:51 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 9 Aug 2009 13:58:21 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
In-Reply-To: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
MIME-Version: 1.0
Message-Id: <200908091358.21434.holger+oe@freyther.de>
Subject: Re: [RFC] change qmake2 to qmake4
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
X-List-Received-Date: Sun, 09 Aug 2009 12:14:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 18 June 2009 19:03:33 Valentin Longchamp wrote:
> As I have already explained in an email earlier today, some tools
> (cmake for instance, with its FindQt4 Module) look for a qmake under
> a certain name (that can be qmake or qmake4 ... but not qmake2).

Kind of nack. 

#qmake-qt4 -v
QMake version 2.01a

z.


