Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NmRDF-0005nW-SH
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 13:28:36 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id E9A4C16604F2; Tue,  2 Mar 2010 05:25:43 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 65A9D16604EC;
	Tue,  2 Mar 2010 05:25:43 -0700 (MST)
Message-ID: <4B8D03C7.4060404@mlbassoc.com>
Date: Tue, 02 Mar 2010 05:25:43 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a2pre) Gecko/20100211 Shredder/3.2a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B8C53D1.2020000@mlbassoc.com>
	<201003021318.20766.holger+oe@freyther.de>
In-Reply-To: <201003021318.20766.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: ICU on mixed endian setup
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
X-List-Received-Date: Tue, 02 Mar 2010 12:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/02/2010 05:18 AM, Holger Hans Peter Freyther wrote:
> On Tuesday 02 March 2010 00:54:57 Gary Thomas wrote:
>> I'm trying to use ICU on a big endian target, building on a
>> little endian host.  The data files don't seem to be generated
>> for the target's endian mode.
>>
>> Is this correct?
>> Does anyone have experience with this?  Should it work?
>
> Probably not. I added ICU and only tested little on little... :}

Which does work fine, but little build host & big target falls over.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


