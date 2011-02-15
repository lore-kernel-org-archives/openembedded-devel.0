Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PpS0Y-0004aV-JG
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 22:00:26 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PpRzP-0005SE-Ef from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 12:59:15 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 12:59:14 -0800
Received: from [172.30.80.148] ([172.30.80.148]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 15 Feb 2011 13:59:14 -0700
Message-ID: <4D5AE920.6000004@mentor.com>
Date: Tue, 15 Feb 2011 13:59:12 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>
	<4D516F8B.4090703@gmail.com>	<4D5953C5.3080605@mentor.com>
	<AANLkTik8Wpc9ejLHmYoe4q6QD0K9Wot9REeGXW=g2eOS@mail.gmail.com>
In-Reply-To: <AANLkTik8Wpc9ejLHmYoe4q6QD0K9Wot9REeGXW=g2eOS@mail.gmail.com>
X-OriginalArrivalTime: 15 Feb 2011 20:59:14.0389 (UTC)
	FILETIME=[33B85850:01CBCD53]
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 15 Feb 2011 21:00:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/15/2011 01:50 PM, Cliff Brake wrote:
> On Mon, Feb 14, 2011 at 11:09 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>> qt4e-demo-image fails in both cases due to the image not being happy with
>> qt4-4.6.x and only 4.7.x (see my emails to the list the other week).
>
> qt 4.7.1 demo images built fine for me on the release branch.  Does
> angstrom want to consider using 4.7.1 for the release?  Does anyone
> still require 4.6.x?

angstrom-2008.1 and kaeilos both lock on 4.6.x and it's not hard to fix. 
  The "just don't try xmlpattern stuff" option I outlined before is 
working for me now for -x11 and qt4e image is building now.

-- 
Tom Rini
Mentor Graphics Corporation


