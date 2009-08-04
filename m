Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MYKiw-0003Yu-4T
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 16:11:22 +0200
Received: from tamarin.localnet (unknown [211.48.194.125])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 033F61B10C08
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 13:57:45 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 4 Aug 2009 15:54:56 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.2.98; i686; ; )
References: <91283b620908040642t174a21baif74f986ff3b00f7c@mail.gmail.com>
In-Reply-To: <91283b620908040642t174a21baif74f986ff3b00f7c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908041554.56093.holger+oe@freyther.de>
Subject: Re: Trying to build a console image with qt4-embedded without gles being included
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
X-List-Received-Date: Tue, 04 Aug 2009 14:12:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 04 August 2009 15:42:40 Stuart Gray wrote:
> Hi,
>
> I am trying to build an image with qt4 embedded support. Using recipe qt4/
> qt4-embedded_4.5.2.bb as I have no graphics capabilities on my target
> hardware I do not want to include open GL (gles).

Update?

http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/qt4

has the gles versions moved to disabled... so they should not be used.


z.



