Received: from 12.98.mail-out.ovh.net ([178.32.114.28]
	helo=98.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QXE3S-0007RB-Pt
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 17:00:22 +0200
Received: from mail26.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by 98.mail-out.ovh.net (Postfix) with SMTP id 5C9E84CE059
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2011 16:50:25 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Jun 2011 16:50:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Jun 2011 16:50:30 +0200
Message-ID: <4DFA1835.5040108@eukrea.com>
Date: Thu, 16 Jun 2011 16:50:29 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1308173139-15748-1-git-send-email-eric@eukrea.com>	<4DF94D6A.8090509@mentor.com>	<BANLkTinmc_Wp-vFoKuRe_LpFdwmVeU8bnQ@mail.gmail.com>
	<4DFA1078.7090808@mentor.com>
In-Reply-To: <4DFA1078.7090808@mentor.com>
X-Ovh-Tracer-Id: 1744581906947485001
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -80
Subject: Re: [PATCH 2011.03] eeze 1.0.0: fix checksums
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
X-List-Received-Date: Thu, 16 Jun 2011 15:00:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tom,

On 16/06/2011 16:17, Tom Rini wrote:
> On 06/15/2011 10:27 PM, Martin Jansa wrote:
>> I guess it won't be repeated with each release.. you can cherry-pick
>> my commit with better commit message explaining what was changed from
>> master (or Eric can send pull request for that, I'm away from my
>> workstation and I'm not using 2010.13)
>>
>> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=79d295c31e64e972608d5dde5d57e6250d7ca77c
>
> Eric, can you please re-submit with a cherry-pick of this?  Thanks!
>
yes I didn't even checked in master for a fix ... I also have a few other 
fixes but needs to test them against master before sending them.

Eric


