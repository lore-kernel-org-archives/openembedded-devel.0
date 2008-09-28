Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kjx6y-000358-02
	for openembedded-devel@openembedded.org; Sun, 28 Sep 2008 16:19:02 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Kjx38-0007Vl-SF
	for openembedded-devel@openembedded.org; Sun, 28 Sep 2008 14:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 28 Sep 2008 14:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 28 Sep 2008 14:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 28 Sep 2008 16:11:08 +0200
Message-ID: <gbo39s$9sr$2@ger.gmane.org>
References: <200809272237.22810.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <200809272237.22810.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Sun, 28 Sep 2008 14:19:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-09-2008 22:37, Holger Freyther wrote:
> Hey,
>
> I wonder what is missing until we finally switch to git? From my point of view
> it is:
>
> 	- Finishing this table [1]
> 	- Maybe fixing the script to get this one rev importer properly
> 	- Run the conversation...

* graft on the bk history

regards,

Koen


>
> comments?
> 	z.
>
> PS: In the OM tree I changed base.bbclass to handle git repo's (almost)
> properly for the welcome message.
>
> [1] http://wiki.openembedded.net/index.php/Talk:Monotone_to_Git_ID_mapping




