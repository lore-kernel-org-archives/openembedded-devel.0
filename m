Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LVqLo-00030a-Ne
	for openembedded-devel@openembedded.org; Sat, 07 Feb 2009 17:48:17 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LVqLI-0001fh-FU
	for openembedded-devel@openembedded.org; Sat, 07 Feb 2009 16:47:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 07 Feb 2009 16:47:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 07 Feb 2009 16:47:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 07 Feb 2009 17:47:35 +0100
Message-ID: <gmkdv7$cbc$1@ger.gmane.org>
References: <3ea34a000902070825j48291819x61976d871da422d@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <3ea34a000902070825j48291819x61976d871da422d@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: c compiler cannot create executables (do_configure, gettext-native-0.17-r3)
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
X-List-Received-Date: Sat, 07 Feb 2009 16:48:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-02-09 17:25, Christopher Friedt wrote:
> Hi everyone,
>
> I've run into a configure error that I'm not quite sure how to fix -
> it could have something to do with ccache, and I've tried clearing out
> my cache already, but that hasn't worked. It's for a 'new' machine,
> but I've essentially just copied the aximx50.conf and renamed it to
> cl9400.conf (also added the relevent parts according to
> http://wiki.openembedded.net/index.php/Adding_a_new_Machine).
>
> What's really odd, is that I've gone into the specified build directly
> directly after it apparently fails, taken the exact ./configure
> command from config.log, and run it without any errors showing up.
>
> I would appreciate if anyone would like to offer some advice - please
> see the build log below.

check config.log in ${S} to see what the actual error is.

regards,

Koen



