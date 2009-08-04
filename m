Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MYDqS-0007fa-2b
	for openembedded-devel@openembedded.org; Tue, 04 Aug 2009 08:50:02 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MYDbQ-00009v-ES
	for openembedded-devel@openembedded.org; Tue, 04 Aug 2009 06:34:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 04 Aug 2009 06:34:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 04 Aug 2009 06:34:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 04 Aug 2009 08:34:14 +0200
Message-ID: <h58kp7$h6o$1@ger.gmane.org>
References: <20090803205909.GA24609@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090716 Shredder/3.0b4pre
In-Reply-To: <20090803205909.GA24609@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Renaming gcc 4.4.0 to 4.4.1
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
X-List-Received-Date: Tue, 04 Aug 2009 06:50:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03-08-09 22:59, Khem Raj wrote:
> Hi
>
> Now that gcc 4.4.1 is out I would like to add the recipe but if gcc
> 4.4.0 is not been used then I would prefer to move gcc 4.4.0 to 4.4.1
> and reduce a few recipes.
>
> If no one objects I will go ahead with moving them next week

Don't forget to add the patch from 
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=40887 if you do.

regards,

Koen



