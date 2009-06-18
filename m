Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MHNjZ-00031C-5z
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 21:57:17 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MHNZJ-0005A1-KC
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 19:46:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 19:46:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 19:46:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Jun 2009 21:46:28 +0200
Message-ID: <h1e5il$snr$1@ger.gmane.org>
References: <37367b3a0906181219s4fc7f87cic3ca34d596fb6150@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <37367b3a0906181219s4fc7f87cic3ca34d596fb6150@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH v3] Add basic support for i.MX27ADS board
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
X-List-Received-Date: Thu, 18 Jun 2009 19:57:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-06-09 21:19, Alan Carvalho de Assis wrote:
> This patch adds basic support on OpenEmbedded for i.MX27ADS board.
>
> It uses the mainline kernel instead Freescale one. The mainline doesn't
> have support for USB, Camera, etc.
>
> Signed-off-by: Alan Carvalho de Assis<acassis@gmail.com>
> ---

>   contrib/angstrom/sort.sh                     |    2 +-

Awesome! Save's me from having to update it :)



