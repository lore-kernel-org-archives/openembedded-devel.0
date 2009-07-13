Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MQG8g-000254-NY
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 09:39:54 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MQFvw-0004dL-Mf
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 07:26:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 13 Jul 2009 07:26:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Jul 2009 07:26:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 13 Jul 2009 09:26:32 +0200
Message-ID: <h3enj9$3t3$1@ger.gmane.org>
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>	<1247272621-26730-2-git-send-email-msmith@cbnco.com>	<1247272621-26730-3-git-send-email-msmith@cbnco.com>	<h39dju$tfg$1@ger.gmane.org>
	<Pine.LNX.4.64.0907121701300.3621@juice.ott.cti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <Pine.LNX.4.64.0907121701300.3621@juice.ott.cti.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 3/4] hicolor-icon-theme: don't inherit gnome
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
X-List-Received-Date: Mon, 13 Jul 2009 07:39:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-09 23:05, Michael Smith wrote:
> On Sat, 11 Jul 2009, Koen Kooi wrote:

> I'm also setting RDEPENDS_${PN} = "" because I think the RDEPENDS in
> gtk-icon-cache should probably be RDEPENDS_${PN},

it indeed should be RDEPENDS_${PN}

regards,

Koen



