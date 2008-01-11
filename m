Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JDPwM-0008NI-Cg
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2008 20:53:18 +0100
Received: from PROMETHEUS (e180135008.adsl.alicedsl.de [85.180.135.8])
	by drlauer-research.com (Postfix) with ESMTP id 5F254584BD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 20:55:15 +0100 (CET)
Date: Fri, 11 Jan 2008 20:53:02 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1012499733.20080111205302@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0801111024x6ff82825g1273e20694d95794@mail.gmail.com>
References: <4785F736.5050707@student.utwente.nl>
	<200801101221.53018.zecke@selfish.org>
	<478605A1.5030209@student.utwente.nl>
	<478606DB.7060501@balister.org>
	<c384c5ea0801111024x6ff82825g1273e20694d95794@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: a5c7b007eaa675cc904f5285291d2f8a597efc84
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2008 19:53:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Hello,

> On Jan 10, 2008 12:51 PM, Philip Balister <philip@balister.org> wrote:
>> I have gfortran installed already (must be the engineer in me) and I
>> also had to add the ugly hack in bug 3363.
>>
>> Koen is right, there is something funny going on.
>>
> Yup.

> Why don't we revert the changes then?

I have reverted the change to sanity.bbclass.

> Temporarely raising the host requirements is not a nice work around.

Agreed. Folks, please try to fix it differently.

Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



