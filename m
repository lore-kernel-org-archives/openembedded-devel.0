Received: from exprod5og109.obsmtp.com ([64.18.0.188])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nq2p9-0006ve-CW
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 12:14:36 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob109.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS5ohaUJlbd3cJHY9nH3ZAcGMi2Tsg32X@postini.com;
	Fri, 12 Mar 2010 03:11:38 PST
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip09.e2k.ad.ge.com with ESMTP; 12 Mar 2010 06:11:36 -0500
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 12 Mar 2010 06:11:33 -0500
Message-ID: <4B9A2226.7010208@ge.com>
Date: Fri, 12 Mar 2010 11:14:46 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100311131340.20219.23563.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268323892.16526.281.camel@trini-m4400>
In-Reply-To: <1268323892.16526.281.camel@trini-m4400>
X-SA-Exim-Connect-IP: 64.18.0.188
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale mpc8641_hpcn demo board
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
X-List-Received-Date: Fri, 12 Mar 2010 11:14:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Thu, 2010-03-11 at 13:13 +0000, Martyn Welch wrote:
>   
>> A demo board from Freescale, based on the MPC8641D Freescale SOC.
>> ---
>>
>>  conf/machine/mpc8641-hpcn.conf                    |   23 
>>     
>
> I don't see this bringing in a tune file.  I have to admit I forget
> off-hand what mpc86xx maps into, but I'm sure there's some -mcpu for it
> (or will be), and there's always the package arch stuff).
>   
It's an e600 core. None of the current tuning files particularly sprang
out at me. I'm open for suggestions, how important is it?

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



