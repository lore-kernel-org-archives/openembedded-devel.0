Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Kjhfz-0002b9-Bf
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 23:50:08 +0200
Received: (qmail invoked by alias); 27 Sep 2008 21:46:13 -0000
Received: from p54BDBED3.dip0.t-ipconnect.de (EHLO [192.168.178.34])
	[84.189.190.211]
	by mail.gmx.net (mp039) with SMTP; 27 Sep 2008 23:46:13 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1+YmsYRiEWYBmqvm6HYNiYCzNdl10tsJsQWyE1RhV
	WDBx0fHDrK3H7G
Message-ID: <48DEA994.2030607@gmx.de>
Date: Sat, 27 Sep 2008 23:45:56 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200809272237.22810.zecke@selfish.org>
	<48DE9EE0.8090000@balister.org>
In-Reply-To: <48DE9EE0.8090000@balister.org>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.72
Subject: Re: git conversion and what is missing?
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
X-List-Received-Date: Sat, 27 Sep 2008 21:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister schrieb:
> Holger Freyther wrote:
>> Hey,
>>
>> I wonder what is missing until we finally switch to git? From my 
>> point of view it is:
>>
>>     - Finishing this table [1]
NOTE: This table contains not only the people that have commit access 
but everybody who has contibuted something. We
should keep this in mind before running some scripts that give access to 
the git repository.
>>
>
> How do we do this? In some cases the name is in the email address, but 
> what about the rest?
IMO we should just disable commit access for people who didn't bother to 
add their e-mail address. If they come back to oe later
we can reenable the accounts.

Regards,
Thomas


