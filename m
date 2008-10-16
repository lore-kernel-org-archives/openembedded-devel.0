Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqWkP-0000Sb-CO
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 19:34:53 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqWkO-0006Fl-7K
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 17:34:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 17:34:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 17:34:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Oct 2008 19:34:43 +0200
Message-ID: <gd7tvk$69e$1@ger.gmane.org>
References: <gd7lda$3bi$1@ger.gmane.org>
	<871vygv5fo.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <871vygv5fo.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: Commit policy violations
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
X-List-Received-Date: Thu, 16 Oct 2008 17:34:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-10-2008 19:02, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> Hi,
>>
>> We have had a commit policy for some years now, so it would be nice if
>> people would actually stick to it.
>>
>> So don't do things like this:
>>
>> "[PR] Change PR to FILE_PR and intro PR as FILE_PR + DISTRO_PR"
>>
>> or
>>
>> "[hal] Add latest hal and hal-info"
>>
>> or
>>
>> "add task-fonts-truetype"
>>
>> Those 3 are all *bad*.
>
> Could you explain which would be the good ones?

The git phrasebook has the format:

http://wiki.openembedded.net/index.php/GitPhraseBook

Examples of decent commit messages from today[1]:

"hal_0.5.11.bb : add new version from OM branch"

"xmms: add sed magic to fix builds with gettext > 0.14.0"

"hal 0.5.11: move to nonworking:
* autoreconf fails
* after fixing that it doesn't build"

regards,

Koen

[1] That sentence no verb!




