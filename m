Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MSniN-0001WD-RQ
	for openembedded-devel@openembedded.org; Mon, 20 Jul 2009 09:55:15 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MSnUv-0002zY-OS
	for openembedded-devel@openembedded.org; Mon, 20 Jul 2009 07:41:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Jul 2009 07:41:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Jul 2009 07:41:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Jul 2009 09:41:10 +0200
Message-ID: <h4172n$f2m$1@ger.gmane.org>
References: <4A6374DB.8020901@balister.org>	<be7a9f3d0907191519w1d7c6179u178e27c10cc09697@mail.gmail.com>
	<4A63CEA0.3050000@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <4A63CEA0.3050000@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: sqlite3 recipe
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
X-List-Received-Date: Mon, 20 Jul 2009 07:55:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-07-09 03:55, Philip Balister wrote:
> Otavio Salvador wrote:
>> Hello,
>>
>> On Sun, Jul 19, 2009 at 4:32 PM, Philip Balister<philip@balister.org>
>> wrote:
>>> Does anyone mind if I push this change? I ran across a package that
>>> needed
>>> an additional header not staged by the current inc file.
>>
>> It looks like you've forgotten the PR bump. In this case would be nice
>> to move it to INC_PR stuff.
>
> Well, for this case only staging changes, not the packaging.

You change the packaged-staging package :) And what Marcin said of 
needing manual intervention.

regards,

Koen



