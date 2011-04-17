Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QBWSD-0005Di-V3
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 20:12:14 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QBWPz-0002BK-MP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 11:09:55 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 17 Apr 2011 11:09:55 -0700
Received: from [172.30.80.170] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 17 Apr 2011 11:09:54 -0700
Message-ID: <4DAB2CEC.1030008@mentor.com>
Date: Sun, 17 Apr 2011 11:09:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <20110414193436.GA26286@denix.org> <4DAA505E.4000305@mentor.com>
	<ioe35g$lb4$1@dough.gmane.org>
In-Reply-To: <ioe35g$lb4$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 17 Apr 2011 18:09:55.0520 (UTC)
	FILETIME=[A7C2B400:01CBFD2A]
Subject: Re: [2011.03-maintenance] Pull request for TI matrix-gui, ipc and sgx/gles
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
X-List-Received-Date: Sun, 17 Apr 2011 18:12:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/17/2011 12:00 AM, Koen Kooi wrote:
> On 17-04-11 04:28, Tom Rini wrote:
>> On 04/14/2011 12:34 PM, Denys Dmytriyenko wrote:
>>> Tom,
> 
>>> Please pull these 5 commits for TI related changes - matrix-gui rev bump,
>>> new ti-ipc version and sgx/gles fixes for ti816x.
>>> All are cherry picked from oe.dev
> 
> 
>>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>>>   Branch: 2011.03-maintenance
>>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
>>> Thanks,
>>>     Denys Dmytriyenko <denys@ti.com>
> 
>> Applied, thanks.
> 
> Tom, can you please unmerge it? The SGX commit is bogus, I have already
> asked Denys to revert it from .dev. I do not want crap like that in
> maintenance.

All of the parts of the merge or just a specific one?

-- 
Tom Rini
Mentor Graphics Corporation


