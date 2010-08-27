Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Op0me-0007Pe-0W
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:24:01 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Op0mA-00040Z-JP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 08:23:30 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 27 Aug 2010 08:23:30 -0700
Received: from [172.30.80.146] ([172.30.80.146]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 27 Aug 2010 09:23:29 -0600
Message-ID: <4C77D867.2020306@mentor.com>
Date: Fri, 27 Aug 2010 08:23:19 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>	<i586bt$t12$1@dough.gmane.org>
	<AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
In-Reply-To: <AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
X-OriginalArrivalTime: 27 Aug 2010 15:23:29.0373 (UTC)
	FILETIME=[CD4DD8D0:01CB45FB]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 15:24:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Andrea Adami wrote:
>>>  recipes/udev/udev-compat141_141.bb                 |    6 ++-
>> NAK
>>
> 
> This one is an hack in progress, needed only for Zaurus until 2.6.36
> (hopefully).
> Please keep ;)

Should it be COMPATIBLE_MACHINE'd or so then?

-- 
Tom Rini
Mentor Graphics Corporation


