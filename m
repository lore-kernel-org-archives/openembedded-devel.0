Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P0Aol-0002ON-AD
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 12:20:19 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id CFA0B1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 10:23:13 +0000 (UTC)
Message-ID: <4CA06FD8.5040209@freyther.de>
Date: Mon, 27 Sep 2010 18:20:08 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285347950-27040-1-git-send-email-fahad_usman@mentor.com>	<4CA063A4.90608@freyther.de>
	<AANLkTinTEHQVFnYoC=h_WZ1or-wvnuC6W6k_5Nm=xmZt@mail.gmail.com>
In-Reply-To: <AANLkTinTEHQVFnYoC=h_WZ1or-wvnuC6W6k_5Nm=xmZt@mail.gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qmake-native_1.07a.bb: Converted to new style	staging
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
X-List-Received-Date: Mon, 27 Sep 2010 10:20:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/27/2010 05:45 PM, Frans Meulenbroeks wrote:

> 
> Apparently yes:
> 
> qt/qt-x11-free-native_3.3.5.bb:DEPENDS = "qmake-native x11-native"
> uicmoc/uicmoc3-native_3.3.5.bb:DEPENDS = "qmake-native"

good, that is Qt3...


