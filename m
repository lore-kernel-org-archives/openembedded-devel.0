Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1Pkxla-0005uT-E5
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 12:54:26 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 870441B10C05;
	Thu,  3 Feb 2011 12:03:13 +0000 (UTC)
Message-ID: <4D4A9739.6040909@freyther.de>
Date: Thu, 03 Feb 2011 12:53:29 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch.de>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>	<4D4A6796.1070006@dresearch.de>	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>	<4D4A88FC.3090706@dresearch.de>
	<4D4A91D9.2040406@freyther.de> <4D4A96A0.4080402@dresearch.de>
In-Reply-To: <4D4A96A0.4080402@dresearch.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 11:54:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/03/2011 12:50 PM, Steffen Sledz wrote:

>>
>> find . -name config.log... there will be a config.log...
> 
> You're right. Sorry. It was somewhat hidden in a subdir. See attached file.

Please take a look yourself. config.log is a bit weird, the error is not at
the bottom... but searching for the output of the last test... you will see
the failure...



