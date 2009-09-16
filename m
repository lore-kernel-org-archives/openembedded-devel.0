Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mnz5W-0005y3-Ry for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 20:18:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Mnz51-0003ap-0w
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Sep 2009 20:18:11 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 20:18:11 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2009 20:18:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Sep 2009 20:17:48 +0200
Message-ID: <h8ra4c$o1k$1@ger.gmane.org>
References: <4AB0BBA2.8030607@iki.fi>
	<f96d234e0909160548r3ec9a8c8r2c27c29910203401@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <f96d234e0909160548r3ec9a8c8r2c27c29910203401@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] armv5te mentioned twice on eabi-capable list
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
X-List-Received-Date: Wed, 16 Sep 2009 18:18:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-09-09 14:48, Cliff Brake wrote:
> On Wed, Sep 16, 2009 at 6:19 AM, Aleksandr Koltsoff<czr@iki.fi>  wrote:
>> (My first patch generated with git, please be gentle :-).
>>
>> armv5te is mentioned twice in the arm_eabi_supporting_arches list of
>> sane-toolchain.inc. Remove the latter occurance.
>
> Looks good.  I'll let Khem or some who is more familiar with toolchains apply.
>
> One suggestion, we have a commit policy
> (http://wiki.openembedded.net/index.php/Commit_Policy), so if you
> follow that on future patches, we can directly git-am your patches and
> push them with no extra work.
>
> So the commit message for this might be:
>
> sane-toolchain.inc: remove extra armv5te in eabi-capable list
>
> This allows people to very quickly get an idea what this patch applies
> to, and makes for nice formatting in the weekly change logs.

Note that in general we don't like putting the filename in the commit 
message.

regards,

Koen



