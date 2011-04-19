Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1QCAND-0003tF-GF
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:49:44 +0200
Received: (qmail 31819 invoked by uid 1003); 19 Apr 2011 12:47:10 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.165.110)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Apr 2011 12:47:10 -0000
Message-ID: <4DAD844D.7050800@balister.org>
Date: Tue, 19 Apr 2011 08:47:09 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1303169791-19354-1-git-send-email-schnitzeltony@gmx.de>
	<iojkf6$aka$2@dough.gmane.org>
In-Reply-To: <iojkf6$aka$2@dough.gmane.org>
Subject: Re: [PATCH v3] u-boot_overo: current version does not boot / read expansion board ID.
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
X-List-Received-Date: Tue, 19 Apr 2011 12:49:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2011 05:25 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 19-04-11 01:36, Andreas Mueller wrote:
>> Patches&  settings were taken from [1] / branch overo.
>> For more informations see [2].
>>
>> Tests performed:
>> * boot kernel 2.6.37 from SDCard
>> * boot kernel 2.6.30 from NAND
>> * variable manipulations setenv printenv savenv
>> * NAND erase
>
> NAK, you're going back to an older version without saying why.

Upstream u-boot should have the expansion patch in already.

Philip


