Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KncNb-00070q-Tv
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 18:59:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KncJ5-0004fi-HF
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 16:54:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 16:54:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 16:54:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Oct 2008 18:54:30 +0200
Message-ID: <gciok7$760$1@ger.gmane.org>
References: <200810080751.15817.zecke@selfish.org>	<200810081303.35934.zecke@selfish.org>
	<gci4to$pcf$1@ger.gmane.org> <200810081757.57676.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <200810081757.57676.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 16:59:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-10-2008 17:57, Holger Freyther wrote:
> On Wednesday 08 October 2008 13:18:16 Koen Kooi wrote:
>
>> The old wiki had one, dunno if the new wiki overlords decided to move it
>> to the new wiki. Ask them.
>
> http://wiki.openembedded.net/index.php/GitPhraseBook
>
> is this any good?

It's a start, but make sure people can paste the actual commands, so 
don't comments in the textbox:

Bad:

  git pull --rebase -- Conflicts from here or something else

Better:

  git pull --rebase # Conflicts from here or something else

Even better:
  # use --rebase to work out conflicts from here or something else
  git pull --rebase

regards,

Koen


>
> z.




