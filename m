Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OEWi1-0004W7-OM
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 02:00:28 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OEWe6-0002wA-DJ from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 16:56:22 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 18 May 2010 16:56:21 -0700
Received: from [172.30.80.86] ([172.30.80.86]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 18 May 2010 17:56:21 -0600
Message-ID: <4BF32920.2030904@mentor.com>
Date: Tue, 18 May 2010 16:56:16 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimqvGPoCByYUUUSaFSYLcbA_e7CrZKg-GtIyVzG@mail.gmail.com>
In-Reply-To: <AANLkTimqvGPoCByYUUUSaFSYLcbA_e7CrZKg-GtIyVzG@mail.gmail.com>
X-OriginalArrivalTime: 18 May 2010 23:56:21.0185 (UTC)
	FILETIME=[B702FB10:01CAF6E5]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits]: linux-kexecboot: sed out conflicting getline in scripts/ unifdef.c
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
X-List-Received-Date: Wed, 19 May 2010 00:00:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
> We are discussing about moving this sed to linux.inc in order to fix
> the issue once for all.
> Opinions?

Please do it, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


