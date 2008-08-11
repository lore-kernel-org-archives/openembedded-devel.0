Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KSUg9-00008y-GE
	for openembedded-devel@openembedded.org; Mon, 11 Aug 2008 12:31:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KSUfi-0002Mo-7i
	for openembedded-devel@openembedded.org; Mon, 11 Aug 2008 10:30:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 11 Aug 2008 10:30:42 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 11 Aug 2008 10:30:42 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Aug 2008 12:30:32 +0200
Message-ID: <g7p4c8$6ol$1@ger.gmane.org>
References: <g7f0tb$n8m$1@ger.gmane.org> <g7mpug$ifp$1@ger.gmane.org>
	<48A0077C.1000201@kernelconcepts.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080700)
In-Reply-To: <48A0077C.1000201@kernelconcepts.de>
Sender: news <news@ger.gmane.org>
Subject: Re: oe.net down
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
X-List-Received-Date: Mon, 11 Aug 2008 10:31:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Florian Boor wrote:
> Hi,
>
>> http://git.linuxtogo.org/ (once the gitweb config gets updated)
>
> gitweb will pick it up automatically if you create the magic file
> 'git-daemon-export-ok' in the repository. See:
> http://www.kernel.org/pub/software/scm/git/docs/git-daemon.html

I know, the cron job had to pick it up :)

regards,

Koen

angstrom@serenity:~/openembedded.git$ ls git-daemon-export-ok  -la
-rw-r--r-- 1 angstrom angstrom 0 2008-08-10 11:05 git-daemon-export-ok



