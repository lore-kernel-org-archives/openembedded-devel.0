Received: from [85.115.52.190] (helo=cluster-a.mailcontrol.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Matteo.Fortini@mta.it>) id 1M8rh5-0002T5-4d
	for openembedded-devel@openembedded.org; Tue, 26 May 2009 10:07:31 +0200
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly14a.srv.mailcontrol.com (MailControl) with ESMTP id
	n4Q7xOLD017161 for <openembedded-devel@openembedded.org>;
	Tue, 26 May 2009 08:59:26 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mailserver.mta.int with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 26 May 2009 09:59:24 +0200
Received: from [172.26.6.74] (172.26.6.74) by mta-digicas.mta.int
	(172.26.10.8) with Microsoft SMTP Server (TLS) id 8.1.336.0;
	Tue, 26 May 2009 09:59:23 +0200
Message-ID: <4A1BA15A.6080905@mta.it>
Date: Tue, 26 May 2009 09:59:22 +0200
From: Matteo Fortini <matteo.fortini@mta.it>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
References: <4A143640.3040606@mta.it>
	<c384c5ea0905210657k1dea4d73ncfd51c50b74e29c9@mail.gmail.com>
In-Reply-To: <c384c5ea0905210657k1dea4d73ncfd51c50b74e29c9@mail.gmail.com>
X-OriginalArrivalTime: 26 May 2009 07:59:24.0259 (UTC)
	FILETIME=[E2629B30:01C9DDD7]
X-Scanned-By: MailControl A-06-00-00 (www.mailcontrol.com) on 10.65.0.124
Subject: Re: rrdtool fails to build
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
X-List-Received-Date: Tue, 26 May 2009 08:07:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

distro is Angstrom console-image on stable/2009
The target is a ppc-e300c3 (mpc5121)

Regards

Leon Woestenberg ha scritto:
> Hello,
>
> On Wed, May 20, 2009 at 6:56 PM, Matteo Fortini <matteo.fortini@mta.it> wrote:
>   
>> Hi all,
>> I'm trying to build rrdtool on Angstrom on a powerpc target, and it
>> mysteriously fails even before unpacking the sources.
>>
>> If I try to build it manually, I get some ./configure errors about missing
>> ieee math support.
>>
>>     
> Could you be a bit more specific?
>
> Machine, distro?
>
> Regards,
>   



