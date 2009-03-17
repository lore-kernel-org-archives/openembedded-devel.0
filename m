Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjnZk-0003bM-0T
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 05:40:25 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGO006GP0T0VPB0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Mar 2009 14:29:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0C2176B83A8; Tue,
	17 Mar 2009 15:29:24 -0400 (EDT)
Date: Tue, 17 Mar 2009 15:29:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090317192924.GB15734@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
	<49BFB6D8.5060804@student.utwente.nl>
MIME-version: 1.0
In-reply-to: <49BFB6D8.5060804@student.utwente.nl>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=AWL,BAYES_00,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier	agreement
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
X-List-Received-Date: Wed, 18 Mar 2009 04:40:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 17, 2009 at 03:42:32PM +0100, Koen Kooi wrote:
> On 17-03-09 00:32, Denys Dmytriyenko wrote:
>> Renaming packages/ directory to recipes/, as one of the several structural
>> changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
>> currently doesn't have time/ability to do the change, and some people are
>> too eager to wait any longer, he asked me to do it. Please ack/nack.
>>
>> [1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>>
>> Denys Dmytriyenko (3):
>>    rename packages/ to recipes/ per earlier agreement
>>    recipes: fix hardcoded instances of packages/
>>    base.bbclass: fix base_get_scmbasepath() to look for recipes/ and
>>      fall back to packages/ while parsing BBFILES
>
> Acked-By: Koen Kooi <koen@openembedded.org>
>
> Now, if you use patchwork, these acks and SOBs get added to your patch 
> automagically :)

Cool! I guess I need to take a look at it some time...

-- 
Denys


