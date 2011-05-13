Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QKull-0000HP-5l
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 17:59:13 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QKuj3-00071N-2C from Tom_Rini@mentor.com ;
	Fri, 13 May 2011 08:56:25 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 13 May 2011 08:54:26 -0700
Received: from [172.30.80.18] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Fri, 13 May 2011 08:56:24 -0700
Message-ID: <4DCD54A7.3080407@mentor.com>
Date: Fri, 13 May 2011 08:56:23 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<4DCBF7E3.5030504@mentor.com>
	<201105131144.27612.paul.eggleton@linux.intel.com>
In-Reply-To: <201105131144.27612.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 13 May 2011 15:54:26.0829 (UTC)
	FILETIME=[096C63D0:01CC1186]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Update qt to 4.7.3
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
X-List-Received-Date: Fri, 13 May 2011 15:59:13 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/13/2011 03:44 AM, Paul Eggleton wrote:
> On Thursday 12 May 2011 16:08:19 Tom Rini wrote:
>> Any idea if this fixes all of the arches that moving to 4.7.2 broke
>> (anything not arm or x86, more or less) ?  Thanks.
> 
> Which arches specifically didn't build for you? I have at least managed to 
> build 4.7.3 for x86-64 and MIPS (with oe-core that is).

In openembedded.master, mips*, ppc and sh4 don't compile past 4.7.1 but
I don't have the exact error handy (I think it was some dependency
library didn't support the arch).

-- 
Tom Rini
Mentor Graphics Corporation


