Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1L0hmU-0004Nh-6F
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2008 20:23:06 +0100
Received: (qmail invoked by alias); 13 Nov 2008 19:21:00 -0000
Received: from p54BD81C9.dip0.t-ipconnect.de (EHLO [192.168.178.34])
	[84.189.129.201]
	by mail.gmx.net (mp055) with SMTP; 13 Nov 2008 20:21:00 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX19xgGhTq+Fx2Ao5xda/u1FM+mLSY86w/qcKtiMSJX
	dauNAe+ZToTElZ
Message-ID: <491C7E1A.2020308@gmx.de>
Date: Thu, 13 Nov 2008 20:20:58 +0100
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49251.80.246.32.33.1226575168.squirrel@intern.netexpress.de>	<491C1379.2090404@gmx.de>
	<87hc6b4njt.fsf@neumann.lab.ossystems.com.br>
In-Reply-To: <87hc6b4njt.fsf@neumann.lab.ossystems.com.br>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.73
Subject: Re: Issues with the system startup when the IMAGE_TYPE is	squashfs
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
X-List-Received-Date: Thu, 13 Nov 2008 19:23:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Otavio Salvador schrieb:
> Thomas Kunze <thommycheck@gmx.de> writes:
>
>   
>> I did this some time ago: http://bugs.openembedded.net/show_bug.cgi?id=3714
>> I guess you can do something like this with /etc/volatile.cache too.
>>     
>
>   
I don't have time for working on OE atm.
> Are you interested in making the changes that were suggest in the bug
> report to allow us to merge it?
>
>  - move it to update-modules-cross
>   
This is just a simple rename.
>  - make it a distro option; not a requirement
>
>   
I don't agree with that. It really don't see how this patch could break 
images. If it works I see no reason why any distro doesn't want to have 
this.



